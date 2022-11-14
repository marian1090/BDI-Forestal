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
--TRANSACCIONES
--------------------------------------

-- CARGA DE REGISTROS DE LA TABLA "empleado_remito"
DECLARE @alta VARCHAR(50);
SELECT @alta = 'AltaEmpleados_Remitos';

	BEGIN TRANSACTION @Alta;
	USE Forestal;

	BEGIN TRY
		INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (9,6,14);
		INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (2,6,14);
		INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (8,6,14);
		INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (14,6,14);
		COMMIT TRANSACTION @Alta
		PRINT 'EL REMITO SE HA AGREGADO CORRECTAMENTE A CADA EMPLEADO'
	END TRY
	BEGIN CATCH
		/*SI OCCURRE UN ERROR EN EL ALTA*/
		ROLLBACK TRANSACTION @Alta
		RAISERROR('HUBO UN ERROR INESPERADO', 16, 1)
	END CATCH


-- CARGA DE REGISTROS DE LA TABLA "empleado_produccion"
DECLARE @alta VARCHAR(50);
SELECT @Alta = 'AltaEmpleados_Produccion';

	BEGIN TRY
		INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (14,5);
		INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (8,5);
		INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (9,5);
		INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (2,5);
		INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (15,5)
	
		COMMIT TRANSACTION @Alta
		PRINT 'LOS EMPLEADOS DE LA PRODUCCION SE HAN AGREGADO CORRECTAMENTE'
	END TRY
	BEGIN CATCH
		/*SI OCCURRE UN ERROR EN EL ALTA*/
		ROLLBACK TRANSACTION @Alta
		RAISERROR('HUBO UN ERROR INESPERADO', 16, 1)
	END CATCH


-- CARGA DE REGISTROS DE LA TABLA "produccion_corte"
DECLARE @alta VARCHAR(50);
SELECT @Alta = 'AltaProduccion_Corte';

	BEGIN TRY
		INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (5,10,120);
		INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (5,9,80);
		INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (5,15,150);
		INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (5,3,75);
	
		COMMIT TRANSACTION @Alta
		PRINT 'LOS CORTES DE LA PRODUCCION SE HAN AGREGADO CORRECTAMENTE'
	END TRY
	BEGIN CATCH
		/*SI OCCURRE UN ERROR EN EL ALTA*/
		ROLLBACK TRANSACTION @Alta
		RAISERROR('HUBO UN ERROR INESPERADO', 16, 1)
	END CATCH
