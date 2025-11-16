**Manejo de Transacciones**

En SQL Server, una transacción representa un conjunto de operaciones que deben ejecutarse como una unidad indivisible. Su objetivo principal es proteger la integridad de los datos y asegurar que cualquier 
operación que modifique información se realice de manera completa o, en caso de fallas, se revierta por completo. 
En este sentido, las transacciones son esenciales para mantener la coherencia del sistema frente a errores, caídas inesperadas o cualquier evento que pueda interrumpir la ejecución.

El funcionamiento de las transacciones se basa en el modelo **ACID**, que define cuatro propiedades fundamentales:
**Atomicidad**, que garantiza que todas las instrucciones de la transacción se ejecuten completamente o no se ejecuten.
**Consistencia**, que asegura que las reglas de la base de datos nunca se violen.
**Aislamiento**, que permite que transacciones concurrentes no interfieran entre sí.
**Durabilidad**, que garantiza que los cambios confirmados se mantengan aun si ocurre un fallo del sistema.

Las transacciones anidadas resultan útiles cuando se desea dividir una operación compleja en partes más pequeñas para mejorar la organización y el manejo de errores. Cada subtransacción puede representar un paso lógico 
dentro de una operación mayor, lo que facilita la comprensión y estructuración del código. En SQL Server, aunque es posible iniciar transacciones internas, solo la transacción externa puede confirmar los cambios de manera definitiva. 
Las transacciones internas simplemente incrementan el contador @@TRANCOUNT y su COMMIT no guarda nada hasta que el COMMIT final de la transacción principal ocurra realmente. 
Esto permite controlar procesos complejos de forma ordenada sin comprometer la consistencia de los datos.

En este trabajo se implementaron ejemplos prácticos para evidenciar estos comportamientos en un entorno real, utilizando la base de datos *DB_Integrador_Grupo37* desarrollada para este proyecto.

**Tipos de Transacciones en SQL Server**

En SQL Server se distinguen principalmente tres tipos de transacciones:

***Transacciones Implícitas***
SQL Server inicia una nueva transacción automáticamente cuando se ejecuta una instrucción que modifica datos, sin necesidad de comenzar una transacción de forma explícita. Cada instrucción DML se trata como una transacción independiente.

***Transacciones Explícitas***
Requieren que el usuario indique cuándo comienza y cuándo termina la transacción, mediante los comandos BEGIN TRANSACTION, COMMIT y ROLLBACK. Este tipo fue el utilizado en las pruebas prácticas realizadas.

***Transacciones Anidadas***
Son transacciones definidas dentro del contexto de otra transacción activa. Aunque SQL Server no maneja transacciones anidadas completamente independientes, permite trabajar con múltiples niveles mediante el contador interno @@TRANCOUNT. 
En caso de que ocurra un error en una transacción interna, toda la transacción externa también se verá afectada.

**Parte Práctica**

La consigna solicitó implementar dos casos principales:

Una transacción **exitosa**, que involucre:
-Insertar un registro en una tabla
-Insertar otro registro relacionado
-Actualizar información en una tercera tabla
-Confirmar todos los cambios únicamente si no ocurre ningún error

Una transacción **fallida**, donde se provoque un error intencional que fuerce un ROLLBACK y garantice que ningún cambio quede aplicado en la base.

Además, se agregó un ejemplo de transacción anidada, ya que forma parte del tema asignado y como demostración del caso de estudio.

***Transacción exitosa***
Conteo de cantidad de certificados y stock antes de la implementación de las transacciones 

**Código**

```sql
SELECT COUNT(*) AS CantCertificados_ANTES 
FROM Certificado_Medico;

SELECT stock AS Stock_ANTES 
FROM Medicamento
WHERE id_medicamento = 1;
```
**Resultado**

<img width="211" height="128" alt="4C0B1F81-1CAE-4C17-A5DF-783BA9102A40" src="https://github.com/user-attachments/assets/79c17b46-d4ea-40b7-abe4-d881a9ef83de" />


Transacción exitosa, se inserta un certificado, un medicamento aplicado y actualiza el stock del medicamento.

**Código**

```sql
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
```
**Resultado**

<img width="377" height="154" alt="2" src="https://github.com/user-attachments/assets/324ad6f7-5065-4701-bd91-85ea6ffcbeac" />


Demostración de la ejecución de la transacción, aumento de certificados, descuento de stock y se trae el certificado creado en la ejecución de la transacción.

**Código**

```sql
SELECT COUNT(*) AS CantCertificados_DESPUES 
FROM Certificado_Medico;

SELECT stock AS Stock_DESPUES 
FROM Medicamento 
WHERE id_medicamento = 1;

SELECT * FROM Medicamento_certificado 
WHERE id_certificado_medico = (SELECT MAX(id_certificado_medico) FROM Certificado_Medico);
```

**Resultado**

<img width="455" height="146" alt="3" src="https://github.com/user-attachments/assets/37e7044e-8cbe-41e5-b128-c3ab9465b4a0" />


***Transacción con error forzado***

Estado antes de ejecutar la transacción con error.

**Código**

```sql
SELECT COUNT(*) AS CantCertificados_ANTES_ROLLBACK 
FROM Certificado_Medico;

SELECT COUNT(*) AS CantMedicamentoCertificado_ANTES_ROLLBACK
FROM Medicamento_certificado;

SELECT stock AS Stock_ANTES_ROLLBACK
FROM Medicamento 
WHERE id_medicamento = 1;
```

**Resultado**

<img width="327" height="157" alt="4" src="https://github.com/user-attachments/assets/6f66cc76-ddb2-4046-ba9e-938dc9a04c61" />


Transacción con error forzado en stock negativo.

**Código**

```sql
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
```

**Resultado**

<img width="1455" height="138" alt="5" src="https://github.com/user-attachments/assets/33a15a61-df3b-4cdb-ba84-68253ce51519" />


Verificación del estado luego del rollback

**Código**

```sql
SELECT COUNT(*) AS CantCertificados_DESPUES_ROLLBACK
FROM Certificado_Medico;

SELECT COUNT(*) AS CantMedicamentoCertificado_DESPUES_ROLLBACK
FROM Medicamento_certificado;

SELECT stock AS Stock_DESPUES_ROLLBACK
FROM Medicamento 
WHERE id_medicamento = 1;

SELECT MAX(id_certificado_medico) AS UltimoCertificado
FROM Certificado_Medico;
```

**Resultado**

<img width="383" height="232" alt="6" src="https://github.com/user-attachments/assets/76760bc2-5851-42b9-b057-fdea1bf1fb99" />


***Transacción anidada de demostración***

```sql
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
```

**Resultado**

<img width="271" height="300" alt="7" src="https://github.com/user-attachments/assets/9703de8c-e829-40f1-8d30-7fb436553626" />

