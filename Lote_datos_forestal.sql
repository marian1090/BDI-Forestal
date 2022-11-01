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

SELECT * FROM insumo

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

SELECT * FROM empleado_produccion


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

SELECT * FROM remito

---------------
-- Empleado_remito
---------------
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) values ()
