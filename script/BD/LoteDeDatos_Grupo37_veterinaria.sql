
USE DB_Integrador_Grupo37;
GO

-- 1. TABLAS ESTATICAS 
-------------------------------------------------------------------------------

-- ROL 
INSERT INTO Rol (nombre_rol) VALUES
('Administrador'),
('Veterinario'),
('Recepcionista');

-- ESPECIE 
INSERT INTO Especie (nombre_especie) VALUES
('Canina'),
('Felina'),
('Aviar'),
('Roedor'),
('Reptil');

-- TURNO_ESTADO
INSERT INTO Turno_estado (estado_turno) VALUES
('Pendiente'),
('Confirmado'),
('En Curso'),
('Finalizado'),
('Cancelado');

-- METODO_PAGO 
INSERT INTO Metodo_pago (metodo_pago) VALUES
('Efectivo'),
('Tarjeta de Crédito'),
('Tarjeta de Débito'),
('Transferencia Bancaria');

-- MEDICAMENTO 
INSERT INTO Medicamento (nombre_medicamento, precio_unitario, stock, baja) VALUES
('Amoxicilina 500mg', 15.50, 250, 0),
('Meloxicam 2.5mg', 8.90, 300, 0),
('Vacuna Antirrábica', 45.00, 150, 0),
('Praziquantel (Desparasitante)', 12.00, 400, 0),
('Doxiciclina 100mg', 22.75, 200, 0),
('Glucosamina para articulaciones', 35.00, 180, 0),
('Suero Fisiológico 500ml', 5.50, 500, 0),
('Cefalexina 250mg', 18.20, 220, 0),
('Pipeta Antipulgas Grande', 55.00, 100, 0),
('Vitaminas Complejas', 25.00, 200, 0),
('Metronidazol', 10.50, 150, 0),
('Tramadol (Analgésico)', 30.00, 90, 0),
('Ketoconazol (Fungicida)', 14.75, 130, 0),
('Laxante Veterinario', 9.20, 160, 0),
('Antibiótico Oftálmico', 19.90, 110, 0);


-------------------------------------------------------------------------------

-- RAZA (15 Registros - Depende de Especie)
INSERT INTO Raza (nombre_raza, id_especie) VALUES
('Labrador Retriever', 1), -- Canina
('Pastor Alemán', 1),    -- Canina
('Poodle', 1),           -- Canina
('Bulldog Francés', 1),  -- Canina
('Chihuahua', 1),        -- Canina
('Siamés', 2),           -- Felina
('Persa', 2),            -- Felina
('British Shorthair', 2),-- Felina
('Maine Coon', 2),       -- Felina
('Mestizo', 1),          -- Canina (raza común)
('Periquito Australiano', 3), -- Aviar
('Conejo Enano', 4),         -- Roedor
('Tortuga de Tierra', 5),    -- Reptil
('Gato Común Europeo', 2),   -- Felina (raza común)
('Golden Retriever', 1);     -- Canina


-- USUARIO (6 Registros - Depende de Rol)
INSERT INTO Usuario (nombre_usuario, contraseña, correo, num_telefono, id_rol) VALUES
('admin_jefe', 'hash_admin123', 'juan.perez@vet.com', '1123456789', 1), -- Administrador
('vet_maria', 'hash_vet123', 'maria.lopez@vet.com', '1198765432', 2),   -- Veterinario
('vet_carlos', 'hash_vet456', 'carlos.rojas@vet.com', '1155551234', 2),  -- Veterinario
('vet_elena', 'hash_vet789', 'elena.sosa@vet.com', '1144445555', 2),    -- Veterinario Adicional
('recep_ana', 'hash_recep123', 'ana.gomez@vet.com', '1122334455', 3),   -- Recepcionista
('recep_luis', 'hash_recep456', 'luis.diaz@vet.com', '1166778899', 3);  -- Recepcionista

-------------------------------------------------------------------------------

-- 3. CLIENTE (30 Registros)

