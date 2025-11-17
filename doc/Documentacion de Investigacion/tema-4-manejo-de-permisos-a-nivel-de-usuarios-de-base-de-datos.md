# TEMA 4: MANEJO DE PERMISOS A NIVEL DE USUARIOS DE BASE DE DATOS

**Este tema forma parte del Proyecto de Estudio e Investigación y tiene como objetivo analizar y aplicar los mecanismos de autorización en el Sistema de Gestión de Bases de Datos (DBMS), específicamente en SQL Server, garantizando la seguridad de acceso a la base de datos desarrollada para la clínica veterinaria.**

## I. Introducción Teórica: La Autorización en el DBMS

La **autorización** en SQL es el proceso de controlar qué identidades tienen permiso para realizar acciones sobre los objetos dentro de la base de datos. Esto se gestiona a nivel de **usuario** y **rol** de base de datos.

A diferencia de la autenticación (que verifica la identidad del usuario), la autorización define el alcance de las acciones permitidas (ej., leer datos sensibles, modificar la estructura de una tabla, ejecutar lógica de negocio). Este sistema es crucial para la seguridad, garantizando que solo los datos válidos y coherentes puedan ser manipulados.

### 1. Principals de Seguridad (Security Principals)

En la gestión de permisos a nivel de base de datos, los permisos se asignan a las siguientes entidades, conocidas como *principales de seguridad*:

•  **Usuarios de Base de Datos:** Son las identidades individuales con acceso a la base de datos.
•  **Roles:** Un **rol** es una colección lógica de privilegios que simplifica la administración, ya que permite otorgar o revocar permisos a un grupo en lugar de a usuarios individuales. Se utiliza la sentencia `CREATE ROLE` para definir nuevos roles de base de datos.

Un principal de seguridad es la identidad que SQL Server utiliza y a la que se le pueden asignar permisos para realizar acciones. Estos principales son las entidades a las que se otorgan, se deniegan o se revocan los permisos mediante sentencias DCL (GRANT, DENY, REVOKE)

La seguridad en el Database Engine (Motor de Base de Datos) se gestiona en una jerarquía de dos niveles principales

1.1 **Nivel de Servidor: Los Logins**
Los Logins son cuentas de usuario individuales que se utilizan para la autenticación; es decir, para iniciar sesión en la instancia de SQL Server. Pueden basarse en la autenticación de Windows o en la autenticación de SQL Server.

• Rol: Autentican la identidad y permiten el acceso a la instancia del servidor.

• Ejemplo en la Práctica: Login_Admin y Login_Lector son ejemplos de Logins creados a nivel del servidor.

1.2. **Nivel de Base de Datos: Los Usuarios y Roles**
Para que un Login tenga acceso a los datos dentro de una base de datos específica, se debe crear un Usuario de Base de Datos dentro de esa base de datos y mapearlo al Login correspondiente. Los permisos sobre los objetos internos (tablas, procedimientos, vistas) se asignan a estos Usuarios o a los Roles de Base de Datos.

• Rol: Definen la autorización y el alcance de las acciones permitidas dentro de una base de datos específica.

• Ejemplo en la Práctica: Usuario_Admin y Usuario_Lector son Usuarios de Base de Datos creados y son los principales a los que se les otorgó el permiso SELECT o CONTROL en la FASE 2.

### Roles de Base de Datos:
Los Roles son un tipo de principal de seguridad a nivel de base de datos definidos por el usuario, cuyo objetivo es representar grupos de usuarios con permisos comunes. Otorgar o denegar permisos a un rol simplifica la gestión y el monitoreo, ya que los miembros de ese rol heredan automáticamente sus privilegios.

• Rol: Colección lógica de privilegios para simplificar la gestión de permisos.

• Ejemplo en la Práctica: La FASE 3 se enfocó en el uso de roles definidos por el usuario para controlar el acceso a la tabla Certificado_Medico.

### 2. Lenguaje de Control de Datos (DCL): La Gestión de Permisos

La Autorización en SQL se implementa principalmente a través del Lenguaje de Control de Datos (DCL). El DCL define los comandos que permiten controlar el acceso a los datos y a los objetos dentro de la base de datos.

