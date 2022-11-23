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
		INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (9,4,1);
		INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (2,4,1);
		INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (8,4,1);
		INSERT INTO empleado_remito (cod_empleado, primeros, id_remito) VALUES (14,4,1);
		COMMIT TRANSACTION @Alta
		PRINT 'EL REMITO SE HA AGREGADO CORRECTAMENTE A CADA EMPLEADO'
	END TRY
	BEGIN CATCH
		/*SI OCCURRE UN ERROR EN EL ALTA*/
		ROLLBACK TRANSACTION @Alta
		RAISERROR('HUBO UN ERROR INESPERADO', 16, 1)
	END CATCH


SELECT * FROM empleado_remito ORDER BY id_remito

-- CARGA DE REGISTROS DE LA TABLA "empleado_produccion"
DECLARE @alta VARCHAR(50);
SELECT @Alta = 'AltaEmpleados_Produccion';
	BEGIN TRAN @alta
		BEGIN TRY
			INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (14,7);
			INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (8,7);
			INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (9,7);
			INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (2,7);
			INSERT INTO empleado_produccion (cod_empleado, id_produccion) VALUES (15,7);
	
			COMMIT TRANSACTION @Alta
			PRINT 'LOS EMPLEADOS DE LA PRODUCCION SE HAN AGREGADO CORRECTAMENTE'
		END TRY
		BEGIN CATCH
			/*SI OCCURRE UN ERROR EN EL ALTA*/
			ROLLBACK TRANSACTION @Alta
			RAISERROR('HUBO UN ERROR INESPERADO', 16, 1)
		END CATCH


SELECT * FROM empleado_produccion ORDER by id_produccion

INSERT INTO produccion(fecha, toneladas) VALUES('20221130', 100)
SELECT * FROM produccion ORDER by id_produccion
 
-- CARGA DE REGISTROS DE LA TABLA "produccion_corte"
DECLARE @alta VARCHAR(50);
SELECT @Alta = 'AltaProduccion_Corte';
	BEGIN TRAN @Alta
	BEGIN TRY
		INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (7,10,120);
		INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (7,9,80);
		INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (7,15,150);
		INSERT INTO produccion_corte (id_produccion, cod_corte, cantidad) VALUES (7,3,75);
	
		COMMIT TRANSACTION @Alta
		PRINT 'LOS CORTES DE LA PRODUCCION SE HAN AGREGADO CORRECTAMENTE'
	END TRY
	BEGIN CATCH
		/*SI OCCURRE UN ERROR EN EL ALTA*/
		ROLLBACK TRANSACTION @Alta
		RAISERROR('HUBO UN ERROR INESPERADO', 16, 1)
	END CATCH


SELECT * FROM produccion_corte
