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
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES(7,'56/056','LUIS ANDRES','AYALA',	20321581508	,'08/10/2004','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES(7,'56/057','EMERSON SANDRO','RIOS',	20261023282	,'08/10/2004','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES(4,'8/6','LUCAS AGUSTIN','BRIZUELA',	20135944514	,'08/15/2006','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES(8,'11/6','BASILIO BENITO','BENITEZ',	23186856449	,'08/01/1996','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES(7,'48/2','JUAN SIMON','BENITEZ',	23161295949	,'05/17/2004','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES(4,'56/058','GABRIEL','ENCINAS BENITEZ',	20142209609	,'11/01/1996','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES(7,'24/6','HORACIO DANIEL','BARRIOS',	24326219785	,'01/02/1998','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES(7,'23/9','BENITO','CHAVEZ IBAÑEZ',	20923575384	,'11/30/2000','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES(7,'4/8','JOSE','ESCOBAR TOLEDO',	20923253662	,'12/01/1999','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES(7,'13/0','ANDREZ','ESTEPA',	20149737856	,'10/01/1996','SI');
--SELECT * FROM empleado

---------------
-- Anticipo -- gaton 
---------------
INSERT INTO anticipo (cod_empleado, fecha, monto, periodo, detalle) VALUES (5,'20220915',10000.00,'09-2022','Gastos personales');
INSERT INTO anticipo (cod_empleado, fecha, monto, periodo, detalle) VALUES (3,'20220928',7000.00,'09-2022','Consultas medica');
INSERT INTO anticipo (cod_empleado, fecha, monto, periodo, detalle) VALUES (1,'20221014',12000.00,'10-2022','Gasto de tarjeta');
--SELECT * FROM anticipo

---------------
-- Tipo_vale--ariel
---------------
INSERT INTO tipo_vale (id_Tipo_vale, nombre, direccion) values ()

---------------
-- Vale --gaston 
---------------
INSERT INTO vale (cod_empleado, id_Tipo_vale, fecha, monto, periodo) VALUES (4,8,'20220908',15000,'09-2022')
INSERT INTO vale (cod_empleado, id_Tipo_vale, fecha, monto, periodo) VALUES (2,1,'20220909',12500,'09-2022')
INSERT INTO vale (cod_empleado, id_Tipo_vale, fecha, monto, periodo) VALUES (5,1,'20220909',20000,'09-2022')
INSERT INTO vale (cod_empleado, id_Tipo_vale, fecha, monto, periodo) VALUES (10,5,'20220922',7000,'09-2022')
INSERT INTO vale (cod_empleado, id_Tipo_vale, fecha, monto, periodo) VALUES (3,7,'20220924',17000,'09-2022')
INSERT INTO vale (cod_empleado, id_Tipo_vale, fecha, monto, periodo) VALUES (4,1,'20220929',5000,'09-2022')
INSERT INTO vale (cod_empleado, id_Tipo_vale, fecha, monto, periodo) VALUES (9,3,'20221005',25000,'10-2022')
INSERT INTO vale (cod_empleado, id_Tipo_vale, fecha, monto, periodo) VALUES (7,3,'20221006',28000,'10-2022')
INSERT INTO vale (cod_empleado, id_Tipo_vale, fecha, monto, periodo) VALUES (5,1,'20221012',23500,'10-2022')
INSERT INTO vale (cod_empleado, id_Tipo_vale, fecha, monto, periodo) VALUES (7,4,'20221014',10000,'10-2022')
--SELECT * FROM vale

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