INSERT INTO Cliente (nombre_apellido_cliente, dni_cliente, telefono_cliente, correo_cliente, domicilio_cliente, baja) VALUES
('Laura Martínez', '28123456', '1130001001', 'laura.m@mail.com', 'Av. Rivadavia 100', 0),
('Roberto Gómez', '30987654', '1130001002', 'robert.g@mail.com', 'Calle Falsa 123', 0),
('Sofía Hernández', '32567890', '1130001003', 'sofia.h@mail.com', 'Bernardo de Irigoyen 500', 0),
('Andrés Castro', '35112233', '1130001004', 'andres.c@mail.com', 'Santa Fe 2050', 0),
('Valeria Rivas', '38445566', '1130001005', 'valeria.r@mail.com', 'Juncal 880', 0),
('Javier Toledo', '25778899', '1130001006', 'javier.t@mail.com', 'Montevideo 1500', 0),
('Luciana Pérez', '29334455', '1130001007', 'luciana.p@mail.com', 'Alem 750', 0),
('Martín Sosa', '31667788', '1130001008', 'martin.s@mail.com', 'Corrientes 3000', 0),
('Elena Ponce', '33001122', '1130001009', 'elena.p@mail.com', 'Libertador 4500', 0),
('Ricardo Díaz', '36223344', '1130001010', 'ricardo.d@mail.com', 'Cerrito 90', 0),
('Camila Ferreyra', '39556677', '1130001011', 'camila.f@mail.com', 'Tucumán 1234', 0),
('Gustavo Benítez', '40112233', '1130001012', 'gustavo.b@mail.com', 'Paraguay 456', 0),
('Florencia Ruiz', '41445566', '1130001013', 'flor.r@mail.com', 'Uruguay 789', 0),
('Diego Herrera', '42778899', '1130001014', 'diego.h@mail.com', 'Chile 101', 0),
('Mariana Gil', '43001122', '1130001015', 'mariana.g@mail.com', 'Perú 202', 0),
('Emilio Núñez', '44223344', '1130001016', 'emilio.n@mail.com', 'Venezuela 303', 0),
('Paula Morales', '45556677', '1130001017', 'paula.m@mail.com', 'Colombia 404', 0),
('Facundo Torres', '46889900', '1130001018', 'facundo.t@mail.com', 'Ecuador 505', 0),
('Victoria López', '47112233', '1130001019', 'victoria.l@mail.com', 'Bolivia 606', 0),
('Ignacio Ramos', '48445566', '1130001020', 'ignacio.r@mail.com', 'Brasil 707', 0),
('Jessica Vidal', '49123456', '1130001021', 'jessica.v@mail.com', 'Pueyrredón 100', 0),
('Franco Ocampo', '50987654', '1130001022', 'franco.o@mail.com', 'Callao 200', 0),
('Abril Ponce', '51567890', '1130001023', 'abril.p@mail.com', 'Belgrano 300', 0),
('Sergio Romero', '52112233', '1130001024', 'sergio.r@mail.com', 'Constitución 400', 0),
('Tamara Díaz', '53445566', '1130001025', 'tamara.d@mail.com', 'San Juan 500', 0),
('Mauro Castro', '54778899', '1130001026', 'mauro.c@mail.com', 'Cordoba 600', 0),
('Brenda Ríos', '55334455', '1130001027', 'brenda.r@mail.com', 'Entre Ríos 700', 0),
('Héctor Sosa', '56667788', '1130001028', 'hector.s@mail.com', 'Lima 800', 0),
('Nerea Luna', '57001122', '1130001029', 'nerea.l@mail.com', 'Salta 900', 0),
('Esteban Vera', '58223344', '1130001030', 'esteban.v@mail.com', 'Jujuy 1000', 0);

-------------------------------------------------------------------------------

-- 4. MASCOTA (50 Registros - Depende de Raza y Cliente)

