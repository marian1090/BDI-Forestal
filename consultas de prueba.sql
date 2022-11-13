--Cortes y empleados por produccion
select produccion_corte.id_produccion,cod_corte,empleado_produccion.cod_empleado
	from produccion_corte
	inner join empleado_produccion 
	on
	produccion_corte.id_produccion = empleado_produccion.id_produccion
	order by produccion_corte.id_produccion

--Empleados por remitos
select empleado_remito.id_remito,id_produccion,cod_empleado 
	from remito
	inner join empleado_remito
	on
	remito.id_remito = empleado_remito.id_remito
	order by empleado_remito.id_remito,id_produccion,cod_empleado 


--Empleados por produccion
select produccion.id_produccion,empleado.nombre
	from produccion
	inner join empleado_produccion
	on 
	produccion.id_produccion = empleado_produccion.id_produccion
	inner join empleado
	on 
	empleado_produccion.cod_empleado = empleado.cod_empleado
	order by produccion.id_produccion


--Remitos(entregas) por produccion
select remito.id_remito,produccion.id_produccion
	from remito
	inner join produccion
	on 
	remito.id_produccion = produccion.id_produccion
	order by remito.id_produccion


--Importe total por produccion
select produccion_corte.id_produccion, sum(corte.precioVenta * produccion_corte.cantidad)'Total'
	from produccion_corte
	inner join corte
	on
	(produccion_corte.cod_corte = corte.cod_corte)
	group by produccion_corte.id_produccion



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
