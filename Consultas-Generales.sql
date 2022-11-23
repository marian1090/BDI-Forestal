 --------------------------------------
--BASE DE DATOS I.
--PROYECTO: BD EMPRESA FORESTAL 
--GRUPO 20 
--COMISION 4
--INTEGRANTES:
--          BARTOLUCCI, Gast�n Leonel
--          OJEDA, Lidia Mariangeles	
--          RAMIREZ, Alfredo Agust�n	
--          ZAPATA, Sergio Ariel
--CONSULTAS GENERALES
--------------------------------------

USE Forestal;

SELECT * FROM tipo_empleado;
SELECT * FROM empleado;
SELECT * FROM anticipo;
SELECT * FROM tipo_vale;
SELECT * FROM vale;
SELECT * FROM insumo;
SELECT * FROM empleado_insumo;
SELECT * FROM remito;
SELECT * FROM empleado_remito;
SELECT * FROM corte;
SELECT * FROM produccion;
SELECT * FROM produccion_corte;
SELECT * FROM empleado_produccion;


--Calculo sueldo mesual a pagar de los empleados  (terminar)

SELECT  e.cod_empleado 'N°',
		CONCAT(e.apellido, ' ', e.nombre)  'Nombre y Apellido',
	    te.sueldoBasico 'Sueldo Básico',
		CAST(ISNULL(TotalRemitoEmpleado.Total,0) AS DECIMAL(10,2))  'Total por Producciones',
		CAST(ISNULL(InsumoEmpleado.Total,0)AS DECIMAL(10,2))'Descuento Insumos',
		CAST(ISNULL(Vale.Mvale,0) AS DECIMAL(10,2))'Descuento Vales',
		CAST(ISNULL(Anticipo.MAnticipo,0)AS DECIMAL(10,2))'Descuento Anticipos',
		(te.sueldoBasico) + (ISNULL(TotalRemitoEmpleado.Total,0)) - (ISNULL(InsumoEmpleado.Total,0)) - (ISNULL(Vale.Mvale,0)) - (ISNULL(Anticipo.MAnticipo,0)) 'Total'

FROM    empleado e
INNER JOIN tipo_empleado te ON e.id_TipoEmpleado = te.id_TipoEmpleado
FULL OUTER JOIN 
(                                                  --calculo del monto de los remitos entregados por empleado para el mes 10
	SELECT er.cod_empleado, CAST(SUM((c.precioVenta * pc.cantidad) * (r.cantidad/p.toneladas)) AS DECIMAL(10,2)) 'Total'
		FROM produccion_corte pc
		INNER JOIN corte c ON (pc.cod_corte = c.cod_corte)
		INNER JOIN remito r ON (pc.id_produccion = r.id_produccion)
		INNER JOIN produccion p ON (pc.id_produccion = p.id_produccion)
		INNER JOIN empleado_remito er ON r.id_remito = er.id_remito
		WHERE ( MONTH(r.fecha) = MONTH(GETDATE()) -1 )
		GROUP BY er.cod_empleado
)AS TotalRemitoEmpleado ON e.cod_empleado = TotalRemitoEmpleado.cod_empleado
FULL OUTER JOIN
(                                                 --calculo de los insumos utilzados por los empleados para el mes 10
	SELECT SUM(i.precio * ei.cantidad) 'Total', ei.cod_empleado
		FROM empleado_insumo ei
		INNER JOIN insumo i ON (ei.id_insumo = i.id_insumo )
		WHERE ( MONTH(ei.fecha) = MONTH(GETDATE()) -1 )
		GROUP BY ei.cod_empleado 
) AS InsumoEmpleado ON e.cod_empleado = InsumoEmpleado.cod_empleado
FULL OUTER JOIN
(                                                 --calculo de los vales utilizados 
	SELECT SUM(v.monto) Mvale, e.cod_empleado
		FROM empleado e
		FULL OUTER JOIN vale v ON (e.cod_empleado = v.cod_empleado)
		WHERE ( MONTH(v.fecha) = MONTH(GETDATE()) -1 )
		GROUP BY e.cod_empleado
) AS Vale ON e.cod_empleado = vale.cod_empleado
FULL OUTER JOIN
(                                                 --calcilo de los anticipos solicitados del mes 10
	SELECT SUM(a.monto) MAnticipo, e.cod_empleado
		FROM empleado e
		FULL OUTER JOIN anticipo a ON (e.cod_empleado = a.cod_empleado)
		WHERE ( MONTH(a.fecha) = MONTH(GETDATE()) -1 )
		GROUP BY e.cod_empleado
) AS Anticipo ON e.cod_empleado = Anticipo.cod_empleado
GROUP BY e.cod_empleado, CONCAT(e.apellido, ' ', e.nombre), te.sueldoBasico,TotalRemitoEmpleado.Total, 
InsumoEmpleado.Total, Vale.Mvale, Anticipo.MAnticipo

