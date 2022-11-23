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
--CREACION DE VISTAS
--------------------------------------

/*CONSULTA DE LOS REMITOS DE LAS PRODUCCIONES DEL MES ACTUAL*/
CREATE VIEW [dbo].[VW_REMITO_PRODUCCION]
 AS
SELECT     CONCAT (r.primeros, ' - ' , r.id_remito) AS 'Remito N°', 
		   r.fecha AS 'Fecha', 
		   r.cantidad AS 'Cantidad(Tn)'
FROM       remito  r 
                   
WHERE    ( MONTH(r.fecha) = MONTH(GETDATE()) -1 ) --RESTAMOS 1 POR QUE ESTAMOS EN MES 11 Y EL LOTE DE DATOS CONTIENE RESGISTROS HASTA EL MES 10
                                                 
go

SELECT * FROM VW_REMITO_PRODUCCION


/*CONSULTA DE LA NOMINA DE EMPLEADOS*/
CREATE VIEW [dbo].[VW_NOMINA_EMPLEADO]
 AS
SELECT  e.legajo AS 'Legajo', 
		CONCAT(e.apellido, ' ', e.nombre) AS 'Nombre y Apellido', 
		e.cuil AS 'Cuil',
		e.fecha_ingreso AS 'Fecha de Ingreso',
		te.nombre AS 'Función'
		   
FROM    empleado e 
		INNER JOIN tipo_empleado te ON e.id_TipoEmpleado = te.id_TipoEmpleado
WHERE   e.activo = 'SI'
go

SELECT * FROM VW_NOMINA_EMPLEADO


/*CONSULTA DE LOS INSUMOS UTILIZADOS EN EL MES ACTUAL*/
CREATE VIEW [dbo].[VW_INSUMOS_UTILIZADOS]
 AS
SELECT  i.id_insumo AS 'N° de insumo', 
		i.producto AS 'Nombre', 
		ei.fecha AS 'Fecha',
		ei.cantidad AS 'Cantidad',
		CONCAT(e.apellido, ' ', e.nombre) AS 'Nombre y Apellido'

FROM    insumo i 
	    INNER JOIN empleado_insumo ei ON i.id_insumo = ei.id_insumo
		INNER JOIN empleado e ON ei.cod_empleado = e.cod_empleado
                   
WHERE    ( MONTH(ei.fecha) = MONTH(GETDATE()) -1 ) --RESTAMOS 1 POR QUE ESTAMOS EN MES 11 Y EL LOTE DE DATOS CONTIENE RESGISTROS HASTA EL MES 10
go

SELECT * FROM VW_INSUMOS_UTILIZADOS



/*CONSULTA DE LOS VALES UTILIZADOS EN EL MES ACTUAL*/
CREATE VIEW [dbo].[VW_VALES_UTILIZADOS]
 AS
SELECT  v.id_tipo_vale AS 'N° de vale', 
		v.fecha AS 'Fecha',
		tv.nombre AS 'Nombre', 
		CONCAT('$ ', v.monto) AS 'Monto',
		CONCAT(e.apellido, ' ', e.nombre) AS 'Nombre y Apellido'

FROM    vale v
	    INNER JOIN tipo_vale tv ON  v.id_tipo_vale = tv.id_tipo_vale
		INNER JOIN empleado e ON v.cod_empleado = e.cod_empleado
                   
WHERE    ( MONTH(v.fecha) = MONTH(GETDATE()) -1 ) --RESTAMOS 1 POR QUE ESTAMOS EN MES 11 Y EL LOTE DE DATOS CONTIENE RESGISTROS HASTA EL MES 10
go

SELECT * FROM VW_VALES_UTILIZADOS