INSERT INTO Mascota (nombre_mascota, fecha_nac, sexo, id_raza, id_cliente) VALUES
-- Cliente 1: Laura Martínez
('Simba', '2020-05-15', 'Macho', 1, 1), -- Labrador
('Mia', '2023-08-14', 'Hembra', 6, 1), -- Siamés
-- Cliente 2: Roberto Gómez
('Misifu', '2022-03-01', 'Macho', 6, 2), -- Siamés
('Thor', '2024-01-01', 'Macho', 10, 2), -- Mestizo
-- Cliente 3: Sofía Hernández
('Rocky', '2019-11-10', 'Macho', 2, 3), -- Pastor Alemán
('Kira', '2021-04-05', 'Hembra', 15, 3), -- Golden
-- Cliente 4: Andrés Castro
('Luna', '2023-07-25', 'Hembra', 3, 4), -- Poodle
-- Cliente 5: Valeria Rivas
('Garfield', '2021-12-05', 'Macho', 7, 5), -- Persa
-- Cliente 6: Javier Toledo
('Coco', '2020-09-09', 'Macho', 10, 6), -- Mestizo
('Milo', '2024-01-01', 'Macho', 4, 6), -- Bulldog Francés
-- Cliente 7: Luciana Pérez
('Chiqui', '2022-04-12', 'Hembra', 8, 7), -- British Shorthair
-- Cliente 8: Martín Sosa
('Pipo', '2023-01-01', 'Macho', 11, 8), -- Periquito
-- Cliente 9: Elena Ponce
('Pelusa', '2020-02-29', 'Hembra', 1, 9), -- Labrador
-- Cliente 10: Ricardo Díaz
('Rayas', '2022-06-15', 'Macho', 12, 10), -- Conejo Enano
-- Cliente 11: Camila Ferreyra
('Shadow', '2021-08-08', 'Macho', 2, 11), -- Pastor Alemán
-- Cliente 12: Gustavo Benítez
('Bella', '2018-05-20', 'Hembra', 1, 12), -- Labrador
-- Cliente 13: Florencia Ruiz
('Oreo', '2023-03-17', 'Macho', 6, 13), -- Siamés
-- Cliente 14: Diego Herrera
('Toby', '2020-10-30', 'Macho', 3, 14), -- Poodle
-- Cliente 15: Mariana Gil
('Kiwi', '2024-02-01', 'Hembra', 11, 15), -- Periquito
-- Cliente 16: Emilio Núñez
('Rex', '2019-01-01', 'Macho', 10, 16), -- Mestizo
-- Cliente 17: Paula Morales
('Leia', '2022-11-11', 'Hembra', 7, 17), -- Persa
-- Cliente 18: Facundo Torres
('Zoe', '2021-04-05', 'Hembra', 8, 18), -- British Shorthair
-- Cliente 19: Victoria López
('Max', '2020-12-12', 'Macho', 2, 19), -- Pastor Alemán
-- Cliente 20: Ignacio Ramos
('Duke', '2023-06-06', 'Macho', 1, 20), -- Labrador
('Sasha', '2024-04-10', 'Hembra', 5, 20), -- Chihuahua
-- Cliente 21: Jessica Vidal
('Pichu', '2022-01-20', 'Hembra', 11, 21), -- Periquito
-- Cliente 22: Franco Ocampo
('Mufasa', '2019-03-03', 'Macho', 9, 22), -- Maine Coon
-- Cliente 23: Abril Ponce
('Goliat', '2017-07-07', 'Macho', 13, 23), -- Tortuga
-- Cliente 24: Sergio Romero
('Nala', '2021-10-10', 'Hembra', 15, 24), -- Golden
-- Cliente 25: Tamara Díaz
('Tito', '2023-05-05', 'Macho', 4, 25), -- Bulldog Francés
-- Cliente 26: Mauro Castro
('Chispa', '2022-08-08', 'Hembra', 14, 26), -- Gato Común
-- Cliente 27: Brenda Ríos
('Bruno', '2020-04-01', 'Macho', 1, 27), -- Labrador
-- Cliente 28: Héctor Sosa
('Fiona', '2023-11-20', 'Hembra', 5, 28), -- Chihuahua
-- Cliente 29: Nerea Luna
('Jack', '2021-06-16', 'Macho', 3, 29), -- Poodle
-- Cliente 30: Esteban Vera
('Cami', '2022-02-22', 'Hembra', 10, 30), -- Mestizo
-- Mascotas adicionales para clientes existentes (total 50)
('Copito', '2024-02-01', 'Macho', 12, 1), -- Conejo
('Paco', '2023-10-01', 'Macho', 11, 2), -- Periquito
('Lola', '2020-01-10', 'Hembra', 4, 3), -- Bulldog Francés
('Mora', '2021-05-05', 'Hembra', 10, 4), -- Mestizo
('Sol', '2022-09-09', 'Hembra', 7, 5), -- Persa
('Frodo', '2023-04-04', 'Macho', 15, 9), -- Golden
('Rocco', '2022-07-07', 'Macho', 5, 12), -- Chihuahua
('Tita', '2021-01-01', 'Hembra', 14, 14), -- Gato Común
('Negra', '2020-06-06', 'Hembra', 10, 16), -- Mestizo
('Goloso', '2023-03-13', 'Macho', 9, 18), -- Maine Coon
('Princesa', '2022-05-15', 'Hembra', 8, 20), -- British Shorthair
('Manchas', '2021-08-28', 'Macho', 1, 23), -- Labrador
('Pepito', '2024-03-03', 'Macho', 11, 25), -- Periquito
('Estrella', '2020-11-11', 'Hembra', 2, 27), -- Pastor Alemán
('Zen', '2022-04-20', 'Macho', 13, 29); -- Tortuga

-------------------------------------------------------------------------------
-- 5. TURNO 

DECLARE @Hoy DATE = GETDATE();

INSERT INTO Turno (fecha_turno, hora_turno, motivo, id_turno_estado, id_usuario, id_mascota) VALUES
-- Finalizados (Históricos Recientes - 25 Registros)
(DATEADD(day, -30, @Hoy), '10:00:00', 'Chequeo anual y vacuna', 4, 2, 1),
(DATEADD(day, -29, @Hoy), '14:30:00', 'Control post-operatorio', 4, 3, 3),
(DATEADD(day, -28, @Hoy), '09:00:00', 'Consulta por tos', 4, 4, 5),
(DATEADD(day, -27, @Hoy), '11:15:00', 'Desparasitación', 4, 2, 7),
(DATEADD(day, -26, @Hoy), '16:00:00', 'Revisión general', 4, 3, 9),
(DATEADD(day, -25, @Hoy), '12:00:00', 'Vacunación', 4, 4, 11),
(DATEADD(day, -24, @Hoy), '15:00:00', 'Pérdida de apetito', 4, 2, 13),
(DATEADD(day, -23, @Hoy), '10:30:00', 'Corte de uñas y pico', 4, 3, 15),
(DATEADD(day, -22, @Hoy), '09:30:00', 'Consulta por diarrea', 4, 4, 17),
(DATEADD(day, -21, @Hoy), '14:00:00', 'Chequeo de oído', 4, 2, 19),
(DATEADD(day, -20, @Hoy), '10:00:00', 'Lesión en la pata', 4, 3, 21),
(DATEADD(day, -19, @Hoy), '10:45:00', 'Control de peso', 4, 4, 23),
(DATEADD(day, -18, @Hoy), '11:30:00', 'Molestias al orinar', 4, 2, 25),
(DATEADD(day, -17, @Hoy), '09:00:00', 'Vacuna de refuerzo', 4, 3, 27),
(DATEADD(day, -16, @Hoy), '13:00:00', 'Chequeo de piel', 4, 4, 29),
(DATEADD(day, -15, @Hoy), '15:30:00', 'Problemas dentales', 4, 2, 31),
(DATEADD(day, -14, @Hoy), '10:00:00', 'Revisión cachorra', 4, 3, 33),
(DATEADD(day, -13, @Hoy), '11:00:00', 'Cita de seguimiento', 4, 4, 35),
(DATEADD(day, -12, @Hoy), '14:00:00', 'Ojos llorosos', 4, 2, 37),
(DATEADD(day, -11, @Hoy), '16:00:00', 'Castración', 4, 3, 39),
(DATEADD(day, -10, @Hoy), '09:30:00', 'Revisión por alergia', 4, 4, 41),
(DATEADD(day, -9, @Hoy), '14:00:00', 'Consulta por cojera', 4, 2, 43),
(DATEADD(day, -8, @Hoy), '11:00:00', 'Dolor abdominal', 4, 3, 45),
(DATEADD(day, -7, @Hoy), '13:00:00', 'Estornudos frecuentes', 4, 4, 47),
(DATEADD(day, -6, @Hoy), '15:00:00', 'Mordedura de insecto', 4, 2, 49),

