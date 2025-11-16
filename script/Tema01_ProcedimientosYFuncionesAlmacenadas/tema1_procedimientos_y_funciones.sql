-- ==========================================================
-- TEMA 1 : PROCEDIMIENTOS Y FUNCIONES ALMACENADAS
-- Proyecto: Sistema de Gestión para Veterinaria
-- Tabla foco: Mascota
-- Descripción:
--   Este script crea los procedimientos almacenados y
--   funciones necesarias para el Tema 1 del proyecto.
-- ==========================================================

USE DB_Integrador_Grupo37;
GO

-- 1) Asegurar columna de baja lógica en Mascota
IF COL_LENGTH('Mascota', 'baja') IS NULL
BEGIN
    ALTER TABLE Mascota
    ADD baja BIT NOT NULL DEFAULT 0;
END;
GO

-- ==========================================================
-- 2) Procedimiento: usp_InsertarMascota
--    Inserta una nueva mascota con validaciones básicas.

CREATE OR ALTER PROCEDURE usp_InsertarMascota
    @nombre_mascota   NVARCHAR(120),
    @fecha_nac        DATE,
    @sexo             NVARCHAR(20),
    @id_raza          INT,
    @id_cliente       INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validación de nombre (no nulo, no vacío)
    IF (@nombre_mascota IS NULL OR LTRIM(RTRIM(@nombre_mascota)) = '')
    BEGIN
        RAISERROR('El nombre de la mascota es obligatorio.', 16, 1);
        RETURN;
    END;

    -- Validación de fecha (obligatoria y no futura)
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

    -- Validación de raza existente
    IF NOT EXISTS (SELECT 1 FROM Raza WHERE id_raza = @id_raza)
    BEGIN
        RAISERROR('La raza indicada no existe.', 16, 1);
        RETURN;
    END;

    -- Validación de cliente existente y activo
    IF NOT EXISTS (SELECT 1 FROM Cliente WHERE id_cliente = @id_cliente AND baja = 0)
    BEGIN
        RAISERROR('El cliente indicado no existe o está dado de baja.', 16, 1);
        RETURN;
    END;

    -- Inserción final
    INSERT INTO Mascota (nombre_mascota, fecha_nac, sexo, id_raza, id_cliente, baja)
    VALUES (@nombre_mascota, @fecha_nac, @sexo, @id_raza, @id_cliente, 0);

    -- Devolver el ID creado (útil para pruebas)
    SELECT SCOPE_IDENTITY() AS id_mascota_creada;
END;
GO


-- ========================================================
-- Demostración: usp_InsertarMascota

EXEC usp_InsertarMascota
     @nombre_mascota = 'Firulais',
     @fecha_nac      = '2020-05-10',
     @sexo           = 'Macho',
     @id_raza        = 1,
     @id_cliente     = 1;

SELECT TOP 5 * FROM Mascota ORDER BY id_mascota DESC;

GO

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Procedimiento: usp_ModificarMascota
-- Actualiza los datos de una mascota activa.

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

    -- Validar existencia de la mascota y que esté activa
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

    -- Actualización
    UPDATE Mascota
    SET nombre_mascota = @nombre_mascota,
        fecha_nac      = @fecha_nac,
        sexo           = @sexo,
        id_raza        = @id_raza,
        id_cliente     = @id_cliente
    WHERE id_mascota = @id_mascota;
END;
GO

-- ========================================================
-- Demostración de modificación :
EXEC usp_ModificarMascota
     @id_mascota     = 51,-- id de la mascota insertada anteriormente
     @nombre_mascota = 'Firulais Editado',
     @fecha_nac      = '2020-05-10',
     @sexo           = 'Macho',
     @id_raza        = 1,
     @id_cliente     = 3;

SELECT * FROM Mascota WHERE id_mascota = 51;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
GO
-- ==========================================================
-- Procedimiento: usp_BajaLogicaMascota
-- Marca una mascota como inactiva (baja lógica).
-- ==========================================================
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

    -- Baja lógica
    UPDATE Mascota
    SET baja = 1
    WHERE id_mascota = @id_mascota;
