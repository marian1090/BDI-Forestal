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
	id_TipoEmpleado INT IDENTITY not null,
	nombre VARCHAR(50) not null,
	sueldoBasico DECIMAL(10,2) not null,
	activo VARCHAR(2) not null,
	CONSTRAINT PK_TipoEmpleado PRIMARY KEY (id_TipoEmpleado)
);

--TABLA EMPLEADO
CREATE TABLE empleado(
	cod_empleado INT IDENTITY not null,
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
	id_anticipo INT IDENTITY not null,
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
	id_tipo_vale INT IDENTITY not null,
	nombre VARCHAR(50) not null,
	direccion VARCHAR(200) not null,
	CONSTRAINT PK_tipo_vale PRIMARY KEY (id_tipo_vale)
);

--TABLA VALE
CREATE TABLE vale(
	nro_vale INT IDENTITY not null,
	cod_empleado INT not null,
	id_tipo_vale INT not null,
	fecha DATE not null,
	monto DECIMAL(10,2) not null,
	periodo VARCHAR(7) not null,
	CONSTRAINT PK_vale PRIMARY KEY(nro_vale),
	CONSTRAINT FK_vale_empleado FOREIGN KEY (cod_empleado) REFERENCES empleado(cod_empleado),
	CONSTRAINT FK_vale_supermercado FOREIGN KEY (id_tipo_vale) REFERENCES tipo_vale(id_tipo_vale)
);

--TABLA PROVEEDOR
CREATE TABLE proveedor(
	id_proveedor INT IDENTITY not null,
	nombre VARCHAR(50) not null,
	direccion VARCHAR(2000) not null,
	CONSTRAINT PK_proveedor PRIMARY KEY(id_proveedor)
);

--TABLA INSUMO
CREATE TABLE insumo(
	id_insumo INT IDENTITY not null,
	producto VARCHAR(50) not null,
	precio DECIMAL(10,2) not null,
	id_proveedor INT not null,
	activo varchar(2) not null,
	CONSTRAINT PK_insumo PRIMARY KEY(id_insumo),
	CONSTRAINT FK_insumo_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

--TABLA EMPLEADO_INSUMO 
CREATE TABLE empleado_insumo(
	cod_empleado INT not null,
	id_insumo INT not null,
	fecha DATE not null,
	periodo VARCHAR(7) not null,
	cantidad int not null,
	CONSTRAINT PK_empleado_insumo PRIMARY KEY(id_insumo, cod_empleado, fecha),
	CONSTRAINT FK_empleado_insumo_empleado FOREIGN KEY (cod_empleado) REFERENCES empleado(cod_empleado),
	CONSTRAINT FK_empleado_insumo_insumo FOREIGN KEY (id_insumo) REFERENCES insumo(id_insumo),
);


--TABLA CORTE
CREATE TABLE corte(
	cod_corte INT IDENTITY not null ,
	corte VARCHAR(50) not null,
	descripcion VARCHAR(200) not null,
	precioVenta DECIMAL(10,2) not null,
	activo VARCHAR(2) not null,
	CONSTRAINT PK_corte PRIMARY KEY(cod_corte)
);
--TABLA PRODUCCION
CREATE TABLE produccion(
	id_produccion INT IDENTITY,
	fecha DATE not null,
	toneladas DECIMAL(10,2) not null,
	CONSTRAINT PK_produccion PRIMARY KEY(id_produccion),
);

--TABLA PRODUCCION_CORTE
CREATE TABLE produccion_corte(
	id_produccion INT,
	cod_corte INT,
	CONSTRAINT PK_produccion_corte PRIMARY KEY (id_produccion, cod_corte),
	CONSTRAINT FK_produccion_corte_produccion FOREIGN KEY (id_produccion) REFERENCES produccion(id_produccion),
	CONSTRAINT FK_produccion_corte_corte FOREIGN KEY (cod_corte) REFERENCES corte(cod_corte)
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
	id_remito INT IDENTITY not null,
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