-- Finalizados (Históricos Antiguos - 25 Registros)
(DATEADD(day, -90, @Hoy), '10:00:00', 'Vacunación inicial', 4, 3, 2),
(DATEADD(day, -88, @Hoy), '14:30:00', 'Consulta de rutina', 4, 4, 4),
(DATEADD(day, -85, @Hoy), '09:00:00', 'Control de peso', 4, 2, 6),
(DATEADD(day, -83, @Hoy), '11:15:00', 'Exceso de rascado', 4, 3, 8),
(DATEADD(day, -80, @Hoy), '16:00:00', 'Revisión de dientes', 4, 4, 10),
(DATEADD(day, -78, @Hoy), '12:00:00', 'Desparasitación', 4, 2, 12),
(DATEADD(day, -75, @Hoy), '15:00:00', 'Chequeo de edad avanzada', 4, 3, 14),
(DATEADD(day, -73, @Hoy), '10:30:00', 'Problema de conducta', 4, 4, 16),
(DATEADD(day, -70, @Hoy), '09:30:00', 'Vacuna de gripe', 4, 2, 18),
(DATEADD(day, -68, @Hoy), '14:00:00', 'Chequeo de heridas', 4, 3, 20),
(DATEADD(day, -65, @Hoy), '10:00:00', 'Consulta por fatiga', 4, 4, 22),
(DATEADD(day, -63, @Hoy), '10:45:00', 'Vacunación anual', 4, 2, 24),
(DATEADD(day, -60, @Hoy), '11:30:00', 'Problema de vista', 4, 3, 26),
(DATEADD(day, -58, @Hoy), '09:00:00', 'Control de medicación', 4, 4, 28),
(DATEADD(day, -55, @Hoy), '13:00:00', 'Chequeo de uñas', 4, 2, 30),
(DATEADD(day, -53, @Hoy), '15:30:00', 'Consulta por estomatitis', 4, 3, 32),
(DATEADD(day, -50, @Hoy), '10:00:00', 'Revisión general', 4, 4, 34),
(DATEADD(day, -48, @Hoy), '11:00:00', 'Corte de pelo', 4, 2, 36),
(DATEADD(day, -45, @Hoy), '14:00:00', 'Consulta por otitis', 4, 3, 38),
(DATEADD(day, -43, @Hoy), '16:00:00', 'Castración (control)', 4, 4, 40),
(DATEADD(day, -40, @Hoy), '09:30:00', 'Revisión por dolor', 4, 2, 42),
(DATEADD(day, -38, @Hoy), '14:00:00', 'Consulta de urgencia', 4, 3, 44),
(DATEADD(day, -35, @Hoy), '11:00:00', 'Control de parásitos', 4, 4, 46),
(DATEADD(day, -33, @Hoy), '13:00:00', 'Estudios de sangre', 4, 2, 48),
(DATEADD(day, -31, @Hoy), '15:00:00', 'Chequeo respiratorio', 4, 3, 50),

-- En Curso/Confirmados (Futuros y Hoy - 15 Registros)
(@Hoy, '10:00:00', 'Control de diarrea', 3, 2, 2), -- En Curso
(@Hoy, '11:00:00', 'Molestias en la piel', 3, 3, 4), -- En Curso
(DATEADD(day, 1, @Hoy), '09:00:00', 'Vacuna de refuerzo', 2, 4, 6), -- Confirmado
(DATEADD(day, 1, @Hoy), '13:00:00', 'Chequeo de piel', 2, 2, 8), -- Confirmado
(DATEADD(day, 2, @Hoy), '15:30:00', 'Problemas dentales', 2, 3, 10), -- Confirmado
(DATEADD(day, 3, @Hoy), '10:00:00', 'Revisión cachorra', 2, 4, 12), -- Confirmado
(DATEADD(day, 4, @Hoy), '11:00:00', 'Cita de seguimiento', 2, 2, 14), -- Confirmado
(DATEADD(day, 5, @Hoy), '14:00:00', 'Consulta por ojos llorosos', 2, 3, 16), -- Confirmado
(DATEADD(day, 7, @Hoy), '10:00:00', 'Revisión general', 1, 4, 18), -- Pendiente
(DATEADD(day, 7, @Hoy), '16:00:00', 'Castración (presupuesto)', 1, 2, 20), -- Pendiente
(DATEADD(day, 8, @Hoy), '11:30:00', 'Desparasitación', 1, 3, 22), -- Pendiente
(DATEADD(day, 9, @Hoy), '14:00:00', 'Chequeo de edad', 1, 4, 24), -- Pendiente
(DATEADD(day, 10, @Hoy), '09:00:00', 'Vacuna Antirrábica', 1, 2, 26), -- Pendiente
(DATEADD(day, 10, @Hoy), '12:00:00', 'Consulta por heridas', 1, 3, 28), -- Pendiente
(DATEADD(day, 11, @Hoy), '15:00:00', 'Control de alergia', 1, 4, 30), -- Pendiente