**Las tres sentencias fundamentales del DCL son:**

*   **`GRANT`**: Otorga permisos específicos sobre un objeto de seguridad (securable) a un principal (usuario o rol), Utilizada en la FASE 2 para otorgar SELECT y EXECUTE.
*   **`REVOKE`**: Remueve o retira un permiso previamente otorgado a un principal, Se usa para deshacer una GRANT 
*   **`DENY`**: Prohíbe explícitamente a un principal la posesión de un permiso sobre un objeto, Es crucial, ya que un DENY prevalece y anula cualquier permiso GRANT que el usuario pueda recibir por otros medios (ej. pertenencia a múltiples roles).

2.1. **Uso de GRANT para Otorgar Privilegios**

La sintaxis general de la concesión de permisos (GRANT) es: GRANT <permiso> ON <objeto>::<nombre> TO <principal>.
    1. Concesión de Lectura (SELECT): En la FASE 2, utilizamos GRANT SELECT para otorgar al Usuario_Lector el acceso de solo lectura a la tabla Cliente, cumpliendo con el Principio de Mínimo Privilegio. El permiso SELECT aplica a sinónimos, tablas y vistas.

    2. Concesión de Ejecución (EXECUTE): El permiso EXECUTE se utiliza para permitir que un principal ejecute una función, un procedimiento almacenado o un script externo. Este permiso fue clave en la FASE 2 para demostrar la seguridad por encapsulamiento.

2.2. **Gestión Centralizada a través de Roles**

    El uso de Roles es la estrategia recomendada para simplificar la administración de permisos. Un rol es una colección de privilegios que se pueden asignar a varios usuarios.

    • Creación del Rol: Se realiza con la sentencia CREATE ROLE role_name. Los roles son elementos de seguridad a nivel de base de datos (database-level securables).

    • Asignación de Membresía: Una vez que se crea el rol y se le asignan permisos (mediante GRANT), los usuarios se añaden al rol utilizando ALTER ROLE ... ADD MEMBER.

La FASE 3 se enfoca precisamente en demostrar esta técnica, donde se asignó el permiso SELECT sobre la tabla Certificado_Medico al Rol_Lector y no a cada usuario individualmente.

### 3. El Principio de Mínimo Privilegio y la Seguridad por Encapsulamiento

La gestión de la seguridad en bases de datos sigue el Principio de Mínimo Privilegio (PoLP, por sus siglas en inglés), el cual dicta que a todo principal de seguridad (usuario o rol) se le debe otorgar solo los permisos estrictamente necesarios para que realice su tarea asignada. Este principio minimiza el riesgo de seguridad en caso de una intrusión o error de usuario.

La aplicación de este principio se demuestra a través de la Seguridad por Encapsulamiento, un mecanismo avanzado logrado mediante el uso de Procedimientos Almacenados (P.A.)

3.1 **Funcionalidad del Encapsulamiento**
Los procedimientos y funciones almacenados son bloques de código SQL que se almacenan directamente en la base de datos y encapsulan lógica de negocio. Una de sus ventajas clave en el contexto de la seguridad es que permiten otorgar permisos para ejecutar un procedimiento sin dar acceso directo a las tablas subyacentes.

    • Permiso EXECUTE: El permiso EXECUTE es necesario para permitir a un principal ejecutar un procedimiento almacenado. Este permiso se utiliza para conceder la capacidad de realizar la lógica de negocio encapsulada.

    • Aislamiento: El usuario puede ejecutar la lógica necesaria (como un INSERT o UPDATE complejo) al invocar el P.A., incluso si el usuario no posee los permisos DML (INSERT, UPDATE, DELETE) directamente sobre las tablas que el P.A. manipula.

