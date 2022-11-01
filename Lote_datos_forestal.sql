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
INSERT INTO anticipo (id_anticipo, cod_empledo, fecha, monto, periodo, detalle) values ()

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
INSERT INTO empleado_insumo (id_insumo, cod_empleado, fecha, periodo, cantidad) VALUES (1,8,'20220906','09-2022',1);
INSERT INTO empleado_insumo (id_insumo, cod_empleado, fecha, periodo, cantidad) VALUES (8,10,'20220906','09-2022',1);
INSERT INTO empleado_insumo (id_insumo, cod_empleado, fecha, periodo, cantidad) VALUES (8,5,'20220906','09-2022',1);
INSERT INTO empleado_insumo (id_insumo, cod_empleado, fecha, periodo, cantidad) VALUES (10,8,'20220907','09-2022',1);
INSERT INTO empleado_insumo (id_insumo, cod_empleado, fecha, periodo, cantidad) VALUES (5,3,'20220915','09-2022',2);
INSERT INTO empleado_insumo (id_insumo, cod_empleado, fecha, periodo, cantidad) VALUES (3,10,'20220916','09-2022',1);
INSERT INTO empleado_insumo (id_insumo, cod_empleado, fecha, periodo, cantidad) VALUES (9,9,'20220923','09-2022',2);
INSERT INTO empleado_insumo (id_insumo, cod_empleado, fecha, periodo, cantidad) VALUES (6,2,'20221005','10-2022',1);
INSERT INTO empleado_insumo (id_insumo, cod_empleado, fecha, periodo, cantidad) VALUES (8,6,'20221009','10-2022',3);
INSERT INTO empleado_insumo (id_insumo, cod_empleado, fecha, periodo, cantidad) VALUES (2,4,'20221010','10-2022',1);
--SELECT * FROM empleado_insumo

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
INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (1,4,25);
INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (1,8,30);
INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (1,2,45);
INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (2,8,70);
INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (2,4,20);
INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (2,3,40);
INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (2,1,70);
INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (3,9,15);
INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (3,10,15);
INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (3,2,70);
--SELECT * FROM produccion_corte

---------------
-- Empleado_produccion --agustion
---------------
INSERT INTO empleado_produccion (cod_empleado, id_produccion) values ()

---------------
-- Remito -- -- agustin
---------------
INSERT INTO remito (primeros, id_remito, id_produccion, fecha, cantidad) values ()

---------------
-- Empleado_remito --marian
---------------
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (3,4,1);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (2,4,1);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (3,4,2);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (2,4,2);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (1,6,3);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (10,6,3);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (3,6,4);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (6,6,4);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (1,6,4);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (7,6,4);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (10,6,4);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (6,6,5);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (3,6,5);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (1,6,6);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (3,6,6);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (10,6,7);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (3,27,8);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (2,27,8);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (9,27,9);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (2,27,9);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (3,27,10);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (2,27,10);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (9,27,10);
--SELECT * FROM empleado_remito