-- Cancelados (10 Registros)
(DATEADD(day, -15, @Hoy), '17:00:00', 'Consulta por alergia (cancelada)', 5, 2, 32),
(DATEADD(day, -10, @Hoy), '13:00:00', 'Baño y peluquería (cancelado)', 5, 3, 34),
(DATEADD(day, -5, @Hoy), '10:00:00', 'Chequeo de rutina (cancelado)', 5, 4, 36),
(DATEADD(day, -3, @Hoy), '11:00:00', 'Seguimiento (cancelado)', 5, 2, 38),
(DATEADD(day, -1, @Hoy), '14:00:00', 'Emergencia (cancelada)', 5, 3, 40),
(DATEADD(day, 1, @Hoy), '17:00:00', 'Vacuna (cancelada por cliente)', 5, 4, 42),
(DATEADD(day, 2, @Hoy), '13:00:00', 'Desparasitación (cancelada)', 5, 2, 44),
(DATEADD(day, 3, @Hoy), '10:00:00', 'Control de peso (cancelado)', 5, 3, 46),
(DATEADD(day, 4, @Hoy), '11:00:00', 'Chequeo (cancelado)', 5, 4, 48),
(DATEADD(day, 5, @Hoy), '14:00:00', 'Revisión (cancelada)', 5, 2, 50);


-- 6. CERTIFICADO_MEDICO (50 Registros - Depende de Turno Finalizado y Usuario Veterinario)
-------------------------------------------------------------------------------
-- Se usan los primeros 50 Turnos Finalizados (id_turno 1 a 50)
INSERT INTO Certificado_Medico (fecha_emision, observacion, diagnostico, id_turno, id_usuario) VALUES
(@Hoy, 'Mascota en buen estado general. Vacuna al día.', 'Chequeo anual OK', 1, 2),
(@Hoy, 'Retiro de puntos sin complicaciones. Herida limpia.', 'Post-Operatorio Limpio', 2, 3),
(@Hoy, 'Tos seca. Se descarta cuerpo extraño.', 'Faringitis leve', 3, 4),
(@Hoy, 'Se aplica antiparasitario interno. Cliente informado.', 'Desparasitación Rutinaria', 4, 2),
(@Hoy, 'Piel y pelaje sano. Peso ideal.', 'Control de Rutina', 5, 3),
(@Hoy, 'Vacuna Antirrábica aplicada. Proxima en un año.', 'Vacunación Antirrábica', 6, 4),
(@Hoy, 'Análisis de sangre y heces. Pendiente.', 'Pérdida de apetito (inconcluso)', 7, 2),
(@Hoy, 'Corte de uñas y control de pico sin novedades.', 'Mantenimiento General', 8, 3),
(@Hoy, 'Se estabiliza el paciente. Se indica dieta blanda.', 'Gastroenteritis', 9, 4),
(@Hoy, 'Se examina el conducto auditivo. Leve inflamación.', 'Otitis Externa', 10, 2),
(@Hoy, 'Lesión en la almohadilla curada con suturas.', 'Herida Leve', 11, 3),
(@Hoy, 'Peso estable. Se mantiene la dieta.', 'Control Nutricional OK', 12, 4),
(@Hoy, 'Se administra antibiótico. Se descarta obstrucción.', 'Cistitis Bacteriana', 13, 2),
(@Hoy, 'Refuerzo de vacuna Pentavalente aplicado.', 'Vacunación de Refuerzo', 14, 3),
(@Hoy, 'Piel escamosa. Se recomienda champú especial.', 'Dermatitis leve', 15, 4),
(@Hoy, 'Limpieza dental con ultrasonido.', 'Sarro Grado 1', 16, 2),
(@Hoy, 'Revisión completa. Cachorra sana.', 'Control Pediátrico', 17, 3),
(@Hoy, 'Mascota activa. Proxima cita en 6 meses.', 'Seguimiento Rutinario', 18, 4),
(@Hoy, 'Conjuntivitis. Se receta antibiótico oftálmico.', 'Conjuntivitis', 19, 2),
(@Hoy, 'Cirugía exitosa. Cita de control en 10 días.', 'Post-Castración', 20, 3),
(@Hoy, 'Erupción en la piel. Se sospecha alergia alimentaria.', 'Dermatitis Alérgica', 21, 4),
(@Hoy, 'Fractura de falange. Inmovilización y analgésicos.', 'Fractura por Caída', 22, 2),
(@Hoy, 'Dolor resuelto con analgésicos.', 'Dolor Abdominal', 23, 3),
(@Hoy, 'Se descarta enfermedad respiratoria grave.', 'Resfriado Común', 24, 4),
(@Hoy, 'Se aplicó suero y corticoide.', 'Reacción Alérgica', 25, 2),

