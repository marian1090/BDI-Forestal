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
-- Tipo empleado
---------------
INSERT INTO tipo_empleado (nombre, sueldoBasico, activo) VALUES ('CAMIONERO',90000,'SI');
INSERT INTO tipo_empleado (nombre, sueldoBasico, activo) VALUES ('CAPATAZ',90000,'SI');
INSERT INTO tipo_empleado (nombre, sueldoBasico, activo) VALUES ('CHOFER FORESTAL',90000,'SI');
INSERT INTO tipo_empleado (nombre, sueldoBasico, activo) VALUES ('GRUISTA',90000,'SI');
INSERT INTO tipo_empleado (nombre, sueldoBasico, activo) VALUES ('MARCADOR',90000,'SI');
INSERT INTO tipo_empleado (nombre, sueldoBasico, activo) VALUES ('MECANICO',90000,'SI');
INSERT INTO tipo_empleado (nombre, sueldoBasico, activo) VALUES ('MOTOSIERRISTA',90000,'SI');
INSERT INTO tipo_empleado (nombre, sueldoBasico, activo) VALUES ('PAQUETERO',90000,'SI');
INSERT INTO tipo_empleado (nombre, sueldoBasico, activo) VALUES ('PEON GENERAL AGRARIO',90000,'SI');
INSERT INTO tipo_empleado (nombre, sueldoBasico, activo) VALUES ('PEON RURAL',90000,'SI');
INSERT INTO tipo_empleado (nombre, sueldoBasico, activo) VALUES ('TRACTORISTA',90000,'SI');
INSERT INTO tipo_empleado (nombre, sueldoBasico, activo) VALUES ('TRANSPORTISTA',90000,'SI');

