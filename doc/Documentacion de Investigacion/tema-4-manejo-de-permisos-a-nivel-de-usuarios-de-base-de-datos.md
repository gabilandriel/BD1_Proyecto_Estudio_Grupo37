# TEMA 4: MANEJO DE PERMISOS A NIVEL DE USUARIOS DE BASE DE DATOS

**Este tema forma parte del Proyecto de Estudio e Investigación y tiene como objetivo analizar y aplicar los mecanismos de autorización en el Sistema de Gestión de Bases de Datos (DBMS), específicamente en SQL Server, garantizando la seguridad de acceso a la base de datos desarrollada para la clínica veterinaria.**

## I. Introducción Teórica: La Autorización en el DBMS

La **autorización** en SQL es el proceso de controlar qué identidades tienen permiso para realizar acciones sobre los objetos dentro de la base de datos. Esto se gestiona a nivel de **usuario** y **rol** de base de datos.

A diferencia de la autenticación (que verifica la identidad del usuario), la autorización define el alcance de las acciones permitidas (ej., leer datos sensibles, modificar la estructura de una tabla, ejecutar lógica de negocio). Este sistema es crucial para la seguridad, garantizando que solo los datos válidos y coherentes puedan ser manipulados.

### 1. Principales de Seguridad (Security Principals)

En la gestión de permisos a nivel de base de datos, los permisos se asignan a las siguientes entidades, conocidas como *principales de seguridad*:

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

**En las siguientes etapas se implementarán estos conceptos en un entorno real de SQL Server, mediante la creación de usuarios y roles utilizando sentencias `GRANT`, `REVOKE` y `CREATE ROLE`, y la aplicación de permisos sobre las tablas del esquema de la clínica veterinaria (como `Cliente`, `Mascota` o `Certificado_Medico`), con el fin de verificar el comportamiento de cada caso y validar el Principio de Mínimo Privilegio.**
---
