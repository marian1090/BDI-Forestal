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
SELECT ei.cod_empleado,ei.id_insumo,ei.fecha, dbo.F_InsumpoPorEmpleado(10) 'Total por Insumo'
	FROM empleado_insumo ei
	WHERE eI.cod_empleado = 10

--Funcion que permite ver la cantidad en tonelada y el total por un determinado remito entregado
SELECT r.id_remito, r.fecha, r.cantidad, dbo.F_TotalPorRemito(2) 'Total por Remito'
	FROM remito r
	WHERE r.id_remito = 2

--Funcion que permite visualizar el sueldo de un empleado en un determidado mes
SELECT e.cod_empleado,e.nombre, dbo.F_SueldoEmpleado(4,10) 
	FROM empleado e 
	WHERE e.cod_empleado = 4


--Procidimiento para el alta de un empleado
EXEC AltaEmpleado 5, '54/89', 'ESTEBAN', 'ESCOBAR', 24258749514, '20221111', 'SI' --ok
EXEC AltaEmpleado 5, '54/89', 'ESTEBAN', 'ESCOBAR', 24258749514, '20221111', 'SI' --error. legajo no es unico

--Procidimiento para el alta de un corte
EXEC AltaCorte 'FLE*Km1/MADER.ES', 'ROLLO PIN.Km1/MADE/ES', 42, 'SI'
EXEC AltaCorte 'FLE*Km1/MADER.ES', 'ROLLO PIN.Km1/MADE/ES', 42, 'SI'

--Procedimiento para el alta de un remito
EXEC AltaRemito 6, 7, '2022129', 50

--Procedimiento para el alta de un remito-empleado
EXEC AltaRemitoEmpleado 11, 4, 20


-----------------
--Disparadores
-----------------

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





