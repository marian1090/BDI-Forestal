--------------------------------------
--BASE DE DATOS I.
--PROYECTO: BD EMPRESA FORESTAL 
--GRUPO 20 
--COMISION 4
--INTEGRANTES:
--          BARTOLUCCI, Gastón Leonel
--          OJEDA, Lidia Mariangeles	
--          RAMIREZ, Alfredo Agustín	
--          ZAPATA, Sergio Ariel
--FUNCIONES
--------------------------------------

--Funcion que permite ver los insumos que utilizo cada empleado (pasado por parametro)
CREATE FUNCTION  F_InsumpoPorEmpleado_Scalar (
@empleado INT
)
RETURNS FLOAT
AS 
BEGIN
DECLARE @total  DECIMAL(10,2)
	SELECT @total  =  SUM(precio * cantidad)
		FROM empleado e
		INNER JOIN empleado_insumo ei ON (e.cod_empleado = ei.cod_empleado)
		INNER JOIN insumo i ON (ei.id_insumo = i.id_insumo)
		WHERE ei.cod_empleado = @empleado 
	RETURN @total 
END

SELECT ei.cod_empleado,ei.id_insumo,ei.fecha, dbo.F_InsumpoPorEmpleado_Scalar(2) 'Total por Insumo'
	FROM empleado_insumo ei
	WHERE eI.cod_empleado = 2

CREATE FUNCTION  F_InsumpoPorEmpleado_Tabla (
@empleado INT
)
returns table
AS 

	RETURN (SELECT e.cod_empleado, i.id_insumo, ei.fecha,  SUM(precio * cantidad) 'Total por insumo'
		FROM empleado e
		INNER JOIN empleado_insumo ei ON (e.cod_empleado = ei.cod_empleado) 
		INNER JOIN insumo i ON (ei.id_insumo = i.id_insumo)
		WHERE ei.cod_empleado = @empleado
		GROUP BY  e.cod_empleado,i.id_insumo,ei.fecha)

SELECT * from F_InsumpoPorEmpleado_Tabla(10)
	

--Funcion que permite ver la cantidad en tonelada y el total por un determinado remito entregado
CREATE FUNCTION  dbo.F_TotalPorRemito_tabla (
@remito INT
)
RETURNS TABLE
AS 

	RETURN (SELECT r.id_remito, r.fecha, r.cantidad,  CAST(SUM((c.precioVenta * pc.cantidad) * (r.cantidad/p.toneladas)) AS DECIMAL(10,2)) 'Total por remito'
		FROM produccion_corte pc
				INNER JOIN corte c ON (pc.cod_corte = c.cod_corte)
				INNER JOIN remito r ON (pc.id_produccion = r.id_produccion)
				INNER JOIN produccion p ON (pc.id_produccion = p.id_produccion)
		WHERE r.id_remito = @remito
		GROUP BY r.id_remito,  r.fecha, r.cantidad)

SELECT * FROM dbo.F_TotalPorRemito_tabla(2)

--Funcion que permite visualizar el sueldo de un empleado en un determidado mes
CREATE FUNCTION  F_SueldoEmpleado_Tabla (
@empleado INT,
@fecha INT
)
RETURNS TABLE
AS 
	RETURN(SELECT e.cod_empleado,CONCAT(e.nombre,' ',e.apellido) 'Empleado', (te.sueldoBasico) + (ISNULL(TotalRemitoEmpleado.Total,0)) - (ISNULL(InsumoEmpleado.Total,0)) - (ISNULL(Vale.Mvale,0)) - (ISNULL(Anticipo.MAnticipo,0)) 'Sueldo'

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
		WHERE CAST(DATEPART(MONTH,r.fecha)AS INTEGER) = @fecha 
		GROUP BY er.cod_empleado
)AS TotalRemitoEmpleado ON e.cod_empleado = TotalRemitoEmpleado.cod_empleado
FULL OUTER JOIN
(                                                 --calculo de los insumos utilzados por los empleados para el mes 10
	SELECT SUM(i.precio * ei.cantidad) 'Total', ei.cod_empleado
		FROM empleado_insumo ei
		INNER JOIN insumo i ON (ei.id_insumo = i.id_insumo )
		WHERE CAST(DATEPART(MONTH,ei.fecha)AS INTEGER) = @fecha
		GROUP BY ei.cod_empleado 
) AS InsumoEmpleado ON e.cod_empleado = InsumoEmpleado.cod_empleado
FULL OUTER JOIN
(                                                 --calculo de los vales utilizados 
	SELECT SUM(v.monto) Mvale, e.cod_empleado
		FROM empleado e
		FULL OUTER JOIN vale v ON (e.cod_empleado = v.cod_empleado)
		WHERE  CAST(DATEPART(MONTH,v.fecha)AS INTEGER) = @fecha 
		GROUP BY e.cod_empleado
) AS Vale ON e.cod_empleado = vale.cod_empleado
FULL OUTER JOIN
(                                                 --calcilo de los anticipos solicitados del mes 10
	SELECT SUM(a.monto) MAnticipo, e.cod_empleado
		FROM empleado e
		FULL OUTER JOIN anticipo a ON (e.cod_empleado = a.cod_empleado)
		WHERE CAST(DATEPART(MONTH,a.fecha)AS INTEGER) = @fecha 
		GROUP BY e.cod_empleado
) AS Anticipo ON e.cod_empleado = Anticipo.cod_empleado
WHERE e.cod_empleado = @empleado
GROUP BY e.cod_empleado,CONCAT(e.nombre,' ',e.apellido),te.sueldoBasico,TotalRemitoEmpleado.Total,InsumoEmpleado.Total,Vale.Mvale,Anticipo.MAnticipo)

SELECT * FROM dbo.F_SueldoEmpleado_Tabla(2,10)