END;
GO



-- Antes de la baja
SELECT id_mascota, nombre_mascota, baja
FROM Mascota
WHERE id_mascota = 51;

-- Ejecutar baja lógica
EXEC usp_BajaLogicaMascota @id_mascota = 51;

-- Después de la baja
SELECT id_mascota, nombre_mascota, baja
FROM Mascota
WHERE id_mascota = 51;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- TAREA 2: Lote de datos con INSERT directo (sin procedimientos)


INSERT INTO Mascota (nombre_mascota, fecha_nac, sexo, id_raza, id_cliente, baja)
VALUES
    ('Luna',      '2021-03-15', 'Hembra',  1,  1, 0),
    ('Rocky',     '2019-11-02', 'Macho',   1,  2, 0),
    ('Milo',      '2020-07-20', 'Macho',   2,  3, 0),
    ('Kira',      '2018-01-10', 'Hembra',  2,  4, 0),
    ('Toby',      '2017-09-05', 'Macho',   3,  5, 0),
    ('Nina',      '2022-01-12', 'Hembra',  1,  2, 0),
    ('Bruno',     '2020-09-30', 'Macho',   2,  3, 0),
    ('Coco',      '2016-06-18', 'Macho',   3,  4, 0),
    ('Olivia',    '2019-04-25', 'Hembra',  1,  5, 0),
    ('Max',       '2018-12-31', 'Macho',   2,  1, 0);

-- Verificamos inserciones directas:
SELECT TOP 15 *
FROM Mascota
ORDER BY id_mascota DESC;
GO

-------------------------------------------------------------------------------
--  Lote de datos usando el procedimiento usp_InsertarMascota
-------------------------------------------------------------------------------

EXEC usp_InsertarMascota
     @nombre_mascota = 'Simba',
     @fecha_nac      = '2022-02-14',
     @sexo           = 'Macho',
     @id_raza        = 1,
     @id_cliente     = 2;

EXEC usp_InsertarMascota
     @nombre_mascota = 'Nala',
     @fecha_nac      = '2021-06-30',
     @sexo           = 'Hembra',
     @id_raza        = 2,
     @id_cliente     = 3;

EXEC usp_InsertarMascota
     @nombre_mascota = 'Chloe',
     @fecha_nac      = '2019-12-01',
     @sexo           = 'Hembra',
     @id_raza        = 3,
     @id_cliente     = 4;

EXEC usp_InsertarMascota
     @nombre_mascota = 'Tom',
     @fecha_nac      = '2020-03-22',
     @sexo           = 'Macho',
     @id_raza        = 1,
     @id_cliente     = 1;

EXEC usp_InsertarMascota
     @nombre_mascota = 'Jerry',
     @fecha_nac      = '2020-03-22',
     @sexo           = 'Macho',
     @id_raza        = 1,
     @id_cliente     = 2;

EXEC usp_InsertarMascota
     @nombre_mascota = 'Lola',
     @fecha_nac      = '2017-08-08',
     @sexo           = 'Hembra',
     @id_raza        = 2,
     @id_cliente     = 3;

EXEC usp_InsertarMascota
     @nombre_mascota = 'Bobby',
     @fecha_nac      = '2016-05-05',
     @sexo           = 'Macho',
     @id_raza        = 3,
     @id_cliente     = 4;

EXEC usp_InsertarMascota
     @nombre_mascota = 'Mora',
     @fecha_nac      = '2021-11-11',
     @sexo           = 'Hembra',
     @id_raza        = 2,
     @id_cliente     = 1;

-- Verificar inserciones realizadas vía SP
SELECT TOP 20 *
FROM Mascota
ORDER BY id_mascota DESC;
GO

-------------------------------------------------------------------------------
-- TAREA 3-A: UPDATE usando usp_ModificarMascota
-------------------------------------------------------------------------------

