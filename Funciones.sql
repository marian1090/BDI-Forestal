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

CREATE FUNCTION  F_InsumpoPorEmpleado (
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

SELECT ei.cod_empleado,ei.id_insumo,ei.fecha, dbo.F_InsumpoPorEmpleado(2) 'Total por Insumo'
	FROM empleado_insumo ei
	WHERE ei.id_insumo = 2


CREATE FUNCTION  dbo.F_TotalPorRemito (
@remito INT
)
RETURNS FLOAT
AS 
BEGIN
DECLARE @total  DECIMAL(10,2)
	SELECT @total  =  CAST(SUM((c.precioVenta * pc.cantidad) * (r.cantidad/p.toneladas)) AS DECIMAL(10,2))
		FROM produccion_corte pc
				INNER JOIN corte c ON (pc.cod_corte = c.cod_corte)
				INNER JOIN remito r ON (pc.id_produccion = r.id_produccion)
				INNER JOIN produccion p ON (pc.id_produccion = p.id_produccion)
		WHERE r.id_remito = @remito
		GROUP BY r.id_remito, r.cantidad
	RETURN @total 
END

SELECT r.id_remito, r.fecha, dbo.F_TotalPorRemito(2) 'Total por Remito'
	FROM remito r
	WHERE r.id_remito = 2


CREATE FUNCTION  F_SueldoEmpleado (
@empleado INT,
@fecha INT
)
RETURNS FLOAT
AS 
BEGIN
DECLARE @sueldo  DECIMAL(10,2)
	SELECT @sueldo  =  (te.sueldoBasico) + (ISNULL(TotalRemitoEmpleado.Total,0)) - (ISNULL(InsumoEmpleado.Total,0)) - (ISNULL(Vale.Mvale,0)) - (ISNULL(Anticipo.MAnticipo,0)) 

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
GROUP BY e.cod_empleado, CONCAT(e.apellido, ' ', e.nombre), te.sueldoBasico,TotalRemitoEmpleado.Total, 
InsumoEmpleado.Total, Vale.Mvale, Anticipo.MAnticipo
	RETURN @sueldo 
END


select e.cod_empleado,e.nombre, dbo.F_SueldoEmpleado(4,10) from empleado e WHERE e.cod_empleado = 4