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

---
## 4. Procedimientos Almacenados (CRUD)

En esta sección se presentan los procedimientos almacenados implementados para gestionar registros de la tabla **Mascota**.  
Cada procedimiento incluye validaciones necesarias para garantizar la integridad de los datos, como la verificación de la existencia de un cliente activo, existencia de raza válida y restricciones de fecha de nacimiento.

Se implementaron tres procedimientos:

- `usp_InsertarMascota` → Inserta una nueva mascota (con validaciones).  
- `usp_ModificarMascota` → Actualiza datos existentes de una mascota activa.  
- `usp_BajaLogicaMascota` → Marca una mascota como inactiva mediante baja lógica.  

A continuación se detallan cada uno de ellos.


### 4.1. Procedimiento: `usp_InsertarMascota`

**Propósito:**  
Inserta una nueva mascota en el sistema veterinario, asegurando que los datos cumplan con las reglas de validación establecidas.

**Parámetros de entrada:**

- `@nombre_mascota`  
- `@fecha_nac`  
- `@sexo`  
- `@id_raza`  
- `@id_cliente`

**Validaciones implementadas:**

- El nombre no puede ser nulo ni vacío.  
- La fecha de nacimiento no puede ser futura.  
- Debe existir una raza válida en la tabla `Raza`.  
- El cliente debe existir y no estar dado de baja (`baja = 0`).  

**Código SQL:**

```sql
CREATE OR ALTER PROCEDURE usp_InsertarMascota
    @nombre_mascota   NVARCHAR(120),
    @fecha_nac        DATE,
    @sexo             NVARCHAR(20),
    @id_raza          INT,
    @id_cliente       INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validación de nombre
    IF (@nombre_mascota IS NULL OR LTRIM(RTRIM(@nombre_mascota)) = '')
    BEGIN
        RAISERROR('El nombre de la mascota es obligatorio.', 16, 1);
        RETURN;
    END;

    -- Validación de fecha
    IF (@fecha_nac IS NULL)
    BEGIN
        RAISERROR('La fecha de nacimiento es obligatoria.', 16, 1);
        RETURN;
    END;

    IF (@fecha_nac > CAST(GETDATE() AS DATE))
    BEGIN
        RAISERROR('La fecha de nacimiento no puede ser futura.', 16, 1);
        RETURN;
    END;

    -- Validación de raza
    IF NOT EXISTS (SELECT 1 FROM Raza WHERE id_raza = @id_raza)
    BEGIN
        RAISERROR('La raza indicada no existe.', 16, 1);
        RETURN;
    END;

    -- Validación de cliente
    IF NOT EXISTS (SELECT 1 FROM Cliente WHERE id_cliente = @id_cliente AND baja = 0)
    BEGIN
        RAISERROR('El cliente indicado no existe o está dado de baja.', 16, 1);
        RETURN;
    END;

    -- Inserción
    INSERT INTO Mascota (nombre_mascota, fecha_nac, sexo, id_raza, id_cliente, baja)
    VALUES (@nombre_mascota, @fecha_nac, @sexo, @id_raza, @id_cliente, 0);

    SELECT SCOPE_IDENTITY() AS id_mascota_creada;
END;
GO
```
**Ejemplo de ejecución:**

```sql
EXEC usp_InsertarMascota
     @nombre_mascota = 'Firulais',
     @fecha_nac      = '2020-05-10',
     @sexo           = 'Macho',
     @id_raza        = 1,
     @id_cliente     = 3;
```
**Resultado esperado:**


<img width="483" height="215" alt="image" src="https://github.com/user-attachments/assets/aa0b8905-112e-40d7-8392-f6b8d7e09c96" />

### 4.2. Procedimiento: `usp_ModificarMascota`

**Propósito:**  
Actualiza los datos de una mascota activa, aplicando las mismas validaciones que en el alta.

**Código SQL:**
```sql
CREATE OR ALTER PROCEDURE usp_ModificarMascota
    @id_mascota      INT,
    @nombre_mascota  NVARCHAR(120),
    @fecha_nac       DATE,
    @sexo            NVARCHAR(20),
    @id_raza         INT,
    @id_cliente      INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar existencia y estado
    IF NOT EXISTS (SELECT 1 FROM Mascota WHERE id_mascota = @id_mascota AND baja = 0)
    BEGIN
        RAISERROR('La mascota indicada no existe o está dada de baja.', 16, 1);
        RETURN;
    END;

    -- Validación de nombre
    IF (@nombre_mascota IS NULL OR LTRIM(RTRIM(@nombre_mascota)) = '')
    BEGIN
        RAISERROR('El nombre de la mascota es obligatorio.', 16, 1);
        RETURN;
    END;

    -- Validación de fecha
    IF (@fecha_nac > CAST(GETDATE() AS DATE))
    BEGIN
        RAISERROR('La fecha de nacimiento no puede ser futura.', 16, 1);
        RETURN;
    END;

    -- Validación FK Raza
    IF NOT EXISTS (SELECT 1 FROM Raza WHERE id_raza = @id_raza)
    BEGIN
        RAISERROR('La raza indicada no existe.', 16, 1);
        RETURN;
    END;

    -- Validación FK Cliente
    IF NOT EXISTS (SELECT 1 FROM Cliente WHERE id_cliente = @id_cliente AND baja = 0)
    BEGIN
        RAISERROR('El cliente indicado no existe o está dado de baja.', 16, 1);
        RETURN;
    END;

    -- Actualización
    UPDATE Mascota
    SET nombre_mascota = @nombre_mascota,
        fecha_nac      = @fecha_nac,
        sexo           = @sexo,
        id_raza        = @id_raza,
        id_cliente     = @id_cliente
    WHERE id_mascota = @id_mascota;
END;
```
**Ejemplo de ejecución:**
```sql
GO
EXEC usp_ModificarMascota
     @id_mascota     = 51,
     @nombre_mascota = 'Firulais Editado',
     @fecha_nac      = '2020-05-10',
     @sexo           = 'Macho',
     @id_raza        = 1,
     @id_cliente     = 3;
```
**Resultado esperado:**


