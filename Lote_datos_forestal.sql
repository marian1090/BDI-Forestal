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
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('TUERCA ESPARRAGO',2.80,1,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('PALANCA CEBADOR',4500.00,1,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('ASA CORDEL(MANGO)',5000.00,2,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('ESPADA 34 DIENTES',8500.00,2,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('PUNTERA OREGON AUTOVALLE',32000.00,2,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('PASTILLA EMBRAGUE HECHO',11500.00,2,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('ESPADA WILSOR',5000.00,2,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('ESPADA ACERADA',7000.00,2,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('PANTALON ANTICORTE',18000.00,2,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES('CONJUNTO LLUVIA',3200.00,3,'SI');
--SELECT * FROM insumo

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
INSERT INTO produccion_corte (id_produccion, cod_corte) VALUES (1,4);
INSERT INTO produccion_corte (id_produccion, cod_corte) VALUES (1,8);
INSERT INTO produccion_corte (id_produccion, cod_corte) VALUES (1,2);
INSERT INTO produccion_corte (id_produccion, cod_corte) VALUES (2,8);
INSERT INTO produccion_corte (id_produccion, cod_corte) VALUES (2,4);
INSERT INTO produccion_corte (id_produccion, cod_corte) VALUES (2,3);
INSERT INTO produccion_corte (id_produccion, cod_corte) VALUES (2,1);
INSERT INTO produccion_corte (id_produccion, cod_corte) VALUES (3,9);
INSERT INTO produccion_corte (id_produccion, cod_corte) VALUES (3,10);
INSERT INTO produccion_corte (id_produccion, cod_corte) VALUES (3,2);
--SELECT * FROM produccion_corte

---------------
-- Empleado_produccion --agustin
---------------
INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (3,1);
INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (2,1);
INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (3,2);
INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (6,2);
INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (1,2);
INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (7,2);
INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (10,2);
INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (3,3);
INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (2,3);
INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (9,3);
--SELECT * FROM empleado_produccion


---------------
-- Remito -- -- agustin
---------------
INSERT INTO remito (primeros, id_produccion, fecha, cantidad) VALUES (4,1,'20220906',30);
INSERT INTO remito (primeros, id_produccion, fecha, cantidad) VALUES (4,1,'20220909',70);
INSERT INTO remito (primeros, id_produccion, fecha, cantidad) VALUES (6,2,'20220928',20);
INSERT INTO remito (primeros, id_produccion, fecha, cantidad) VALUES (6,2,'20220930',90);
INSERT INTO remito (primeros, id_produccion, fecha, cantidad) VALUES (6,2,'20221004',30);
INSERT INTO remito (primeros, id_produccion, fecha, cantidad) VALUES (6,2,'20221006',20);
INSERT INTO remito (primeros, id_produccion, fecha, cantidad) VALUES (6,2,'20221010',40);
INSERT INTO remito (primeros, id_produccion, fecha, cantidad) VALUES (27,3,'20221012',20);
INSERT INTO remito (primeros, id_produccion, fecha, cantidad) VALUES (27,3,'20221014',30);
INSERT INTO remito (primeros, id_produccion, fecha, cantidad) VALUES (27,3,'20221017',50);
--SELECT * FROM remito

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
