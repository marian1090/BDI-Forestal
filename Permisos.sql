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
--PERMISOS
--CREACION DE USUARIOS Y ASIGNACION DE ROLES.
--------------------------------------.

--CREACION  DE INICIO DE SESION ADMINISTRADOR y ROL SYSADMIN--
CREATE LOGIN [Administrador] WITH PASSWORD = '1234',
CHECK_EXPIRATION = OFF, 
CHECK_POLICY = OFF;
CREATE USER Gerente FOR LOGIN Administrador;
EXEC sys.sp_addsrvrolemember @loginame = N'Administrador', @rolename = N'sysadmin';



--CREACION  DE INICIO DE SESION ABM Y ROL DE LECTURA/ESCRITURA--
CREATE LOGIN [ABM] WITH PASSWORD = '1234',
CHECK_EXPIRATION = OFF, 
CHECK_POLICY = OFF,
DEFAULT_DATABASE = Forestal;
GO
USE Forestal;
CREATE USER Administrativo FOR LOGIN ABM;
EXEC sp_addrolemember 'db_datareader','Administrativo';
EXEC sp_addrolemember 'db_datawriter','Administrativo';
GO


--CREACION  DE INICIO DE SESION CONSULTA Y ROL PUBLICO--
CREATE LOGIN [Consulta] WITH PASSWORD = '1234',
CHECK_EXPIRATION = OFF, 
CHECK_POLICY = OFF,
DEFAULT_DATABASE = Forestal;
USE Forestal
CREATE USER Empleado FOR LOGIN Consulta;
-- ASIGNACION DE FUNCIONES DE USUARIO
--LOGIN: CONSULTA
GRANT select on VW_INSUMOS_UTILIZADOS to Empleado
GRANT select on VW_REMITO_PRODUCCION to Empleado
GRANT select on VW_VALES_UTILIZADOS to Empleado
Deny Insert, Delete, Update to Empleado


