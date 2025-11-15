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

--------------------------------------------------------------------------------
--Pruebas de Inserción Directa (Verificación del Mínimo Privilegio)
/*
Objetivo: Verificar que el Usuario_Lector, con solo permiso de SELECT, 
no puede realizar operaciones de escritura (INSERT) en la tabla Cliente
*/

--Paso A: Prueba de Inserción del Administrador (Éxito esperado)
--Se simula la conexión como Usuario_Admin usando EXECUTE AS para realizar una inserción directa.

-- PRUEBA 1: INSERT directo con usuario_admin (debe funcionar)
EXECUTE AS USER = 'Usuario_Admin';
INSERT INTO dbo.Cliente (nombre_apellido_cliente, dni_cliente, telefono_cliente, correo_cliente, domicilio_cliente, baja)
VALUES ('Admin Test Insert', '90000000', 1130009999, 'admin.insert@mail.com', 'Admin Street 100', 0);
REVERT; -- Vuelve al contexto original (su propio usuario/login)
GO

--Paso B: Prueba de Inserción del Lector
--Se simula la conexión como Usuario_Lector y se intenta realizar una inserción directa.

-- PRUEBA 2: INSERT directo con Usuario_Lector (debe fallar)
EXECUTE AS USER = 'Usuario_Lector';

-- Intento de inserción directa:
INSERT INTO dbo.Cliente (nombre_apellido_cliente, dni_cliente, telefono_cliente, correo_cliente, domicilio_cliente, baja)
VALUES ('Lector Fallido', '90000001', 1130009998, 'lector.fail@mail.com', 'Fail Street 200', 0);

REVERT;
GO

--------------------------------------------------------

--Otorgar Permiso de Ejecución y Prueba de Encapsulamiento
/*
Objetivo: Demostrar que, aunque el usuario no puede insertar datos directamente, 
puede hacerlo si se le otorga el permiso EXECUTE sobre un objeto (el P.A.) que encapsula la lógica de inserción
*/

--Paso A: Otorgar Permiso de Ejecución
-- 5. Otorgar Permiso de execute sobre el procedimiento almacenado 
-- Esto no le da permiso INSERT sobre la tabla, solo sobre la ejecución del P.A.
GRANT EXECUTE ON OBJECT::dbo.SP_InsertarCliente TO Usuario_Lector;
GO

--Paso B: Prueba de Inserción a través del P.A. 
-- Prueba 3: INSERT via P.A. con Usuario_Lector (debe funcionar)
EXECUTE AS USER = 'Usuario_Lector';

-- Se ejecuta el procedimiento, lo que demuestra la seguridad por encapsulamiento:
EXEC dbo.SP_InsertarCliente 
    @NombreApellido = 'Lector Exitoso', 
    @DNI = '90000002', 
    @Telefono = 1130009997, 
    @Correo = 'lector.success@mail.com', 
    @Domicilio = 'Success Street 300', 
    @Baja = 0;

REVERT;
GO

--Paso C: Verificación del Resultado
-- Verificación (Ejecutar en el contexto original o como Usuario_Admin)
SELECT * FROM Cliente WHERE dni_cliente IN ('90000000', '90000001', '90000002');