-- Antes de la modificación:
SELECT id_mascota, nombre_mascota, fecha_nac, sexo, id_raza, id_cliente, baja
FROM Mascota
WHERE id_mascota = 52;   

-- Ejecutar UPDATE
EXEC usp_ModificarMascota
     @id_mascota     = 52,
     @nombre_mascota = 'Nombre Editado',
     @fecha_nac      = '2020-01-01',
     @sexo           = 'Macho',
     @id_raza        = 1,
     @id_cliente     = 1;

-- Después de la modificación:
SELECT id_mascota, nombre_mascota, fecha_nac, sexo, id_raza, id_cliente, baja
FROM Mascota
WHERE id_mascota = 52;
GO

-------------------------------------------------------------------------------
-- Tarea 3-B: DELETE (baja lógica) usando usp_BajaLogicaMascota
-------------------------------------------------------------------------------

-- Antes de la baja lógica:
SELECT id_mascota, nombre_mascota, baja
FROM Mascota
WHERE id_mascota = 52;

-- Ejecutar baja lógica:
EXEC usp_BajaLogicaMascota @id_mascota = 52;

-- Después de la baja lógica:
SELECT id_mascota, nombre_mascota, baja
FROM Mascota
WHERE id_mascota = 52;
GO


-------------------------------------------------------------------------------
-- TAREA 4: Desarrollar al menos 3 funciones almacenadas.

-- FUNCIÓN 1: fn_CalcularEdadMascota
-- Devuelve la edad de una mascota en años enteros.
-------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION fn_CalcularEdadMascota
(
    @fecha_nac DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @edad INT;

    SET @edad = DATEDIFF(YEAR, @fecha_nac, GETDATE());

    -- Ajuste si aún no cumplió este año
    IF (DATEADD(YEAR, @edad, @fecha_nac) > GETDATE())
        SET @edad = @edad - 1;

    RETURN @edad;
END;
GO
-- verificacion:
SELECT dbo.fn_CalcularEdadMascota('2020-05-10') AS Edad;

-------------------------------------------------------------------------------
-- FUNCIÓN 2: fn_ContarMascotasPorCliente
-- Devuelve cuántas mascotas activas tiene un cliente.
-------------------------------------------------------------------------------
GO
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

--Verificación:
SELECT dbo.fn_ContarMascotasPorCliente(1) AS Mascotas_Cliente_1;

-------------------------------------------------------------------------------
-- FUNCIÓN 3: fn_MascotaDescripcion
-- Devuelve un texto descriptivo: "Firulais - Macho (Raza: Labrador)"
-------------------------------------------------------------------------------
GO
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

-- Verificación:
SELECT dbo.fn_MascotaDescripcion(51) AS Descripcion;


-------------------------------------------------------------------------------
-- TAREA 5: Comparativa de rendimiento
-- Uso de SET STATISTICS IO y TIME para comparar INSERT Directo vs vía SP
-------------------------------------------------------------------------------

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

PRINT '--- INSERT DIRECTO ---';

INSERT INTO Mascota (nombre_mascota, fecha_nac, sexo, id_raza, id_cliente, baja)
VALUES ('PruebaDirecta1', '2021-01-01', 'Macho', 1, 1, 0);

INSERT INTO Mascota (nombre_mascota, fecha_nac, sexo, id_raza, id_cliente, baja)
VALUES ('PruebaDirecta2', '2021-01-01', 'Hembra', 1, 1, 0);

PRINT '--- INSERT VIA SP ---';

EXEC usp_InsertarMascota
    @nombre_mascota = 'PruebaSP1',
    @fecha_nac      = '2020-10-10',
    @sexo           = 'Macho',
    @id_raza        = 1,
    @id_cliente     = 1;

EXEC usp_InsertarMascota
    @nombre_mascota = 'PruebaSP2',
    @fecha_nac      = '2020-10-10',
    @sexo           = 'Hembra',
    @id_raza        = 1,
    @id_cliente     = 1;

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;

