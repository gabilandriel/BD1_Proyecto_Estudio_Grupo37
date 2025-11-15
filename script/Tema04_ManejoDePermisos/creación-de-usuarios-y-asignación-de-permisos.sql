CREATE TABLE Cliente
(
  id_cliente INT IDENTITY (1,1) NOT NULL,
  nombre_apellido_cliente VARCHAR(120) NOT NULL,
  dni_cliente VARCHAR(20) NOT NULL,
  telefono_cliente INT NOT NULL,
  correo_cliente VARCHAR(200) NOT NULL,
  domicilio_cliente VARCHAR(200) NOT NULL,
  baja BIT NOT NULL,
  CONSTRAINT PK_cliente PRIMARY KEY (id_cliente),
  CONSTRAINT UQ_cliente_dni UNIQUE (dni_cliente),
  CONSTRAINT UQ_cliente_correo UNIQUE (correo_cliente)
);


/**
Permisos a Nivel de Usuarios (Seguridad por Encapsulamiento)
Creación de Usuarios y Asignación de Permisos Iniciales
*/

USE DB_Integrador_Grupo37;
GO

-- Paso A: Creación de Logins (Autenticación SQL Server)
-- 1. Creación de Logins (Inicios de Sesión) en la instancia
CREATE LOGIN Login_Admin WITH PASSWORD = 'AdminPass123!', CHECK_POLICY = OFF;-- Se usa CHECK_POLICY = OFF para simplificar las contraseñas en el entorno de prueba.
CREATE LOGIN Login_Lector WITH PASSWORD = 'LectorPass123!', CHECK_POLICY = OFF;

--Paso B: Creación de Usuarios de Base de Datos
-- 2.  Creación de Usuarios de Base de Datos mapeados a los Logins
CREATE USER Usuario_Admin FOR LOGIN Login_Admin;
CREATE USER Usuario_Lector FOR LOGIN Login_Lector;

--Paso C: Asignación del Rol de Administrador y Permiso Básico
-- 3. Otorgar permiso de Administrador total sobre la BD
GRANT CONTROL TO Usuario_Admin;

-- 4. Otorgar permiso de SÓLO LECTURA (SELECT) sobre la tabla Cliente
-- Es crucial que NO le otorgue permisos INSERT/UPDATE/DELETE.
GRANT SELECT ON OBJECT::dbo.Cliente TO Usuario_Lector;