### 3.2. Vinculación con la Implementación Práctica (FASE 2)
El caso práctico implementado en la FASE 2 demuestra esta sinergia de conceptos:

    1. Aplicación del Mínimo Privilegio: Se crea un Usuario_Lector y solo se le otorga el permiso SELECT sobre la tabla Cliente, restringiendo cualquier capacidad de escritura directa.

    2. Verificación del Encapsulamiento: Para permitirle al Usuario_Lector insertar datos, se le otorga GRANT EXECUTE sobre el procedimiento almacenado SP_InsertarCliente.

    3. Resultado Semántico: El usuario no puede ejecutar una sentencia INSERT directa sobre la tabla (debido al PoLP), pero sí puede realizar la tarea necesaria a través del procedimiento almacenado (demostrando la seguridad por encapsulamiento), lo cual es un objetivo explícito de la implementación práctica.

## Transición a la Aplicación Práctica

En las siguientes etapas se implementarán estos conceptos en un entorno real de SQL Server, mediante la creación de usuarios y roles utilizando sentencias `GRANT`, `REVOKE` y `CREATE ROLE`, y la aplicación de permisos sobre las tablas del esquema de la clínica veterinaria (como `Cliente`, `Mascota` o `Certificado_Medico`), con el fin de verificar el comportamiento de cada caso y validar el Principio de Mínimo Privilegio.


## II. DESARROLLO DEL TEMA: IMPLEMENTACIÓN PRÁCTICA

Esta sección detalla la configuración del entorno, la creación de usuarios, la definición de roles y la verificación del comportamiento de los permisos en el contexto de la base de datos de la clínica veterinaria.

### FASE 2: Manejo de Permisos a Nivel de Usuarios (Seguridad por Encapsulamiento)

El objetivo de esta fase es demostrar que un usuario con privilegios mínimos (solo lectura) puede realizar operaciones DML (escritura) si se le otorga explícitamente el permiso de ejecución sobre un procedimiento almacenado.

#### 2.1. Configuración de Autenticación y Verificación de Entorno

Se verifica que el entorno del DBMS (SQL Server) esté configurado para permitir la autenticación de usuarios de base de datos (`SQL Server authentication`), además de la autenticación integrada con Windows. Esta configuración es conocida como **Modo Mixto**, y es indispensable para poder crear los `Logins` y `Users` necesarios para las pruebas de permisos .

![Verificación del Modo de Autenticación](../../script/Tema04_ManejoDePermisos/Imagenes/verificacion-modo-mixto.png)

![Inicio de Secion sa](../../script/Tema04_ManejoDePermisos/Imagenes/inicio-credenciales.png)

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
```

![Falla de la Prueba](../../script/Tema04_ManejoDePermisos/Imagenes/falla-prueba-cap1.png)

--------------------------------------------------------------------------------
#### 2.5. Prueba de Seguridad por Encapsulamiento
```sql
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
```

![Prueba de exito](../../script/Tema04_ManejoDePermisos/Imagenes/exito-prueba-cap2.png)

![Consulta de verificacion](../../script/Tema04_ManejoDePermisos/Imagenes/captura-verificacion-final.png)

--------------------------------------------------------------------------------
### FASE 3: Manejo de Permisos a Nivel de Roles del DBMS

Esta fase implementa un caso práctico para la gestión de permisos a través de **Roles de Base de Datos**. El uso de roles permite otorgar o revocar permisos a múltiples usuarios de manera centralizada, reforzando la seguridad y el mantenimiento. La prueba se realiza sobre la tabla **`Certificado_Medico`**, la cual contiene información sensible de diagnóstico .

#### 3.1. Creación de Roles y Asignación de Permisos

Se crea el rol `Rol_Lector` y se le otorga el permiso `SELECT` sobre la tabla sensible. Luego, solo `Usuario_a` es agregado como miembro del rol.

```sql
USE DB_Integrador_Grupo37;
GO

-- 1. Crear logins y usuarios de prueba
CREATE LOGIN Login_a WITH PASSWORD = 'Jose123', CHECK_POLICY = OFF;
CREATE USER Usuario_a FOR LOGIN Login_a;
CREATE LOGIN Login_b WITH PASSWORD = 'Jorge456', CHECK_POLICY = OFF;
CREATE USER Usuario_b FOR LOGIN Login_b;

-- 2. Creacion del rol
CREATE ROLE Rol_Lector; 

-- 3.Otorgar permiso SELECT al rol
GRANT SELECT ON OBJECT::dbo.Certificado_Medico TO Rol_Lector;