---------------------------------------------
--Funciones y procedimientos almacenados
---------------------------------------------

--Funcion que permite ver los insumos que utilizo cada empleado (pasado por parametro)
SELECT ei.cod_empleado,ei.id_insumo,ei.fecha, dbo.F_InsumpoPorEmpleado_Scalar(3) 'Total por Insumo'
	FROM empleado_insumo ei
	WHERE eI.cod_empleado = 3

SELECT * from F_InsumpoPorEmpleado_Tabla(10)

--Funcion que permite ver la cantidad en tonelada y el total por un determinado remito entregado
SELECT * FROM dbo.F_TotalPorRemito_tabla(2)

--Funcion que permite visualizar el sueldo de un empleado en un determidado mes
SELECT * FROM dbo.F_SueldoEmpleado_Tabla(2,10)


--Procedimiento para el alta de un empleado
EXEC SP_AltaEmpleado 5, '555555', 'ESTEBAN', 'ESCOBAR', 24258749514, '20221111', 'SI' --ok
EXEC SP_AltaEmpleado 5, '54/89', 'ESTEBAN', 'ESCOBAR', 24258749514, '20221111', 'SI' --error. legajo no es unico

--Procidimiento para el alta de un corte
EXEC SP_AltaCorte 'FLE*Km1/MADER.ES', 'ROLLO PIN.Km1/MADE/ES', 42, 'SI' --ok

--Procedimiento para el alta de un remito
EXEC SP_AltaRemito 5, 4, '20221027', 50

--Procedimiento para el alta de un remito-empleado
EXEC SP_AltaRemitoEmpleado 1, 5, 26

-----------------
--Triggers
-----------------
--Muestra 'Empleado Registrado' cada vez que se registra uno (TR_empleado)
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES(7,'13555555','ANDREZ','ESTEPA',	20149737856	,'10/01/1996','SI');
select * from empleado

--Cambia el activo a 'NO' de un empleado cuando el tipo de empleado asociado cambia a 'NO' (TR_Tipoempleado)
select * from tipo_empleado
select * from empleado

UPDATE tipo_empleado SET activo = 'NO' WHERE id_TipoEmpleado = 7

--Borra de la tabla empleado_produccion el registro asociado a una produccion cancelada (TR_empleado_produccion)
INSERT INTO produccion(fecha, toneladas) VALUES('20221129', 100)

INSERT INTO empleado_produccion(cod_empleado, id_produccion) VALUES(11, 8)
INSERT INTO empleado_produccion(cod_empleado, id_produccion) VALUES(8, 8)
INSERT INTO empleado_produccion(cod_empleado, id_produccion) VALUES(6, 8)

select * from produccion
select * from empleado_produccion order by id_produccion

delete from produccion where id_produccion = 8

-----------------
--Transacciones
-----------------


-----------------
--Vistas
-----------------
SELECT * FROM VW_REMITO_PRODUCCION
SELECT * FROM VW_NOMINA_EMPLEADO
SELECT * FROM VW_INSUMOS_UTILIZADOS
SELECT * FROM VW_VALES_UTILIZADOS





