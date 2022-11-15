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
--TRIGGERS
--------------------------------------
--Muestra 'Empleado Registrado' cada vez que se registra uno
CREATE TRIGGER TR_empleado ON empleado
FOR INSERT
AS 
PRINT 'Empleado Registrado'
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES(7,'13/0','ANDREZ','ESTEPA',	20149737856	,'10/01/1996','SI');

--Cambia el activo a 'NO' de un empleado cuando el tipo de empleado asociado cambia a 'NO'
CREATE TRIGGER TR_Tipoempleado ON tipo_empleado FOR UPDATE
AS SET NOCOUNT ON 
DECLARE @id int = (SELECT id_TipoEmpleado FROM inserted)
UPDATE empleado SET activo = (SELECT activo FROM tipo_empleado 
								WHERE id_TipoEmpleado = @id)
WHERE id_TipoEmpleado = @id

UPDATE tipo_empleado SET activo = 'NO' WHERE id_TipoEmpleado = 8


--Cambia los primeros de la tabla empleado_remito cuando se modifican los primeros en la tabla remito
CREATE TRIGGER TR_rem ON remito FOR UPDATE
AS DECLARE @id int = (SELECT id_remito FROM inserted)
UPDATE empleado_remito SET primeros = 
									(SELECT primeros FROM remito
									WHERE id_remito = @id)
WHERE id_remito = @id

--Borra de la tabla empleado_produccion el registro asociado a una produccion cancelada
CREATE TRIGGER TR_empleado_produccion ON produccion
INSTEAD OF DELETE 
AS DECLARE @id int = (SELECT id_produccion FROM deleted)
DELETE FROM empleado_produccion WHERE id_produccion = @id
DELETE FROM produccion WHERE id_produccion = @id
