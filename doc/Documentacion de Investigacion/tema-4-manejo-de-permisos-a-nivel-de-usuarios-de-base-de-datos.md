# TEMA 4: MANEJO DE PERMISOS A NIVEL DE USUARIOS DE BASE DE DATOS

**Este tema forma parte del Proyecto de Estudio e Investigación y tiene como objetivo analizar y aplicar los mecanismos de autorización en el Sistema de Gestión de Bases de Datos (DBMS), específicamente en SQL Server, garantizando la seguridad de acceso a la base de datos desarrollada para la clínica veterinaria.**

## I. Introducción Teórica: La Autorización en el DBMS

La **autorización** en SQL es el proceso de controlar qué identidades tienen permiso para realizar acciones sobre los objetos dentro de la base de datos. Esto se gestiona a nivel de **usuario** y **rol** de base de datos.

A diferencia de la autenticación (que verifica la identidad del usuario), la autorización define el alcance de las acciones permitidas (ej., leer datos sensibles, modificar la estructura de una tabla, ejecutar lógica de negocio). Este sistema es crucial para la seguridad, garantizando que solo los datos válidos y coherentes puedan ser manipulados.

### 1. Principios de Seguridad 

En la gestión de permisos a nivel de base de datos, los permisos se asignan a las siguientes entidades, conocidas como *principios de seguridad*:

1.  **Usuarios de Base de Datos:** Son las identidades individuales con acceso a la base de datos.
2.  **Roles:** Un **rol** es una colección lógica de privilegios que simplifica la administración, ya que permite otorgar o revocar permisos a un grupo en lugar de a usuarios individuales. Se utiliza la sentencia `CREATE ROLE` para definir nuevos roles de base de datos .

### 2. Principio de Mínimo Privilegio (PoLP)

La mejor práctica de seguridad, y la que guía este estudio, es el **Principio de Mínimo Privilegio**. Este principio dictamina que se debe otorgar a un usuario o rol solo los permisos estrictamente necesarios para que pueda realizar su tarea y nada más.

Los permisos se gestionan a través de comandos del Lenguaje de Control de Datos (DCL):

*   **`GRANT`**: Otorga permisos a un usuario o rol (ej., `GRANT SELECT ON Tabla TO Usuario`).
*   **`REVOKE`**: Retira permisos previamente otorgados.
*   **`DENY`**: Prohíbe explícitamente un permiso. Una denegación siempre tiene prioridad sobre una concesión explícita.

### 3. Seguridad por Encapsulamiento: El Rol del Procedimiento Almacenado

Un aspecto fundamental que se explora en el Tema 4 es cómo los **Procedimientos Almacenados** (P.A.) refuerzan la seguridad.

Los P.A. son bloques de código SQL almacenados en el DBMS que encapsulan lógica de negocio. Una de sus ventajas cruciales es la **seguridad**. En lugar de otorgar a un usuario permisos directos de manipulación de datos (`INSERT`, `UPDATE`, `DELETE`) sobre una tabla, se le otorga únicamente el permiso de **`EXECUTE`** sobre el procedimiento almacenado.

Esto permite al usuario ejecutar la lógica de negocio (ej., insertar un cliente) sin tener acceso directo a la tabla `Cliente`, demostrando un aislamiento efectivo entre el usuario y los datos subyacentes, lo cual es la base de la prueba práctica en este tema.

## Transición a la Aplicación Práctica

En las siguientes etapas se implementarán estos conceptos en un entorno real de SQL Server, mediante la creación de usuarios y roles utilizando sentencias `GRANT`, `REVOKE` y `CREATE ROLE`, y la aplicación de permisos sobre las tablas del esquema de la clínica veterinaria (como `Cliente`, `Mascota` o `Certificado_Medico`), con el fin de verificar el comportamiento de cada caso y validar el Principio de Mínimo Privilegio.


## II. DESARROLLO DEL TEMA: IMPLEMENTACIÓN PRÁCTICA

Esta sección detalla la configuración del entorno, la creación de usuarios, la definición de roles y la verificación del comportamiento de los permisos en el contexto de la base de datos de la clínica veterinaria.

### FASE 2: Manejo de Permisos a Nivel de Usuarios (Seguridad por Encapsulamiento)

El objetivo de esta fase es demostrar que un usuario con privilegios mínimos (solo lectura) puede realizar operaciones DML (escritura) si se le otorga explícitamente el permiso de ejecución sobre un procedimiento almacenado.

#### 2.1. Configuración de Autenticación y Verificación de Entorno

Se verifica que el entorno del DBMS (SQL Server) esté configurado para permitir la autenticación de usuarios de base de datos (`SQL Server authentication`), además de la autenticación integrada con Windows. Esta configuración es conocida como **Modo Mixto** [5], y es indispensable para poder crear los `Logins` y `Users` necesarios para las pruebas de permisos [6].

***

**INSERCIÓN DE CAPTURA DE PANTALLA**

