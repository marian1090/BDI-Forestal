--TRIGGERS
CREATE TRIGGER TR_empleado ON empleado
FOR INSERT
AS 
PRINT 'Empleado Registrado'
INSERT INTO empleado (id_TipoEmpleado, legajo, nombre, apellido, cuil, fecha_ingreso, activo) VALUES(7,'13/0','ANDREZ','ESTEPA',	20149737856	,'10/01/1996','SI');


CREATE TRIGGER TR_Tipoempleado ON tipo_empleado FOR UPDATE
AS SET NOCOUNT ON 
DECLARE @id int = (SELECT id_TipoEmpleado FROM inserted)
UPDATE empleado SET activo = (SELECT activo FROM tipo_empleado 
								WHERE id_TipoEmpleado = @id)
WHERE id_TipoEmpleado = @id

UPDATE tipo_empleado SET activo = 'NO' WHERE id_TipoEmpleado = 8



CREATE TRIGGER TR_rem ON remito FOR UPDATE
AS DECLARE @id int = (SELECT id_remito FROM inserted)
UPDATE empleado_remito SET primeros = 
									(SELECT primeros FROM remito
									WHERE id_remito = @id)
WHERE id_remito = @id


CREATE TRIGGER TR_insumo ON insumo
INSTEAD OF DELETE 
AS DECLARE @id int = (SELECT id_insumo FROM deleted)
DELETE FROM empleado_insumo WHERE id_insumo = @id
DELETE FROM insumo WHERE id_insumo = @id