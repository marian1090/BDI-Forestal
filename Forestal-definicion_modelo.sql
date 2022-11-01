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
--DEFINICION MODELO DE DATOS.
--------------------------------------

/*PREGUNTAMOS SI EXISTE NUESTRA BASE DE DATOS PREVIAMENTE Y LA BORRAMOS PARA VOLVER A CREARLA
IF EXISTS(SELECT NAME FROM SYS.DATABASES WHERE NAME = 'Forestal') 
BEGIN
DROP DATABASE Forestal;
END 
*/

CREATE DATABASE Forestal

USE Forestal;

--TABLA TIPO_EMPLEADO
CREATE TABLE tipo_empleado(
	id_TipoEmpleado INT IDENTITY(1,1) not null,
	nombre VARCHAR(50) not null,
	sueldoBasico DECIMAL(10,2) not null,
	activo VARCHAR(2) not null,
	CONSTRAINT PK_TipoEmpleado PRIMARY KEY (id_TipoEmpleado)
);

--TABLA EMPLEADO
CREATE TABLE empleado(
	cod_empleado INT IDENTITY(1,1) not null,
	id_TipoEmpleado INT not null,
	legajo VARCHAR(15) not null,
	nombre VARCHAR(50) not null,
	apellido VARCHAR(50) not null,
	cuil BIGINT not null,
	fecha_ingreso DATE not null,
	activo VARCHAR(2) not null,
	CONSTRAINT PK_empleado PRIMARY KEY (cod_empleado),
	CONSTRAINT FK_empleado_tipo_empleado FOREIGN KEY (id_TipoEmpleado) REFERENCES tipo_empleado(id_TipoEmpleado),
);

--TABLA ANTICIPO
CREATE TABLE anticipo(
	id_anticipo INT not null,
	cod_empleado INT not null,
	fecha DATE not null,
	monto DECIMAL(10,2) not null,
	periodo VARCHAR(7) not null,
	detalle VARCHAR(200) not null,
	CONSTRAINT PK_anticipo PRIMARY KEY(id_anticipo),
	CONSTRAINT FK_anticipo_empleado FOREIGN KEY (cod_empleado) REFERENCES empleado(cod_empleado),
);


--TABLA TIPO VALE
CREATE TABLE tipo_vale(
	id_tipo_vale INT IDENTITY(1,1) not null,
	nombre VARCHAR(50) not null,
	direccion VARCHAR(200) not null,
	CONSTRAINT PK_tipo_vale PRIMARY KEY (id_tipo_vale)
);

--TABLA VALE
CREATE TABLE vale(
	nro_vale INT not null,
	cod_empleado INT not null,
	id_tipo_vale INT not null,
	fecha DATE not null,
	monto DECIMAL(10,2) not null,
	periodo VARCHAR(7) not null,
	CONSTRAINT PK_vale PRIMARY KEY(nro_vale),
	CONSTRAINT FK_vale_empleado FOREIGN KEY (cod_empleado) REFERENCES empleado(cod_empleado),
	CONSTRAINT FK_vale_supermercado FOREIGN KEY (id_tipo_vale) REFERENCES tipo_vale(id_tipo_vale)
);

--TABLA INSUMO
CREATE TABLE insumo(
	id_insumo INT IDENTITY(1,1) not null,
	producto VARCHAR(50) not null,
	precio DECIMAL(10,2) not null,
	proveedor INT not null,
	activo varchar(2) not null,
	CONSTRAINT PK_id_insumo PRIMARY KEY(id_insumo),
);

--TABLA EMPLEADO_INSUMO 
CREATE TABLE empleado_insumo(
	cod_empleado INT not null,
	id_insumo INT not null,
	fecha DATE not null,
	periodo VARCHAR(7) not null,
	cantidad int not null,
	CONSTRAINT PK_empleado_insumo PRIMARY KEY(cod_empleado, id_insumo, fecha),
	CONSTRAINT FK_empleado_insumo_empleado FOREIGN KEY (cod_empleado) REFERENCES empleado(cod_empleado),
	CONSTRAINT FK_empleado_insumo_insumo FOREIGN KEY (id_insumo) REFERENCES insumo(id_insumo),
);


--TABLA CORTE
CREATE TABLE corte(
	cod_corte INT IDENTITY(1,1) not null ,
	corte VARCHAR(50) not null,
	descripcion VARCHAR(200) not null,
	precioVenta DECIMAL(10,2) not null,
	activo VARCHAR(2) not null,
	CONSTRAINT PK_corte PRIMARY KEY(cod_corte)
);
--TABLA PRODUCCION
CREATE TABLE produccion(
	id_produccion INT IDENTITY(1,1),
	cod_corte INT not null,
	fecha DATE not null,
	CONSTRAINT PK_produccion PRIMARY KEY(id_produccion),
	CONSTRAINT FK_produccion_corte FOREIGN KEY (cod_corte) REFERENCES corte(cod_corte),
);

--TABLA PRODUCCION_CORTE
CREATE TABLE produccion_corte(
	id_produccion INT,
	cod_corte INT,
	CONSTRAINT PK_produccion_corte PRIMARY KEY (id_produccion, cod_corte)
);

--TABLA EMPLEADO_PRODUCCION
CREATE TABLE empleado_produccion(
	cod_empleado INT,
	id_produccion INT,
	CONSTRAINT PK_empleado_produccion PRIMARY KEY (cod_empleado, id_produccion),
	CONSTRAINT FK_empleado_produccion_empleado FOREIGN KEY (cod_empleado) REFERENCES empleado(cod_empleado),
	CONSTRAINT FK_empleado_produccion_produccion FOREIGN KEY (id_produccion) REFERENCES produccion(id_produccion)
);

--TABLA REMITO
CREATE TABLE remito(
	primeros INT not null,
	id_remito INT not null,
	id_produccion INT not null,
	fecha DATE not null,
	cantidad INT not null,
	CONSTRAINT PK_remito PRIMARY KEY (primeros, id_remito),
	CONSTRAINT FK_remito_produccion FOREIGN KEY (id_produccion) REFERENCES produccion(id_produccion)
);

--TABLA EMPLEADO REMITO
CREATE TABLE empleado_remito (
	cod_empleado INT,
	primeros INT,
	id_remito INT
	CONSTRAINT PK_empleado_remito PRIMARY KEY(cod_empleado, primeros, id_remito),
	CONSTRAINT FK_empleado_remito_emplead FOREIGN KEY (cod_empleado) REFERENCES empleado(cod_empleado),
	CONSTRAINT FK_empleado_remito_remito FOREIGN KEY (primeros,id_remito) REFERENCES remito(primeros,id_remito)
);

--RESTRICCIONES DE TABLAS--