-- 25 Certificados Antiguos
(DATEADD(day, -1, @Hoy), 'Vacuna de refuerzo aplicada.', 'Inmunización Anual', 26, 3),
(DATEADD(day, -1, @Hoy), 'Chequeo completo. Sin novedades.', 'Rutina OK', 27, 4),
(DATEADD(day, -1, @Hoy), 'Se recetó fungicida para el rascado.', 'Micosis', 28, 2),
(DATEADD(day, -1, @Hoy), 'Revisión sin sarro.', 'Higiene Dental OK', 29, 3),
(DATEADD(day, -1, @Hoy), 'Desparasitación interna. Cliente informado.', 'Control de Parásitos', 30, 4),
(DATEADD(day, -1, @Hoy), 'Mascota sana, bien hidratada.', 'Control de Edad', 31, 2),
(DATEADD(day, -1, @Hoy), 'Se descartan problemas de conducta. OK', 'Control Conductual', 32, 3),
(DATEADD(day, -1, @Hoy), 'Vacuna de la tos de las perreras.', 'Vacuna Respiratoria', 33, 4),
(DATEADD(day, -1, @Hoy), 'Herida limpia, se indicó cura diaria.', 'Curación de Herida', 34, 2),
(DATEADD(day, -1, @Hoy), 'Se recomienda cambio de dieta.', 'Fatiga por Dieta', 35, 3),
(DATEADD(day, -1, @Hoy), 'Vacuna anual aplicada.', 'Inmunización Completa', 36, 4),
(DATEADD(day, -1, @Hoy), 'Se derivará a especialista en ojos.', 'Cataratas iniciales', 37, 2),
(DATEADD(day, -1, @Hoy), 'Medicación para control de epilepsia.', 'Control de Enfermedad Crónica', 38, 3),
(DATEADD(day, -1, @Hoy), 'Uñas cortas y limadas.', 'Mantenimiento de Uñas', 39, 4),
(DATEADD(day, -1, @Hoy), 'Se indica enjuague bucal medicado.', 'Gingivitis leve', 40, 2),
(DATEADD(day, -1, @Hoy), 'Revisión sin anomalías.', 'Chequeo General', 41, 3),
(DATEADD(day, -1, @Hoy), 'Se observan cálculos. Pendiente cirugía.', 'Urolitiasis', 42, 4),
(DATEADD(day, -1, @Hoy), 'Se controla el tratamiento.', 'Control Post-Cirugía', 43, 2),
(DATEADD(day, -1, @Hoy), 'Se confirma otitis por hongos.', 'Otitis Fúngica', 44, 3),
(DATEADD(day, -1, @Hoy), 'Control post-cirugía.', 'Control Post-Castración', 45, 4),
(DATEADD(day, -1, @Hoy), 'El dolor cesó con analgésicos.', 'Mialgia', 46, 2),
(DATEADD(day, -1, @Hoy), 'Exámenes de sangre normales.', 'Chequeo Preventivo', 47, 3),
(DATEADD(day, -1, @Hoy), 'Control OK. Se mantiene tratamiento.', 'Control de Parásitos OK', 48, 4),
(DATEADD(day, -1, @Hoy), 'Se realizaron estudios. Resultados pendientes.', 'Estudios de Seguimiento', 49, 2),
(DATEADD(day, -1, @Hoy), 'Respiración normal. Se descarta asma.', 'Control Respiratorio OK', 50, 3);


