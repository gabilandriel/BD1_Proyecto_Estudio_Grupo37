USE DB_Integrador_Grupo37;
GO

-- ESTADOS DEL TURNO
INSERT INTO Turno_estado (estado_turno)
VALUES ('Pendiente'), ('Confirmado'), ('Cancelado');
GO

-- ROLES
INSERT INTO Rol (nombre_rol)
VALUES ('Administrador');
GO

-- USUARIO
INSERT INTO Usuario (nombre_usuario, contraseña, correo, num_telefono, id_rol)
VALUES ('admin', '1234', 'admin@correo.com', '123456', 4);
GO

-- CLIENTE
INSERT INTO Cliente (nombre_apellido_cliente, dni_cliente, telefono_cliente, correo_cliente, domicilio_cliente, baja)
VALUES ('Cliente Ejemplo', '12345678', '5551234', 'cliente@example.com', 'Calle Falsa 123', 0);
GO

-- ESPECIE
INSERT INTO Especie (nombre_especie)
VALUES ('Perro');
GO

-- RAZA (tiene FK a especie)
INSERT INTO Raza (nombre_raza, id_especie)
VALUES ('Mestizo', 1);
GO

-- MASCOTA (Tiene FK a raza + cliente)
INSERT INTO Mascota (nombre_mascota, fecha_nac, sexo, id_raza, id_cliente)
VALUES ('Firulais', '2020-01-01', 'Macho', 4, 4);
GO


-- Ahora sí, inserción masiva en la tabla Turno
DECLARE @i INT = 1;
DECLARE @UsuarioValido INT = 5;   -- tu usuario admin real
DECLARE @MascotaMax INT = 4;      -- tu última mascota cargada
                                  
WHILE @i <= 200000
BEGIN
    INSERT INTO Turno (fecha_turno, hora_turno, motivo, id_turno_estado, id_usuario, id_mascota)
    VALUES
    (
        DATEADD(DAY, @i % 365, '2023-01-01'),
        '10:00',
        'Control general',
        11 + (@i % 3),     -- Estados: 11(pendiente),12(confirmado),13(cancelado)
        @UsuarioValido,    -- siempre usuario válido
        @MascotaMax        -- siempre la mascota 4 para evitar FK error
    );

    SET @i = @i + 1;
END;
GO

-- Consulta sin índices
SET STATISTICS TIME ON;
SET STATISTICS IO ON;
GO

SELECT 
    id_turno,
    fecha_turno,
    id_turno_estado,
    id_usuario,
    id_mascota
FROM Turno
WHERE fecha_turno BETWEEN '2023-05-01' AND '2024-05-01'
ORDER BY fecha_turno;
GO

-- Índice agrupado por fecha
CREATE CLUSTERED INDEX IDX_Turno_Fecha_NonClustered
ON Turno(fecha_turno)

GO

-- Consulta con índice agrupado
SET STATISTICS TIME ON;
SET STATISTICS IO ON;
GO

SELECT 
    id_turno,
    fecha_turno,
    id_turno_estado,
    id_usuario,
    id_mascota
FROM Turno
WHERE fecha_turno BETWEEN '2023-05-01' AND '2024-05-01'
ORDER BY fecha_turno;
GO

-- Borrar índice agrupado
DROP INDEX IDX_Turno_Fecha_NonClustered ON Turno;
GO

-- Índice agrupado con columnas incluidas
CREATE CLUSTERED INDEX IDX_Turno_Fecha_Clustered
ON Turno (fecha_turno, id_turno_estado, id_usuario, id_mascota);


-- Consulta con índice incluido
SET STATISTICS TIME ON;
SET STATISTICS IO ON;
GO

SELECT 
    id_turno,
    fecha_turno,
    id_turno_estado,
    id_usuario,
    id_mascota
FROM Turno
WHERE fecha_turno BETWEEN '2023-05-01' AND '2024-05-01'
ORDER BY fecha_turno;
GO