![Imagen de WhatsApp 2025-11-16 a las 12 41 05_c69e03c2](https://github.com/user-attachments/assets/a6bcb241-e9fc-47fd-9567-aa30770096d0)

### 4.2. Procedimiento: `usp_BajaLogicaMascota`

**Propósito:**  
Marca una mascota como inactiva (baja = 1) sin eliminarla físicamente de la base de datos.

**Código SQL:**
```sql
CREATE OR ALTER PROCEDURE usp_BajaLogicaMascota
    @id_mascota INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar existencia
    IF NOT EXISTS (SELECT 1 FROM Mascota WHERE id_mascota = @id_mascota)
    BEGIN
        RAISERROR('La mascota indicada no existe.', 16, 1);
        RETURN;
    END;

    -- Validar que no esté ya dada de baja
    IF EXISTS (SELECT 1 FROM Mascota WHERE id_mascota = @id_mascota AND baja = 1)
    BEGIN
        RAISERROR('La mascota ya se encuentra dada de baja.', 16, 1);
        RETURN;
    END;

    -- Marcar como inactiva
    UPDATE Mascota
    SET baja = 1
    WHERE id_mascota = @id_mascota;
END;
GO
```

**Ejemplo de ejecución:**

```sql
EXEC usp_BajaLogicaMascota @id_mascota = 51;
```
**Resultado esperado:**


![Imagen de WhatsApp 2025-11-16 a las 12 51 27_425e62c5](https://github.com/user-attachments/assets/7a691d67-f18f-4733-bd2e-aba3619535d1)


### Funciones Almacenadas
**En esta sección se presentan tres funciones creadas para complementar las operaciones sobre la tabla Mascota.**  

### 5.1. Función: fn_CalcularEdadMascota
**Devuelve la edad de una mascota en años completos, calculada a partir de su fecha de nacimiento.**

**Código SQL:**
```sql
CREATE OR ALTER FUNCTION fn_CalcularEdadMascota
(
    @fecha_nac DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @edad INT;

    SET @edad = DATEDIFF(YEAR, @fecha_nac, GETDATE());

    IF (DATEADD(YEAR, @edad, @fecha_nac) > GETDATE())
        SET @edad = @edad - 1;

    RETURN @edad;
END;
GO
```
**Ejemplo de uso:**
```sql
SELECT dbo.fn_CalcularEdadMascota('2020-05-10') AS Edad;
```


![Imagen de WhatsApp 2025-11-16 a las 13 46 49_985c8c38](https://github.com/user-attachments/assets/069360da-eb18-482d-804a-e9cc744e3d39)


### 5.2. Función: fn_ContarMascotasPorCliente
**Retorna la cantidad de mascotas activas asociadas a un cliente específico.**

**Código SQL:**
```sql
CREATE OR ALTER FUNCTION fn_ContarMascotasPorCliente
(
    @id_cliente INT
)
RETURNS INT
AS
BEGIN
    DECLARE @total INT;

    SELECT @total = COUNT(*)
    FROM Mascota
    WHERE id_cliente = @id_cliente
      AND baja = 0;

    RETURN @total;
END;
GO
```
**Ejemplo de uso:**
```sql
SELECT dbo.fn_ContarMascotasPorCliente(1) AS Mascotas_Cliente_1;
```
![Imagen de WhatsApp 2025-11-16 a las 13 48 51_cd6c974e](https://github.com/user-attachments/assets/98ae812e-1f7e-402d-9cb0-a5ac34e3d555)


### 5.3. Función: fn_MascotaDescripcion
**Genera una descripción legible combinando nombre, sexo y raza de la mascota.**

**Código SQL:**
```sql
CREATE OR ALTER FUNCTION fn_MascotaDescripcion
(
    @id_mascota INT
)
RETURNS NVARCHAR(400)
AS
BEGIN
    DECLARE @descripcion NVARCHAR(400);

    SELECT @descripcion =
        m.nombre_mascota + ' - ' + m.sexo +
        ' (Raza: ' + r.nombre_raza + ')'
    FROM Mascota m
    JOIN Raza r ON r.id_raza = m.id_raza
    WHERE m.id_mascota = @id_mascota;

    RETURN @descripcion;
END;
GO
```
**Ejemplo de uso:**
```sql
SELECT dbo.fn_MascotaDescripcion(51) AS Descripcion;
```
![Imagen de WhatsApp 2025-11-16 a las 13 51 25_b951893d](https://github.com/user-attachments/assets/61b14aa6-cc7f-43e2-b5c3-df93bcb1ccdc)





