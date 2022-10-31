CREATE DATABASE forestal


--TABLA TIPO_EMPLEADO
--TABLA EMPLEADO
--TABLA ANTICIPO
--TABLA SUPERMERCADO

--TABLA VALE
--TABLA INSUMO
--TABLA EMPLEADO_INSUMO 
--TABLA REMITO
--TABLA EMPLEADO REMITO

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
