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
--LOTE DE DATOS-PRUEBA.
--------------------------------------

USE Forestal;

---------------
-- Tipo empleado-- ariel
---------------
INSERT INTO tipo_empleado (id_TipoEmpleado, nombre, sueldoBasico, activo) values ()

---------------
-- Empleado ---gaston 
---------------
INSERT INTO empleado (cod_empleado, id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) values ()

---------------
-- Anticipo -- gaton 
---------------
INSERT INTO anticipo (id_anticipo, nombcod_empleadore, fecha, monto, periodo, detalle) values ()

---------------
-- Tipo_vale--ariel
---------------
INSERT INTO tipo_vale (id_Tipo_vale, nombre, direccion) values ()

---------------
-- Vale --gaston 
---------------
INSERT INTO vale (nro_vale, cod_empleado, id_Tipo_vale, fecha, monto, periodo) values ()

---------------
-- Insumo --agustin
---------------
INSERT INTO insumo (id_insumo, producto, precio, proveedor, activo) values ()

---------------
-- Empleado_insumo --marian
---------------
INSERT INTO empleado_insumo (cod_empleado, id_insumo, fecha, periodo, cantidad) values ()

---------------
-- Corte --ariel
---------------
INSERT INTO corte (cod_corte, corte, descripcion, precioVenta, activo) values ()

---------------
-- Produccion --ariel
---------------
INSERT INTO produccion (id_produccion, cod_corte, fecha) values ()

---------------
-- Produccion_corte --marian
---------------
INSERT INTO produccion_corte (id_produccion, cod_corte) values ()

---------------
-- Empleado_produccion --agustion
---------------
INSERT INTO empleado_produccion (cod_empleado, id_produccion) values ()

---------------
-- Remito -- -- agustin
---------------
INSERT INTO remito (primeros, id_remito, id_produccion, fecha, cantidad) values ()

---------------
-- Empleado_remito
---------------
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) values ()
