CREATE DATABASE forestal


--TABLA TIPO_EMPLEADO
--TABLA EMPLEADO
--TABLA ANTICIPO
--TABLA SUPERMERCADO

--TABLA VALE
CREATE TABLE vale(
nro_vale INT,
cod_empleado INT,
id_tipo_vale INT,
fecha DATE,
monto DECIMAL(10,2),
periodo VARCHAR(7)
CONSTRAINT FK_cod_empleado_vale FOREIGN KEY (cod_empleado) REFERENCES empleados(cod_empleado),
CONSTRAINT FK_id_tipo_vale FOREIGN KEY (id_tipo_vale) REFERENCES tipo_vales(id_tipo_vale)
);
--TABLA INSUMO
CREATE TABLE insumo(
id_insumo INT IDENTITY(1,1),
producto VARCHAR(50),
precio DECIMAL(10,2),
proveedor INT,
activo varchar(2)
CONSTRAINT PK_id_insumo PRIMARY KEY,
);
--TABLA EMPLEADO_INSUMO 
CREATE TABLE empleado_insumo(
cod_empleado INT,
id_insumo INT,
fecha DATE,
periodo VARCHAR(7),
cantidad int
CONSTRAINT PK_intermedia_insumo PRIMARY KEY(cod_empleado,id_insumo,fecha),
CONSTRAINT FK_cod_empleado_insumo FOREIGN KEY (cod_empleado) REFERENCES empleados(cod_empleado),
CONSTRAINT FK_cod_id_insumo_insumo FOREIGN KEY (id_insumo) REFERENCES insumo(id_insumo),
);
--TABLA REMITO
CREATE TABLE remito(
primeros INT,
id_remito INT,
id_produccion INT,
fecha DATE,
cantidad INT
CONSTRAINT PK_nro_remito PRIMARY KEY (primeros,id_remito),
CONSTRAINT FK_id_produccion_remito FOREIGN KEY (id_produccion) REFERENCES produccion(id_produccion),
);
--TABLA EMPLEADO REMITO
CREATE TABLE empleado_remito (
cod_empleado INT,
primeros INT,
id_remito INT
CONSTRAINT FK_cod_empleado FOREIGN KEY (cod_empleado) REFERENCES empleados(cod_empleado),
CONSTRAINT FK_primeros_remito FOREIGN KEY (primeros,id_remito) REFERENCES remito(primeros,id_remito),
);

--TABLA CORTE
CREATE TABLE corte(
cod_corte INT IDENTITY(1,1), 
corte VARCHAR(50),
descripcion varchar(200),
precioVenta DECIMAL(10,2),
activo VARCHAR(2)
CONSTRAINT PK_cod_corte PRIMARY KEY,
);
--TABLA PRODUCCIONES
CREATE TABLE produccion(
id_produccion INT IDENTITY(1,1),
cod_corte INT
CONSTRAINT PK_id_produccion PRIMARY KEY,
CONSTRAINT FK_cod_corte_produccion FOREIGN KEY (cod_corte) REFERENCES corte(cod_corte),
);
--TABLA PRODUCCIONES_CORTE
CREATE TABLE produccion_corte(
id_produccion INT,
cod_corte INT,
CONSTRAINT PK_produccion_corte PRIMARY KEY (id_produccion, cod_corte),
);
--TABLA EMPLEADO_PRODUCCIONES
CREATE TABLE empleados_produccion(
cod_empleado INT,
id_produccion INT
CONSTRAINT PK_intermedia_produccion PRIMARY KEY (cod_empleado,id_produccion),
CONSTRAINT FK_cod_empleado_emp_produccion FOREIGN KEY (cod_empleado) REFERENCES empleados(cod_empleado),
CONSTRAINT FK_id_produccion_emp_produccion FOREIGN KEY (id_produccion) REFERENCES produccion(id_produccion),
);
