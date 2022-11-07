CREATE PROCEDURE AltaEmpleado
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

CREATE PROCEDURE AltaCorte
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


CREATE PROCEDURE AltaRemito
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


CREATE PROCEDURE AltaRemitoEmpleado
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