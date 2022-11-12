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