> **Aquí debe insertarse la Captura 3.**
>
> **Título de la Figura:** **Verificación del Modo de Autenticación (Captura 3)**.
> **Descripción:** Captura de pantalla que muestra la configuración de la instancia de SQL Server, confirmando que el modo de autenticación está establecido en **Modo Mixto**, permitiendo el uso de inicios de sesión nativos de SQL Server.

***

#### 2.2. Creación de Logins y Usuarios

Se crean dos *Logins* (a nivel de servidor) y dos *Usuarios* (a nivel de base de datos), que serán utilizados para la prueba: uno con permisos de administrador (`Usuario_Admin`) y otro con privilegios mínimos (`Usuario_Lector`).

```sql
USE DB_Integrador_Grupo37;
GO

-- 1. Creación de Logins (Inicios de Sesión) en la instancia SQL Server
CREATE LOGIN Login_Admin WITH PASSWORD = 'AdminPass123!', CHECK_POLICY = OFF;
CREATE LOGIN Login_Lector WITH PASSWORD = 'LectorPass123!', CHECK_POLICY = OFF;

-- 2. Creación de Usuarios de Base de Datos mapeados a los Logins
CREATE USER Usuario_Admin FOR LOGIN Login_Admin;
CREATE USER Usuario_Lector FOR LOGIN Login_Lector;

#### 2.3. Asignación del Mínimo Privilegio

Se otorgan los permisos necesarios para cada usuario: Usuario_Admin obtiene control total, mientras que Usuario_Lector obtiene solo el permiso de lectura (SELECT) sobre la tabla de prueba (Cliente).
-- 3. Otorgar permiso de Administrador total sobre la BD
GRANT CONTROL TO Usuario_Admin;

-- 4. Otorgar permiso de SÓLO LECTURA (SELECT) sobre la tabla Cliente
GRANT SELECT ON OBJECT::dbo.Cliente TO Usuario_Lector;

#### 2.4. Pruebas de Inserción Directa (Fallo por Mínimo Privilegio)
Se verifica que la restricción de seguridad funciona, intentando realizar una inserción directa (INSERT) sobre la tabla Cliente desde la sesión del Usuario_Lector.
-- PRUEBA 2: INSERT DIRECTO CON USUARIO_LECTOR (DEBE FALLAR)
EXECUTE AS USER = 'Usuario_Lector';

-- Intento de inserción directa (se espera un error de permiso)
INSERT INTO dbo.Cliente (nombre_apellido_cliente, dni_cliente, telefono_cliente, correo_cliente, domicilio_cliente, baja)
VALUES ('Lector Fallido', '90000001', 1130009998, 'lector.fail@mail.com', 'Fail Street 200', 0);

REVERT;
GO

--------------------------------------------------------------------------------
INSERCIÓN DE CAPTURA DE PANTALLA
Aquí debe insertarse la Captura 1.
Título de la Figura: Falla de la Prueba DML (Captura 1). Descripción: Captura de pantalla del mensaje de error de SQL Server, confirmando que el Usuario_Lector recibe un mensaje de "Permiso Denegado" al intentar ejecutar la sentencia INSERT directamente sobre la tabla Cliente. Esto valida el Principio de Mínimo Privilegio.

--------------------------------------------------------------------------------
#### 2.5. Prueba de Seguridad por Encapsulamiento
Se otorga el permiso de ejecución (EXECUTE) sobre el procedimiento almacenado (SP_InsertarCliente), que realiza la misma operación de inserción.
-- 5. OTORGAR PERMISO DE EXECUTE SOBRE EL PROCEDIMIENTO ALMACENADO
-- Se permite al Usuario_Lector ejecutar el código encapsulado.
GRANT EXECUTE ON OBJECT::dbo.SP_InsertarCliente TO Usuario_Lector;
GO

-- PRUEBA 3: INSERT VÍA P.A. CON USUARIO_LECTOR (DEBE FUNCIONAR)
EXECUTE AS USER = 'Usuario_Lector';

-- Ejecución del procedimiento almacenado:
EXEC dbo.SP_InsertarCliente 
    @NombreApellido = 'Lector Exitoso', 
    @DNI = '90000002', 
    @Telefono = 1130009997, 
    @Correo = 'lector.success@mail.com', 
    @Domicilio = 'Success Street 300', 
    @Baja = 0;

REVERT;
GO

--------------------------------------------------------------------------------
INSERCIÓN DE CAPTURA DE PANTALLA
Aquí debe insertarse la Captura 2.
Título de la Figura: Éxito de la Prueba DML a través del P.A. (Captura 2). Descripción: Captura de pantalla del resultado de la ejecución del SP_InsertarCliente, mostrando que la operación DML (INSERT) fue exitosa. Esto demuestra la Seguridad por Encapsulamiento, donde el usuario puede realizar la tarea necesaria sin tener permisos directos de escritura sobre el objeto subyacente (Cliente).

--------------------------------------------------------------------------------
FASE 3: Manejo de Permisos a Nivel de Roles del DBMS
(A continuación se detallarán los pasos para la Fase 3, donde se creará un rol de solo lectura para la tabla Certificado_Medico.)
