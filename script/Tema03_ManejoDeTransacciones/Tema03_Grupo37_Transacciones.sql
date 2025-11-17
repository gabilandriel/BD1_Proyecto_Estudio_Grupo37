USE DB_Integrador_Grupo37;
GO

---------------------------------------------------------------
-- Conteo de cantidad de certificados y stock antes de la
-- implementación de las transacciones 
---------------------------------------------------------------
SELECT COUNT(*) AS CantCertificados_ANTES 
FROM Certificado_Medico;

SELECT stock AS Stock_ANTES 
FROM Medicamento 
WHERE id_medicamento = 1;


---------------------------------------------------------------
-- Transacción exitosa, se inserta un certificado, un 
-- medicamento aplicado y actualiza el stock del medicamento.
---------------------------------------------------------------

-- Declaración de variables 
DECLARE @id_turno INT = 55;
DECLARE @id_usuario INT = 2;
DECLARE @id_medicamento INT = 1;


DECLARE @dosis NVARCHAR(120) = '1 comprimido cada 12 hs';
DECLARE @cantidadAplicada INT = 1;  -- Descontar 1 del stock
DECLARE @subtotal DECIMAL(12,2) = 500.00;


-- Comienzo de la transacción, usando try para manejar errores
BEGIN TRY
    BEGIN TRANSACTION;

    ---------------------------------------------------------
    -- 1) Se realiza el insert del certificado medico
    ---------------------------------------------------------
    INSERT INTO Certificado_Medico 
        (fecha_emision, observacion, diagnostico, id_turno, id_usuario)
    VALUES 
        (GETDATE(), 'Observación transacción OK', 'Diagnóstico OK', 
         @id_turno, @id_usuario);

    DECLARE @idCertificadoNuevo INT = SCOPE_IDENTITY();

    ---------------------------------------------------------
    -- 2) Se realiza el insert de la tabla intermedia, donde
    -- se registra la dosis que se aplica en el certificado
    ---------------------------------------------------------
    INSERT INTO Medicamento_certificado 
        (id_medicamento, id_certificado_medico, dosis, subtotal)
    VALUES 
        (@id_medicamento, @idCertificadoNuevo, @dosis, @subtotal);

    ---------------------------------------------------------
    -- 3) Se realiza un update del stock del medicamento
    ---------------------------------------------------------
    UPDATE Medicamento
    SET stock = stock - @cantidadAplicada
    WHERE id_medicamento = @id_medicamento;

    ---------------------------------------------------------
    -- 4) Commit final SI TODOS LOS PASOS ANTERIORES SE PUDIERON
    -- REALIZAR
    ---------------------------------------------------------
    COMMIT TRANSACTION;

    PRINT 'Transacción EXITOSA completada.';
    PRINT 'ID del certificado generado: ' + CAST(@idCertificadoNuevo AS NVARCHAR(20));
END TRY
    ---------------------------------------------------------
    -- 5) Si en alguno de las ejecuciones 1, 2 o 3 llegase a 
    -- fallar, se ejecuta un ROLLBACK, revirtiendo todos los
    -- procesos (ya que la transacción es molecular)
    ---------------------------------------------------------
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'ERROR en la transacción: ' + ERROR_MESSAGE();
END CATCH;

--------------------------------------------------------------------
-- Se seleccioa el último certificado insertado (MAX) para comprobar
-- que la transacción creó correctamente el registro asociado en la
-- tabla Medicamento_certificado.
---------------------------------------------------------------------

SELECT COUNT(*) AS CantCertificados_DESPUES 
FROM Certificado_Medico;

SELECT stock AS Stock_DESPUES 
FROM Medicamento 
WHERE id_medicamento = 1;

SELECT * FROM Medicamento_certificado 
WHERE id_certificado_medico = (SELECT MAX(id_certificado_medico) FROM Certificado_Medico);
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------
-- Transacción con error intencional,se provoca un stock 
-- negativo para forzar el ROLLBACK.
---------------------------------------------------------------

---------------------------------------------------------------
-- Estado antes de ejecutar la transacción con error
---------------------------------------------------------------
SELECT COUNT(*) AS CantCertificados_ANTES_ROLLBACK 
FROM Certificado_Medico;

SELECT COUNT(*) AS CantMedicamentoCertificado_ANTES_ROLLBACK
FROM Medicamento_certificado;

SELECT stock AS Stock_ANTES_ROLLBACK
FROM Medicamento 
WHERE id_medicamento = 1;


-- Declaración de variables 
DECLARE @id_turno INT = 55;            -- Turno válido sin certificado nuevo
DECLARE @id_usuario INT = 2;           -- Veterinario
DECLARE @id_medicamento INT = 1;       -- Amoxicilina (tiene stock positivo)

DECLARE @subtotal DECIMAL(12,2) = 500.00;

