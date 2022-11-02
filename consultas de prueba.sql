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