---------------
-- Empleado 
---------------
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES (7,'56/056','LUIS ANDRES','AYALA',	20321581508,'20040810','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES (7,'56/057','EMERSON SANDRO','RIOS',20261023282,'20040810','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES (4,'8/6','LUCAS AGUSTIN','BRIZUELA',20135944514,'20060815','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES (8,'11/6','BASILIO BENITO','BENITEZ',23186856449,'19960801','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES (7,'48/2','JUAN SIMON','BENITEZ',23161295949,'20040517','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES (4,'56/058','GABRIEL','ENCINAS BENITEZ',20142209609	,'19961101','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES (7,'24/6','HORACIO DANIEL','BARRIOS',24326219785,'19980102','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES (7,'23/9','BENITO','CHAVEZ IBAÑEZ',20923575384,'20001130','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES (7,'4/8','JOSE','ESCOBAR TOLEDO',20923253662,'19991201','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES (7,'13/0','ANDREZ','ESTEPA',20149737856	,'19961001','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES (12,'5/101','RAMON','CANTERO',20296216599,'19971024','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES (1,'5/32','ANTONIO','WORONOWICZ',20368457771,'19971108','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES (9,'46/8','LEONCIO','CORREA',20085419332,'19980613','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES (6,'49/9','DIONICIO','AYALA',20162944479,'20021107','SI');
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES (8,'11/6','BASILIO BENITO','BENITEZ',23186856449,'19960801','SI');
--SELECT * FROM empleado


---------------
-- Anticipo 
---------------
INSERT INTO anticipo (cod_empleado, fecha, monto, periodo, detalle) VALUES (5,'20220915',10000.00,'09-2022','Gastos personales');
INSERT INTO anticipo (cod_empleado, fecha, monto, periodo, detalle) VALUES (3,'20220928',7000.00,'09-2022','Consultas medica');
INSERT INTO anticipo (cod_empleado, fecha, monto, periodo, detalle) VALUES (1,'20221014',12000.00,'10-2022','Gasto de tarjeta');
INSERT INTO anticipo (cod_empleado, fecha, monto, periodo, detalle) VALUES (11,'20221017',12000.00,'10-2022','Emergencia');
INSERT INTO anticipo (cod_empleado, fecha, monto, periodo, detalle) VALUES (2,'20221025',12000.00,'10-2022','Gastos personales');
INSERT INTO anticipo (cod_empleado, fecha, monto, periodo, detalle) VALUES (7,'20221103',12000.00,'10-2022','Gasto de tarjeta');
--SELECT * FROM anticipo

---------------
-- Tipo_vale
---------------
INSERT INTO tipo_vale (nombre, direccion) VALUES ('SUPERMERCADO EL GRINGO','AV. SAN MARTIN 2396 -WANDA-');
INSERT INTO tipo_vale (nombre, direccion) VALUES ('CARNICERIA WANDA', 'BARRIO INDUSTRIAL -WANDA-');
INSERT INTO tipo_vale (nombre, direccion) VALUES ('SUPERMERCADO RUTA 19', 'RUTA 19 Y RUTA 12 -WANDA-');
INSERT INTO tipo_vale (nombre, direccion) VALUES ('SUPERMERCADO CERRO AZUL', 'BARRIO OBRERO -WANDA-');
INSERT INTO tipo_vale (nombre, direccion) VALUES ('SUPERMERCADO TATIN', 'AV. SAN MARTIN 2932 -WANDA-');
INSERT INTO tipo_vale (nombre, direccion) VALUES ('SUPERMERCADO AVENIDA', 'BARRIO SAN ROQUE -WANDA-');
INSERT INTO tipo_vale (nombre, direccion) VALUES ('SUPEMERCADO ESPERANZA', 'ENTRERRIOS 1293 -PTO ESPERANZA-');
INSERT INTO tipo_vale (nombre, direccion) VALUES ('SUPERMERCADO LA NUEVA', 'BARRIO NUEVO -PTO LIBERTAD-');
INSERT INTO tipo_vale (nombre, direccion) VALUES ('CARNICERIA PTO LIBERTAD', 'BARRIO NUEVO -PTO LIBERTAD-');
INSERT INTO tipo_vale (nombre, direccion) VALUES ('SUPERMERCADO RICKI', 'CENTRO -WANDA-');
INSERT INTO tipo_vale (nombre, direccion) VALUES ('SUPERMERCADO VIVIANDY', 'AV. SAN MARTIN 2819 -WANDA-');

---------------
-- Vale 
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
INSERT INTO vale (cod_empleado, id_Tipo_vale, fecha, monto, periodo) VALUES (15,10,'20221015',15000,'10-2022')
INSERT INTO vale (cod_empleado, id_Tipo_vale, fecha, monto, periodo) VALUES (11,2,'20221017',13000,'10-2022')
--SELECT * FROM vale

---------------
<<<<<<< HEAD
-- Proveedor 
---------------
INSERT INTO proveedor (nombre, direccion) VALUES ('YELEN REPUESTOS', 'AV. SAN MARTIN -WANDA-');
INSERT INTO proveedor (nombre, direccion) VALUES ('CORRALON WANDA' , 'CALLE LAS ORTENCIAS -WANDA-');
INSERT INTO proveedor (nombre, direccion) VALUES ('LUBRICENTRO FORESTAL', 'BARRIO LAPACHILLO -WANDA-'); 
--SELECT * FROM proveedor

---------------
-- Insumo --agustin
=======
-- Insumo 
>>>>>>> ba1a233df851d67da98ffa927c1b4e996d95b26e
---------------
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('TUERCA ESPARRAGO',10.00,1,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('PALANCA CEBADOR',4500.00,1,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('ASA CORDEL(MANGO)',5000.00,2,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('ESPADA 34 DIENTES',8500.00,2,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('PUNTERA OREGON AUTOVALLE',32000.00,2,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('PASTILLA EMBRAGUE HECHO',11500.00,2,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('ESPADA WILSOR',5000.00,2,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('ESPADA ACERADA',7000.00,2,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('PANTALON ANTICORTE',18000.00,2,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('CONJUNTO LLUVIA',3200.00,3,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('ACEITE KELUBE*20 LTS.INDU',16500.00,3,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('TACO GOMA MOTOR GRANDE',6730.00,1,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('LINTERNA SICA',6840.00,2,'SI');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('JUEGO EMBREGUE',64400.00,1,'NO');
INSERT INTO insumo (producto, precio, id_proveedor, activo) VALUES ('FAJA PAMPERO C/FLUORECENT',2850.00,2,'SI');
--SELECT * FROM insumo

---------------
-- Empleado_insumo
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
INSERT INTO empleado_insumo (id_insumo, cod_empleado, fecha, periodo, cantidad) VALUES (13,9,'20221010','10-2022',2);
INSERT INTO empleado_insumo (id_insumo, cod_empleado, fecha, periodo, cantidad) VALUES (16,12,'20221010','10-2022',1);
INSERT INTO empleado_insumo (id_insumo, cod_empleado, fecha, periodo, cantidad) VALUES (16,15,'20221010','10-2022',1);
INSERT INTO empleado_insumo (id_insumo, cod_empleado, fecha, periodo, cantidad) VALUES (16,11,'20221011','10-2022',1);
INSERT INTO empleado_insumo (id_insumo, cod_empleado, fecha, periodo, cantidad) VALUES (3,10,'20221015','10-2022',1);
--SELECT * FROM empleado_insumo

---------------
-- Corte 
---------------
INSERT INTO corte (corte, descripcion, precioVenta, activo) VALUES ('CAR*KISIEL','CAR*KISIEL',0.3,'SI');
INSERT INTO corte (corte, descripcion, precioVenta, activo) VALUES ('COR*PINDO','COR*PINDO',1.1,'SI');
INSERT INTO corte (corte, descripcion, precioVenta, activo) VALUES ('EXT*PINDO','EXT*PINDO',0.45,'SI');
INSERT INTO corte (corte, descripcion, precioVenta, activo) VALUES ('CAR*PINDO','CAR*PINDO',0.45,'SI');
INSERT INTO corte (corte, descripcion, precioVenta, activo) VALUES ('EyC*PINDO','EyC*PINDO',0.9	,'NO');
INSERT INTO corte (corte, descripcion, precioVenta, activo) VALUES ('FLE*M11/M.B.M.SV','ROLLO PIN.M11/M.B.M.',4.78,'SI');
INSERT INTO corte (corte, descripcion, precioVenta, activo) VALUES ('FLE*PIN.MADER.ES','ROLLO PIN.M.MADER.ESP',9.03,'SI');
INSERT INTO corte (corte, descripcion, precioVenta, activo) VALUES ('FLE*PIN.CHOD.ESP','ROLLO PINDO CHODORGE',0.8,'NO');
INSERT INTO corte (corte, descripcion, precioVenta, activo) VALUES ('COR-PINDO','COR-PINDO',1.1,'SI');
INSERT INTO corte (corte, descripcion, precioVenta, activo) VALUES ('CAR-PINDO','CAR-PINDO',0.45,'SI');
INSERT INTO corte (corte, descripcion, precioVenta, activo) VALUES ('MAD.ASSERR.A PIN','MAD.ASSERR.A PIN',3,65,'SI');
INSERT INTO corte (corte, descripcion, precioVenta, activo) VALUES ('FLE.NOGUEL/Pto2º','ROLLO ANAHI-NOGU.P.2º',14,92,'SI');
INSERT INTO corte (corte, descripcion, precioVenta, activo) VALUES ('COR+PARAISO/M20','COR+PARAISO/M21',1,1,'SI');
INSERT INTO corte (corte, descripcion, precioVenta, activo) VALUES ('EXT+PARAISO/M20','EXT+PARAISO/M21',0,45,'SI');
INSERT INTO corte (corte, descripcion, precioVenta, activo) VALUES ('FLE@NOGUEL/HELVE','ROLLO GUA-NOGU.HELVEC',14,92,'SI');
--SELECT * FROM corte

---------------
-- Produccion 
---------------
INSERT INTO produccion (fecha,toneladas) VALUES ('20220906',100);
INSERT INTO produccion (fecha,toneladas) VALUES ('20220928',200);
INSERT INTO produccion (fecha,toneladas) VALUES ('20221012',100);
INSERT INTO produccion (fecha,toneladas) VALUES ('20221020',150);
--SELECT * FROM produccion

---------------
-- Produccion_corte
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
INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (4,14,70);
INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (4,13,30);
INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (4,5,20);
INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (4,1,30);
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
INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (8,4);
INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (11,4);
INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (12,4);
INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (15,4);
INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (5,4)
--SELECT * FROM empleado_produccion


---------------
-- Remito 
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
INSERT INTO remito (primeros, id_produccion, fecha, cantidad) VALUES (5,4,'20221020',50);
INSERT INTO remito (primeros, id_produccion, fecha, cantidad) VALUES (5,4,'20221023',50);
INSERT INTO remito (primeros, id_produccion, fecha, cantidad) VALUES (5,4,'20221025',50);
--SELECT * FROM remito

---------------
-- Empleado_remito
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
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (11,5,11);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (12,5,11);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (15,5,11);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (11,5,12);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (12,5,12);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (15,5,12);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (5,5,12);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (8,5,12);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (12,5,13);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (15,5,13);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (5,5,13);
INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (8,5,13);
--SELECT * FROM empleado_remito