-- 7. MEDICAMENTO_CERTIFICADO (60 Registros - Relación N:M)
-------------------------------------------------------------------------------
INSERT INTO Medicamento_certificado (id_medicamento, id_certificado_medico, dosis, subtotal) VALUES
-- Certificados 1-10
(3, 1, 'Dosis única, subcutánea', 45.00), -- Vacuna Antirrábica
(12, 2, '1ml c/12hs', 30.00), -- Tramadol (analgésico post-op)
(1, 3, '500mg, cada 12hs por 7 días', 15.50 * 2), -- Amoxicilina
(4, 4, 'Dosis única, oral', 12.00 * 1), -- Praziquantel
(9, 5, 'Aplicación externa', 55.00), -- Pipeta Antipulgas
(3, 6, 'Dosis única, subcutánea', 45.00), -- Vacuna Antirrábica
(5, 7, '100mg, cada 24hs por 10 días', 22.75 * 1), -- Doxiciclina
(10, 7, '1 cápsula diaria', 25.00 * 1), -- Vitaminas
(10, 8, '1 cápsula diaria', 25.00), -- Vitaminas
(7, 9, 'Aplicación en clínica', 5.50 * 3), -- Suero Fisiológico
(8, 9, '250mg, cada 8hs por 5 días', 18.20 * 2), -- Cefalexina
(2, 10, '2.5mg, una vez al día por 5 días', 8.90 * 1), -- Meloxicam
-- Certificados 11-20
(1, 11, '500mg, cada 12hs por 5 días', 15.50 * 1), -- Amoxicilina
(6, 12, '1 tableta diaria', 35.00), -- Glucosamina
(1, 13, '500mg, cada 12hs por 7 días', 15.50 * 2), -- Amoxicilina
(3, 14, 'Dosis única, subcutánea', 45.00), -- Vacuna Antirrábica
(13, 15, 'Crema tópica', 14.75), -- Ketoconazol
(1, 16, '500mg, cada 12hs por 7 días', 15.50 * 2), -- Amoxicilina
(4, 17, 'Dosis única, oral', 12.00 * 1), -- Praziquantel
(15, 19, 'Aplicación 3 veces al día', 19.90), -- Antibiótico Oftálmico
(12, 20, '1ml c/12hs', 30.00), -- Tramadol
-- Certificados 21-30
(13, 21, 'Champú medicado', 14.75), -- Ketoconazol
(12, 22, '1ml c/12hs', 30.00), -- Tramadol
(12, 23, '1ml c/24hs', 30.00), -- Tramadol
(11, 24, '2ml c/12hs', 10.50 * 2), -- Metronidazol
(7, 25, 'Aplicación en clínica', 5.50 * 2), -- Suero Fisiológico
(3, 26, 'Dosis única', 45.00), -- Vacuna Antirrábica
(9, 27, 'Pipeta para prevención', 55.00), -- Pipeta Antipulgas
(13, 28, 'Crema tópica', 14.75), -- Ketoconazol
(10, 29, '1 cápsula diaria', 25.00), -- Vitaminas
(4, 30, 'Dosis única, oral', 12.00 * 1), -- Praziquantel
-- Certificados 31-40
(6, 31, '1 tableta diaria', 35.00), -- Glucosamina
(10, 32, '1 cápsula diaria', 25.00), -- Vitaminas
(3, 33, 'Dosis única', 45.00), -- Vacuna Antirrábica
(1, 34, '500mg, cada 12hs por 7 días', 15.50 * 2), -- Amoxicilina
(10, 35, '1 cápsula diaria', 25.00), -- Vitaminas
(3, 36, 'Dosis única', 45.00), -- Vacuna Antirrábica
(6, 37, '1 tableta diaria', 35.00), -- Glucosamina
(5, 38, '100mg, cada 24hs por 10 días', 22.75 * 1), -- Doxiciclina
(10, 39, '1 cápsula diaria', 25.00), -- Vitaminas
(1, 40, '500mg, cada 12hs por 7 días', 15.50 * 2), -- Amoxicilina
-- Certificados 41-50
(12, 41, '1ml c/12hs', 30.00), -- Tramadol
(5, 42, '100mg, cada 24hs por 10 días', 22.75 * 1), -- Doxiciclina
(12, 43, '1ml c/12hs', 30.00), -- Tramadol
(13, 44, 'Gotas óticas', 14.75), -- Ketoconazol
(12, 45, '1ml c/12hs', 30.00), -- Tramadol
(2, 46, '2.5mg, una vez al día por 5 días', 8.90 * 1), -- Meloxicam
(10, 47, '1 cápsula diaria', 25.00), -- Vitaminas
(4, 48, 'Dosis única, oral', 12.00 * 1), -- Praziquantel
(10, 49, '1 cápsula diaria', 25.00), -- Vitaminas
(2, 50, '2.5mg, una vez al día por 5 días', 8.90 * 1); -- Meloxicam

-------------------------------------------------------------------------------

-- 8. FACTURA (50 Registros - Depende de Factura, Usuario, Turno y Cliente)

-- Se facturan los 50 turnos con certificado médico. Total = SUM(Medicamentos) + 100 (Consulta Base).
-- Los ID de usuario 5 (Recepcionista Ana) y 6 (Recepcionista Luis) se alternan.

INSERT INTO Factura (fecha_emision, total, id_metodo_pago, id_usuario, id_turno, id_cliente) VALUES
(@Hoy, 145.00, 1, 5, 1, 1),   -- T1: 45.00 + 100
(@Hoy, 130.00, 2, 6, 2, 2),   -- T2: 30.00 + 100
(@Hoy, 131.00, 3, 5, 3, 3),   -- T3: 31.00 + 100
(@Hoy, 112.00, 1, 6, 4, 4),   -- T4: 12.00 + 100
(@Hoy, 155.00, 2, 5, 5, 5),   -- T5: 55.00 + 100
(@Hoy, 145.00, 3, 6, 6, 6),   -- T6: 45.00 + 100
(@Hoy, 147.75, 4, 5, 7, 7),   -- T7: 47.75 + 100
(@Hoy, 125.00, 1, 6, 8, 8),   -- T8: 25.00 + 100
(@Hoy, 152.90, 2, 5, 9, 9),   -- T9: 52.90 + 100
(@Hoy, 108.90, 3, 6, 10, 10), -- T10: 8.90 + 100
(@Hoy, 115.50, 4, 5, 11, 11), -- T11: 15.50 + 100
(@Hoy, 135.00, 1, 6, 12, 12), -- T12: 35.00 + 100
(@Hoy, 131.00, 2, 5, 13, 13), -- T13: 31.00 + 100
(@Hoy, 145.00, 3, 6, 14, 14), -- T14: 45.00 + 100
(@Hoy, 114.75, 4, 5, 15, 15), -- T15: 14.75 + 100
(@Hoy, 131.00, 1, 6, 16, 16), -- T16: 31.00 + 100
(@Hoy, 112.00, 2, 5, 17, 17), -- T17: 12.00 + 100
(@Hoy, 119.90, 3, 6, 18, 18), -- T18: 19.90 + 100
(@Hoy, 130.00, 4, 5, 19, 19), -- T19: 30.00 + 100
(@Hoy, 114.75, 1, 6, 20, 20), -- T20: 14.75 + 100
(@Hoy, 130.00, 2, 5, 21, 21), -- T21: 30.00 + 100
(@Hoy, 130.00, 3, 6, 22, 22), -- T22: 30.00 + 100
(@Hoy, 121.00, 4, 5, 23, 23), -- T23: 21.00 + 100
(@Hoy, 111.00, 1, 6, 24, 24), -- T24: 11.00 + 100
(@Hoy, 145.00, 2, 5, 25, 25), -- T25: 45.00 + 100