-- 4.Asignar el rol a un usuario 
ALTER ROLE Rol_Lector ADD MEMBER Usuario_a;
3.2. Verificación del Comportamiento por Pertenencia al Rol
Se ejecuta la misma consulta SELECT bajo el contexto de ambos usuarios para demostrar la herencia de privilegios.
-- PRUEBA A SELECT CON Usuario_a  - DEBE FUNCIONAR
EXECUTE AS USER = 'Usuario_a';
SELECT TOP 5 * FROM dbo.Certificado_Medico;
REVERT; 
GO
```
--------------------------------------------------------------------------------
![Acceso a Datos Sensibles a través del Rol](../../script/Tema04_ManejoDePermisos/Imagenes/acceso-datos-sensibles.png)

 Descripción: Captura de pantalla que muestra la ejecución exitosa de la consulta SELECT por parte del Usuario_a, confirmando que los permisos se heredan correctamente a través del Rol_Lector.

--------------------------------------------------------------------------------

```sql
-- PRUEBA B: SELECT CON USUARIO_b (NO MIEMBRO DEL ROL) - DEBE FALLAR
EXECUTE AS USER = 'Usuario_b';
SELECT TOP 5 * FROM dbo.Certificado_Medico;
REVERT;
GO
```
![Fallo Acceso Restringido](../../script/Tema04_ManejoDePermisos/Imagenes/fallo-acceso-restringido.png)

Descripción: Captura de pantalla del mensaje de error de SQL Server, verificando que Usuario_b no puede acceder a la tabla Certificado_Medico por carecer del permiso SELECT, ya que no es miembro del rol. Esto demuestra la correcta aplicación de las restricciones de acceso por rol.

--------------------------------------------------------------------------------

### CONCLUSIONES
Al finalizar la implementación del Tema 4: Manejo de permisos a nivel de usuarios de base de datos, mi principal conclusión es que la seguridad va mucho más allá de la sintaxis y se convierte en un pilar fundamental del diseño.
Sobre el Mínimo Privilegio y el Encapsulamiento (FASE 2):
La parte más reveladora fue aplicar el Principio de Mínimo Privilegio. Descubrí que no es suficiente solo crear usuarios; lo importante es limitar sus capacidades.

1. La Jerarquía de Identidades: Entender que la seguridad se divide en dos niveles fue clave: el Login se encarga de la autenticación a nivel del servidor, mientras que el Usuario de Base de Datos se encarga de la autorización sobre los objetos internos.
2. El Poder del EXECUTE: El caso práctico con la tabla Cliente demostró la eficiencia de la Seguridad por Encapsulamiento. Al usuario solo se le otorgó el permiso SELECT (mínimo privilegio), y comprobamos que falló al intentar un INSERT directo. Sin embargo, al darle GRANT EXECUTE sobre el procedimiento almacenado, la operación de escritura funcionó. Esto prueba que puedo aislar la lógica de negocio y proteger la tabla base, lo cual es esencial en un sistema real.
Sobre la Gestión a través de Roles (FASE 3):
La implementación de roles me enseñó la importancia de la administración de grupos para la escalabilidad.
1. Eficiencia en la Administración: Al crear un rol (Rol_Lector) y asignarle permisos sobre la tabla sensible (Certificado_Medico), y luego simplemente agregar un usuario a ese rol, me quedó claro que gestionar 50 usuarios a través de roles es infinitamente más eficiente que asignar permisos individuales.
2. Validación de Restricciones: El ejercicio fue exitoso al comprobar que el Usuario_a, por ser miembro del rol, pudo acceder a la tabla, mientras que el Usuario_b recibió un mensaje de "Permiso Denegado", validando que las restricciones de acceso por rol están funcionando correctamente.

En resumen, la implementación me demostró que el éxito de un sistema no solo depende de la funcionalidad de sus tablas y procedimientos, sino de la precisión en la configuración de permisos y roles. El conocimiento de cómo funciona el Lenguaje de Control de Datos (GRANT, REVOKE, y la supremacía de DENY) se convierte en la herramienta fundamental para diseñar una arquitectura de seguridad robusta y predecible.
