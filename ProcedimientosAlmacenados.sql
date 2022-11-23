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
--PROCEDIMIENTOS ALMACENADOS
--------------------------------------

--Procidimiento para el alta de un empleado
CREATE PROCEDURE SP_AltaEmpleado
	@id_TipoEmpleado INT,
	@legajo VARCHAR(15),
	@nombre VARCHAR(50),
	@apellido VARCHAR(50),
	@cuil BIGINT,
	@fecha_ingreso DATE,
	@activo VARCHAR(2)
AS
BEGIN
	BEGIN TRY --manejador de errores
			INSERT INTO empleado(
						id_TipoEmpleado,
						legajo,nombre,
						apellido,
						cuil,
						fecha_ingreso,
						activo)
			VALUES (
					@id_TipoEmpleado,
					@legajo,
					@nombre,
					@apellido,
					@cuil,
					@fecha_ingreso,
					@activo)
				PRINT 'ALTA DE EMPLEADO GUARDADO CORRECTAMENTE'
	END TRY
	BEGIN CATCH
				PRINT 'OCURRIO UN ERROR '+'EN LA LINEA '+CONVERT(VARCHAR(255), ERROR_LINE())+'.'
	END CATCH
END

EXEC SP_AltaEmpleado 5, '54/89', 'ESTEBAN', 'ESCOBAR', 24258749514, '20221111', 'SI' --ok
EXEC SP_AltaEmpleado 5, '54/89', 'ESTEBAN', 'ESCOBAR', 24258749514, '20221111', 'SI' --error. legajo no es unico


--Procidimiento para el alta de un corte
CREATE PROCEDURE SP_AltaCorte
	@corte VARCHAR(50),
	@descripcion VARCHAR(200),
	@precioVenta DECIMAL(10,2),
	@activo VARCHAR(2)
AS
BEGIN
	BEGIN TRY --manejador de errores
			INSERT INTO corte(
						corte,
						descripcion,
						precioVenta,
						activo)
			VALUES (
					@corte,
					@descripcion,
					@precioVenta,
					@activo)
				PRINT 'ALTA DE CORTE GUARDADO CORRECTAMENTE'
	END TRY
	BEGIN CATCH
				PRINT 'OCURRIO UN ERROR '+'EN LA LINEA '+CONVERT(VARCHAR(255), ERROR_LINE())+'.'
	END CATCH
END

EXEC SP_AltaCorte 'FLE*Km1/MADER.ES', 'ROLLO PIN.Km1/MADE/ES', 42, 'SI' --ok
EXEC SP_AltaCorte 'FLE*Km1/MADER.ES', 'ROLLO PIN.Km1/MADE/ES', 42, 'OTRO' --error

--Procedimiento para el alta de un remito
CREATE PROCEDURE SP_AltaRemito
	@primeros INT,
	@id_produccion INT,
	@fecha DATE,
	@cantidad INT
AS
BEGIN
	BEGIN TRY --manejador de errores
			INSERT INTO remito(
						primeros,
						id_produccion,
						fecha,
						cantidad)
			VALUES (
					@primeros,
					@id_produccion,
					@fecha,
					@cantidad)
				PRINT 'ALTA DE REMITO GUARDADO CORRECTAMENTE'
	END TRY
	BEGIN CATCH
				PRINT 'OCURRIO UN ERROR '+'EN LA LINEA '+CONVERT(VARCHAR(255), ERROR_LINE())+'.'
	END CATCH
END

EXEC SP_AltaRemito 5, 4, '20221027', 60

SELECT * FROM remito ORDER BY id_remito

--Procedimiento para el alta de un remito-empleado
CREATE PROCEDURE SP_AltaRemitoEmpleado
	@cod_empleado INT,
	@primeros INT,
	@id_remito INT
AS
BEGIN
	BEGIN TRY --manejador de errores
			INSERT INTO empleado_remito(
						cod_empleado,
						primeros,
						id_remito)
			VALUES (
					@cod_empleado,
					@primeros,
					@id_remito)
				PRINT 'ALTA DE EMPLEADO REMITO GUARDADO CORRECTAMENTE'
	END TRY
	BEGIN CATCH
				PRINT 'OCURRIO UN ERROR '+'EN LA LINEA '+CONVERT(VARCHAR(255), ERROR_LINE())+'.'
	END CATCH
END

EXEC AltaRemitoEmpleado 11, 5, 14

SELECT * FROM empleado_remito ORDER BY id_remito