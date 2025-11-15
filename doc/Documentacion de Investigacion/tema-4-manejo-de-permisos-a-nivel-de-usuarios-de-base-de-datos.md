# TEMA 4: MANEJO DE PERMISOS A NIVEL DE USUARIOS DE BASE DE DATOS

## I. Introducción Teórica: La Autorización en el DBMS

La **autorización** en SQL es el proceso de controlar qué identidades tienen permiso para realizar acciones sobre los objetos dentro de la base de datos [1, 2]. Esto se gestiona a nivel de **usuario** y **rol** de base de datos [3, 4].

A diferencia de la autenticación (que verifica la identidad del usuario), la autorización define el alcance de las acciones permitidas (ej., leer datos sensibles, modificar la estructura de una tabla, ejecutar lógica de negocio) [2, 5]. Este sistema es crucial para la seguridad, garantizando que solo los datos válidos y coherentes puedan ser manipulados [6].

### 1. Principales de Seguridad (Security Principals)

En la gestión de permisos a nivel de base de datos, los permisos se asignan a las siguientes entidades, conocidas como *principales de seguridad*:

1.  **Usuarios de Base de Datos:** Son las identidades individuales con acceso a la base de datos [4].
2.  **Roles:** Un **rol** es una colección lógica de privilegios que simplifica la administración, ya que permite otorgar o revocar permisos a un grupo en lugar de a usuarios individuales [7, 8]. Se utiliza la sentencia `CREATE ROLE` para definir nuevos roles de base de datos [9].

### 2. Principio de Mínimo Privilegio (PoLP)

La mejor práctica de seguridad, y la que guía este estudio, es el **Principio de Mínimo Privilegio** [5]. Este principio dictamina que se debe otorgar a un usuario o rol solo los permisos estrictamente necesarios para que pueda realizar su tarea y nada más [5, 10].

Los permisos se gestionan a través de comandos del Lenguaje de Control de Datos (DCL) [2]:

*   **`GRANT`**: Otorga permisos a un usuario o rol (ej., `GRANT SELECT ON Tabla TO Usuario`) [2, 11].
*   **`REVOKE`**: Retira permisos previamente otorgados [12, 13].
*   **`DENY`**: Prohíbe explícitamente un permiso. Una denegación siempre tiene prioridad sobre una concesión explícita [13, 14].

### 3. Seguridad por Encapsulamiento: El Rol del Procedimiento Almacenado

Un aspecto fundamental que se explora en el Tema 4 es cómo los **Procedimientos Almacenados** (P.A.) refuerzan la seguridad.

Los P.A. son bloques de código SQL almacenados en el DBMS que encapsulan lógica de negocio [15, 16]. Una de sus ventajas cruciales es la **seguridad** [16]. En lugar de otorgar a un usuario permisos directos de manipulación de datos (`INSERT`, `UPDATE`, `DELETE`) sobre una tabla, se le otorga únicamente el permiso de **`EXECUTE`** sobre el procedimiento almacenado [16, 17].

Esto permite al usuario ejecutar la lógica de negocio (ej., insertar un cliente) sin tener acceso directo a la tabla `Cliente`, demostrando un aislamiento efectivo entre el usuario y los datos subyacentes, lo cual es la base de la prueba práctica en este tema.

---
