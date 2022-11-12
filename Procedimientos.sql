-- ERROR AL DAR ALTA EN TABLA empleado_remito
CREATE PROCEDURE TS_empleado_remito(
	@cod_empleado INT,
	@primeros INT,
	@id_remito INT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		INSERT INTO empleado_remito(cod_empleado,primeros,id_remito) 
		VALUES(@cod_empleado,@primeros,@id_remito)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		RAISERROR('HUBO UN ERROR INESPERADO', 16, 1)
	END CATCH
END

-- ERROR AL DAR ALTA EN TABLA empleado_produccion
CREATE PROCEDURE TS_empleado_produccion(
	@cod_empleado INT,
	@id_produccion INT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		INSERT INTO empleado_produccion(cod_empleado,id_produccion)
		VALUES(@cod_empleado,@id_produccion)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		RAISERROR('HUBO UN ERROR INESPERADO', 16, 1)
	END CATCH
END

-- ERROR AL DAR ALTA EN TABLA empleado_produccion
CREATE PROCEDURE TS_produccion_corte(
	@id_produccion INT,
	@cod_corte INT,
	@cantidad INT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		INSERT INTO produccion_corte(id_produccion,cod_corte,cantidad)
		VALUES(@id_produccion,@cod_corte,@cantidad)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		RAISERROR('HUBO UN ERROR INESPERADO', 16, 1)
	END CATCH
END