(DATEADD(day, -1, @Hoy), 130.00, 3, 6, 26, 26), -- T26: 30.00 + 100
(DATEADD(day, -1, @Hoy), 155.00, 4, 5, 27, 27), -- T27: 55.00 + 100
(DATEADD(day, -1, @Hoy), 114.75, 1, 6, 28, 28), -- T28: 14.75 + 100
(DATEADD(day, -1, @Hoy), 125.00, 2, 5, 29, 29), -- T29: 25.00 + 100
(DATEADD(day, -1, @Hoy), 112.00, 3, 6, 30, 30), -- T30: 12.00 + 100
(DATEADD(day, -1, @Hoy), 135.00, 4, 5, 31, 1),  -- T31: 35.00 + 100
(DATEADD(day, -1, @Hoy), 125.00, 1, 6, 32, 2),  -- T32: 25.00 + 100
(DATEADD(day, -1, @Hoy), 145.00, 2, 5, 33, 3),  -- T33: 45.00 + 100
(DATEADD(day, -1, @Hoy), 131.00, 3, 6, 34, 4),  -- T34: 31.00 + 100
(DATEADD(day, -1, @Hoy), 125.00, 4, 5, 35, 5),  -- T35: 25.00 + 100
(DATEADD(day, -1, @Hoy), 145.00, 1, 6, 36, 6),  -- T36: 45.00 + 100
(DATEADD(day, -1, @Hoy), 135.00, 2, 5, 37, 7),  -- T37: 35.00 + 100
(DATEADD(day, -1, @Hoy), 122.75, 3, 6, 38, 8),  -- T38: 22.75 + 100
(DATEADD(day, -1, @Hoy), 125.00, 4, 5, 39, 9),  -- T39: 25.00 + 100
(DATEADD(day, -1, @Hoy), 131.00, 1, 6, 40, 10), -- T40: 31.00 + 100
(DATEADD(day, -1, @Hoy), 130.00, 2, 5, 41, 11), -- T41: 30.00 + 100
(DATEADD(day, -1, @Hoy), 122.75, 3, 6, 42, 12), -- T42: 22.75 + 100
(DATEADD(day, -1, @Hoy), 130.00, 4, 5, 43, 13), -- T43: 30.00 + 100
(DATEADD(day, -1, @Hoy), 114.75, 1, 6, 44, 14), -- T44: 14.75 + 100
(DATEADD(day, -1, @Hoy), 130.00, 2, 5, 45, 15), -- T45: 30.00 + 100
(DATEADD(day, -1, @Hoy), 108.90, 3, 6, 46, 16), -- T46: 8.90 + 100
(DATEADD(day, -1, @Hoy), 125.00, 4, 5, 47, 17), -- T47: 25.00 + 100
(DATEADD(day, -1, @Hoy), 112.00, 1, 6, 48, 18), -- T48: 12.00 + 100
(DATEADD(day, -1, @Hoy), 125.00, 2, 5, 49, 19), -- T49: 25.00 + 100
(DATEADD(day, -1, @Hoy), 108.90, 3, 6, 50, 20); -- T50: 8.90 + 100

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- VERIFICACIÓN DE TABLAS CARGADAS 

-- 1. Tablas Estáticas y de Configuración
SELECT '1. Rol' AS Tabla, COUNT(*) AS Cantidad FROM Rol;
SELECT '2. Especie' AS Tabla, COUNT(*) AS Cantidad FROM Especie;
SELECT '3. Turno_estado' AS Tabla, COUNT(*) AS Cantidad FROM Turno_estado;
SELECT '4. Metodo_pago' AS Tabla, COUNT(*) AS Cantidad FROM Metodo_pago;
SELECT '5. Usuario' AS Tabla, COUNT(*) AS Cantidad FROM Usuario;
SELECT '6. Raza' AS Tabla, COUNT(*) AS Cantidad FROM Raza;
SELECT '7. Medicamento' AS Tabla, COUNT(*) AS Cantidad FROM Medicamento;

-- 2. Tablas Principales (Maestras)
SELECT '8. Cliente' AS Tabla, COUNT(*) AS Cantidad FROM Cliente;
SELECT '9. Mascota' AS Tabla, COUNT(*) AS Cantidad FROM Mascota;

-- 3. Tablas de Transacción y Relaciones
SELECT '10. Turno' AS Tabla, COUNT(*) AS Cantidad FROM Turno;
SELECT '11. Certificado_Medico' AS Tabla, COUNT(*) AS Cantidad FROM Certificado_Medico;
SELECT '12. Factura' AS Tabla, COUNT(*) AS Cantidad FROM Factura;
SELECT '13. Medicamento_certificado' AS Tabla, COUNT(*) AS Cantidad FROM Medicamento_certificado;