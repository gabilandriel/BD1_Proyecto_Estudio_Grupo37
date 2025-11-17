/*En esta tarea utilizaremos la tabla Certificado_Medico para las pruebas, 
ya que contiene información delicada (diagnostico y observacion). 
Crearemos un rol que solo tenga permiso de lectura (SELECT) sobre esta tabla y probaremos el acceso en dos usuarios: 
uno asignado al rol y otro no*/

--Manejo de Permisos a Nivel de Roles del DBMS

--1. Creación de pruebas y definicion del rol
/*Objetivo: Crear dos nuevos pares de Logins/Usuarios para la prueba y 
definir un rol de base de datos definido por el usuario que contenga el permiso SELECT para los datos médicos.*/

USE DB_Integrador_Grupo37;
GO

-- a. Crear Logins (Inicios de sesión) para la prueba de roles
CREATE LOGIN Login_a WITH PASSWORD = 'Jose123', CHECK_POLICY = OFF;
CREATE LOGIN Login_b WITH PASSWORD = 'Jorge456', CHECK_POLICY = OFF;

-- b. Crear usuarios de base de datos mapeados a los Logins
CREATE USER Usuario_a FOR LOGIN Login_a;
CREATE USER Usuario_b FOR LOGIN Login_b;

-- c. Crear un rol de base de datos definido por el usuario
-- El rol es una colección lógica de privilegios.
CREATE ROLE Rol_Lector; 

-- d. Otorgar permiso SELECT sobre la tabla Certificado_Medico al rol
-- Los permisos se gestionan a través de roles para simplificar la administración.
GRANT SELECT ON OBJECT::dbo.Certificado_Medico TO Rol_Lector;

-- e. Asignar el rol a un usuario (Usuario_a)
-- Usuario_a hereda los permisos del rol.
ALTER ROLE Rol_Lector ADD MEMBER Usuario_a;

-- Usuario_b NO se asigna al rol, por lo que no tendrá permisos sobre Certificado_Medico.

--2 Pruebas de comportamiento de lectura (Herencia de Permisos)
/*Objetivo: Demostrar el concepto de herencia de permisos verificando que el usuario que pertenece al rol puede leer la tabla, 
mientras que el que no pertenece es denegado*/

--Paso A: prueba de lectura con usuario asginado a rol (exito esperado)

--Simulamos la coneccion como Usuario_a

--Prueba 1: SELECT con Usuario_a (miembro del rol) - tiene que funcionar
EXECUTE AS USER = 'Usuario_a';

-- Intento de lectura de datos sensibles (Certificado_Medico)
SELECT TOP 5 * 
FROM dbo.Certificado_Medico;

REVERT; 
GO

--Paso B: prueba de lectura con Usuario sin asginacion al rol (se espera un fallo)

--Simulamos la conexión como Usuario_b, que no es miembro del rol.

-- Prueba 2: SELECT con Usuario_b (NO es miembro de el rol)
EXECUTE AS USER = 'Usuario_b';

-- Intento de lectura de datos sensibles
SELECT TOP 5 * 
FROM dbo.Certificado_Medico;

REVERT;
GO