BEGIN TRY
    BEGIN TRANSACTION;

    ---------------------------------------------------------
    -- 1) Se realiza un insert de certificado médico 
    ---------------------------------------------------------
    INSERT INTO Certificado_Medico 
        (fecha_emision, observacion, diagnostico, id_turno, id_usuario)
    VALUES 
        (GETDATE(), 'Observación rollback', 'Diagnóstico rollback', 
         @id_turno, @id_usuario);

    DECLARE @idCertificadoRollback INT = SCOPE_IDENTITY();

    -----------------------------------------------------------------
    -- 2) Igualmente, se realiza un insert en Medicamento_certificado
    -----------------------------------------------------------------
    INSERT INTO Medicamento_certificado
        (id_medicamento, id_certificado_medico, dosis, subtotal)
    VALUES
        (@id_medicamento, @idCertificadoRollback, 'Prueba rollback', @subtotal);

    ---------------------------------------------------------
    -- 3) ERROR INTENCIONAL
    -- Intentar dejar el stock en negativo (rompe CHECK)
    ---------------------------------------------------------
    UPDATE Medicamento
    SET stock = stock - 999999  -- genera un stock negativo
    WHERE id_medicamento = @id_medicamento;

    ---------------------------------------------------------
    -- Si por alguna razón todo pasa (no debería, ya que este
    -- error generado es intencional), commit
    ---------------------------------------------------------
    COMMIT TRANSACTION;

    PRINT 'Esto NO debería aparecer nunca.';
END TRY

BEGIN CATCH
    ---------------------------------------------------------
    -- ROLLBACK debido al error generado
    ---------------------------------------------------------
    ROLLBACK TRANSACTION;

    PRINT 'ERROR detectado, ROLLBACK ejecutado correctamente.';
    PRINT ERROR_MESSAGE();
END CATCH;

---------------------------------------------------------------
-- Verificación del estado luego del rollback
---------------------------------------------------------------

SELECT COUNT(*) AS CantCertificados_DESPUES_ROLLBACK
FROM Certificado_Medico;

SELECT COUNT(*) AS CantMedicamentoCertificado_DESPUES_ROLLBACK
FROM Medicamento_certificado;

SELECT stock AS Stock_DESPUES_ROLLBACK
FROM Medicamento 
WHERE id_medicamento = 1;

SELECT MAX(id_certificado_medico) AS UltimoCertificado
FROM Certificado_Medico;


GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------
-- TRANSACCIÓN ANIDADA 
-- Esta es una demostración de cómo SQL Server maneja 
-- transacciones internas que dependen completamente de la transacción externa.
---------------------------------------------------------------

PRINT '--- ESTADO INICIAL ---';
SELECT stock FROM Medicamento WHERE id_medicamento = 1;

DECLARE @id_medicamento INT = 1;

BEGIN TRY
    ---------------------------------------------------------
    -- Transacción externa
    ---------------------------------------------------------
    BEGIN TRAN Externa;
    PRINT 'Transacción Externa INICIADA';
    PRINT 'NIVEL DE TRANSACCIÓN ACTUAL: ' + CAST(@@TRANCOUNT AS NVARCHAR(10));

    -- Operación simple
    UPDATE Medicamento
    SET stock = stock  -- No modifica nada, solo de demostración
    WHERE id_medicamento = @id_medicamento;

    ---------------------------------------------------------
    -- Transacción interna (anidada)
    ---------------------------------------------------------
    BEGIN TRAN Interna;
    PRINT 'Transacción Interna INICIADA';
    PRINT 'NIVEL DE TRANSACCIÓN ACTUAL: ' + CAST(@@TRANCOUNT AS NVARCHAR(10));

    -- Otra operación simple
    UPDATE Medicamento
    SET stock = stock  -- No modifica nada
    WHERE id_medicamento = @id_medicamento;

    COMMIT TRAN Interna;
    PRINT 'Transacción Interna CONFIRMADA';
    PRINT 'NIVEL DE TRANSACCIÓN ACTUAL: ' + CAST(@@TRANCOUNT AS NVARCHAR(10));

    ---------------------------------------------------------
    -- Commit real (el único que realmente confirma cambios)
    ---------------------------------------------------------
    COMMIT TRAN Externa;
    PRINT 'Transacción Externa CONFIRMADA';
    PRINT 'NIVEL DE TRANSACCIÓN ACTUAL: ' + CAST(@@TRANCOUNT AS NVARCHAR(10));

END TRY

BEGIN CATCH
    PRINT 'ERROR en transacción ANIDADA → ROLLBACK';
    ROLLBACK TRAN Externa;
    PRINT ERROR_MESSAGE();
END CATCH;

PRINT '--- ESTADO FINAL ---';
SELECT stock FROM Medicamento WHERE id_medicamento = 1;
