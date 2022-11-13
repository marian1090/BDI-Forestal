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

SELECT  e.cod_empleado,
		CONCAT(e.apellido, ' ', e.nombre) AS 'Nombre y Apellido',
	    te.sueldoBasico AS 'Sueldo Básico',
		TotalRemitoEmpleado.Total AS 'Total por Producciones',
		InsumoEmpleado.Total,
		Vale.Mvale,
		a.monto,
		(te.sueldoBasico + TotalRemitoEmpleado.Total - InsumoEmpleado.Total - Vale.Mvale - a.monto) 'total'

FROM    empleado e
INNER JOIN tipo_empleado te ON e.id_TipoEmpleado = te.id_TipoEmpleado
FULL OUTER JOIN vale v ON e.cod_empleado = v.cod_empleado
FULL OUTER JOIN anticipo a ON e.cod_empleado = a.cod_empleado
FULL OUTER JOIN 
(
		select er.cod_empleado, cast(sum((c.precioVenta * pc.cantidad) * (r.cantidad/p.toneladas)) as decimal(10,2))'Total'
			from produccion_corte pc
			inner join corte c on (pc.cod_corte = c.cod_corte)
			inner join remito r on (pc.id_produccion = r.id_produccion)
			inner join produccion p on (pc.id_produccion = p.id_produccion)
			inner join empleado_remito er ON r.id_remito = er.id_remito 
			group by er.cod_empleado
)AS TotalRemitoEmpleado ON e.cod_empleado = TotalRemitoEmpleado.cod_empleado
FULL OUTER JOIN
(
	SELECT sum(i.precio * ei.cantidad) 'Total', ei.cod_empleado
	FROM empleado_insumo ei
	INNER JOIN insumo i ON (ei.id_insumo = i.id_insumo )
	group by ei.cod_empleado 
) AS InsumoEmpleado ON e.cod_empleado = InsumoEmpleado.cod_empleado
FULL OUTER JOIN
(
	select sum(v.monto) Mvale, e.cod_empleado
	from empleado e
	full outer join vale v on (e.cod_empleado = v.cod_empleado)
	group by e.cod_empleado
	) AS Vale ON e.cod_empleado = vale.cod_empleado

GROUP BY e.cod_empleado, CONCAT(e.apellido, ' ', e.nombre), te.sueldoBasico, TotalRemitoEmpleado.Total, InsumoEmpleado.Total, Vale.Mvale, a.monto

