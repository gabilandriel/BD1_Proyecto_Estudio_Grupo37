# Tema 1 – Procedimientos y Funciones Almacenadas  
### Caso de Estudio: Sistema de Gestión para Veterinaria (Tabla: Mascota)

## Resumen Ejecutivo

Este documento presenta el desarrollo, implementación y análisis del uso de **procedimientos almacenados (SP)** y **funciones definidas por el usuario (UDF)** en una base de datos diseñada para un **sistema de gestión veterinario**.  
El trabajo se centra en la tabla **`Mascota`**, una de las entidades más relevantes del modelo, y muestra cómo los SP y UDF permiten:

- Encapsular reglas de negocio
- Reducir duplicación de código
- Garantizar la integridad de los datos
- Mejorar la mantenibilidad del sistema  
- Comparar el rendimiento entre instrucciones directas y SP

Los scripts utilizados en este informe se encuentran en la carpeta correspondiente del repositorio.

---

## 1. Introducción

En los sistemas de información modernos, especialmente aquellos que gestionan datos operativos como turnos, clientes, mascotas y facturación, es fundamental garantizar la integridad, consistencia y eficiencia en el manejo de datos.  
Dentro del motor SQL Server, los **procedimientos almacenados** y las **funciones definidas por el usuario** son herramientas clave para centralizar la lógica de negocio y evitar errores comunes asociados al acceso directo a las tablas.

En este trabajo se desarrolla una solución práctica aplicada al caso de una **veterinaria**, utilizando la tabla `Mascota` como eje del análisis.  
Siguiendo los lineamientos solicitados por la cátedra, el informe abarca:

- La creación de tres procedimientos almacenados para: insertar, modificar y marcar una mascota como inactiva (baja lógica).  
- La creación de tres funciones para cálculos y consultas derivadas.  
- La carga de datos mediante sentencias directas y mediante SP.  
- La comparación conceptual y práctica del rendimiento entre ambos enfoques.

El objetivo final es demostrar cómo los SP y las UDF mejoran la organización, robustez y seguridad del sistema, además de facilitar la evolución futura de la base de datos.

---
## 2. Marco Teórico

En SQL Server, los **procedimientos almacenados** y las **funciones almacenadas** son herramientas fundamentales para encapsular lógica, asegurar integridad y mejorar la eficiencia del sistema. Su correcta utilización permite centralizar reglas de negocio y evitar la repetición de código en la aplicación, lo cual es especialmente importante en sistemas con múltiples módulos como el de una veterinaria (turnos, certificados médicos, mascotas, clientes, facturación, etc.).

### 2.1. Procedimientos Almacenados

Un procedimiento almacenado es un conjunto de instrucciones SQL guardado en el servidor.  
Permite:

- Recibir parámetros.
- Ejecutar operaciones CRUD.
- Validar datos antes de insertarlos.
- Manejar transacciones.
- Devolver valores o códigos de estado.

**Ventajas principales**

- Menor tráfico entre cliente y servidor.
- Mayor seguridad (no se exponen las tablas).
- Evita inyección SQL por uso de parámetros.
- Reutiliza el plan de ejecución.
- Centraliza reglas de negocio.

### 2.2. Funciones Almacenadas

Una función almacenada devuelve siempre un valor (escalar o una tabla).  
Se utiliza dentro de consultas (`SELECT`, `WHERE`, etc.) y es ideal para:

- Cálculos repetitivos (como edad).
- Conteos.
- Formateos o combinaciones de texto.

A diferencia de los procedimientos:

- No pueden modificar datos.
- No manejan transacciones.
- No pueden llamar a procedimientos almacenados.

### 2.3. Relación y uso en este proyecto

Los procedimientos se utilizarán para realizar operaciones **CRUD** sobre la tabla `Mascota`, aplicando validaciones previas para asegurar la integridad del sistema.  
Las funciones se utilizarán para cálculos complementarios, como la edad de la mascota o el total de mascotas de un cliente.

En un sistema veterinario real, estos objetos permiten mantener coherencia, simplificar el mantenimiento y asegurar que las reglas de negocio se cumplan de forma uniforme en toda la aplicación.

## 3. Modelo de Datos Relevante

Para el desarrollo de este tema se utiliza la tabla **Mascota**, una de las entidades principales del sistema de gestión veterinario.  
Esta tabla registra información esencial sobre las mascotas atendidas y se relaciona directamente con **Cliente** y **Raza**, y de forma indirecta con **Especie**.

---

### 3.1. Estructura de la Tabla *Mascota*

La tabla está definida de la siguiente manera:

```sql
CREATE TABLE Mascota
(
  id_mascota       INT IDENTITY(1,1) PRIMARY KEY,
  nombre_mascota   NVARCHAR(120) NOT NULL,
  fecha_nac        DATE NOT NULL,
  sexo             NVARCHAR(20) NOT NULL CHECK (sexo IN ('Macho','Hembra')),
  id_raza          INT NOT NULL,
  id_cliente       INT NOT NULL,
  baja             BIT NOT NULL DEFAULT 0
);
```
### 3.2. Descripción de los Campos

- **id_mascota**: Identificador único de cada mascota.  
- **nombre_mascota**: Nombre registrado de la mascota.  
- **fecha_nac**: Fecha de nacimiento.  
- **sexo**: Valor restringido a *Macho* o *Hembra* mediante un `CHECK`.  
- **id_raza**: Clave foránea hacia la tabla **Raza**.  
- **id_cliente**: Clave foránea hacia la tabla **Cliente**.  
- **baja**: Campo de baja lógica (0 = activa, 1 = inactiva).

---

### 3.3. Relaciones Principales

La tabla *Mascota* se encuentra vinculada con:

#### ✔ Cliente (1:N)
Un cliente puede tener varias mascotas registradas.

#### ✔ Raza (1:N)
Una raza puede estar asociada a muchas mascotas.

#### ✔ Especie (1:N Razas)
Cada raza pertenece a una especie, generando una relación indirecta entre Mascota y Especie.


---

### 3.4. Justificación de la Tabla Seleccionada

La tabla **Mascota** es adecuada para este trabajo porque:

- Es una entidad **central** dentro del sistema veterinario.  
- Presenta múltiples **relaciones** con otras tablas.  
- Requiere validaciones importantes (fechas, sexo, existencia de cliente y raza).  
- Permite demostrar de forma clara la implementación de **procedimientos almacenados (CRUD)**.  
- Facilita la creación de funciones útiles como:  
  - cálculo de edad,  
  - conteo de mascotas por cliente,  
  - concatenación de datos descriptivos.

**Por estas razones, Mascota fue seleccionada como la tabla principal para el desarrollo de los procedimientos y funciones almacenadas de este trabajo.**

