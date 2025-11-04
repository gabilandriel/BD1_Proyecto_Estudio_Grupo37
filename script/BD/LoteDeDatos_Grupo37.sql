USE DB_Integrador_Grupo37
GO

-- ===============================
-- 1. ROL
-- ===============================
INSERT INTO Rol (nombre_rol) VALUES
('Administrador'),
('Recepcionista'),
('Veterinario'),
('Cliente');

-- ===============================
-- 2. VETERINARIO_ESPECIALIDAD
-- ===============================
INSERT INTO Veterinario_especialidad (especialidad) VALUES
('Cirugía General'),
('Dermatología'),
('Oftalmología'),
('Cardiología'),
('Neurología'),
('Medicina Interna'),
('Odontología'),
('Oncología'),
('Traumatología'),
('Rehabilitación');

-- ===============================
-- 3. MASCOTA_ESTADO
-- ===============================
INSERT INTO Mascota_estado (estado_mascota) VALUES
('Sana'),
('En tratamiento'),
('Hospitalizada'),
('Fallecida');

-- ===============================
-- 4. TURNO_ESTADO
-- ===============================
INSERT INTO Turno_estado (estado_turno) VALUES
('Pendiente'),
('Confirmado'),
('Cancelado'),
('Completado'),
('Ausente');

-- ===============================
-- 5. MÉTODO DE PAGO
-- ===============================
INSERT INTO Metodo_pago (metodo_pago) VALUES
('Efectivo'),
('Tarjeta Débito'),
('Tarjeta Crédito'),
('Transferencia'),
('MercadoPago');

-- ===============================
-- 6. ESTADO DE PAGO
-- ===============================
INSERT INTO Estado_pago (estado_pago) VALUES
('Pagado'),
('Pendiente'),
('Anulado');


-- FIN DEL CATALOGO --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- ==================================================
-- EMPLEADOS (50 registros aleatorios)
-- ==================================================
INSERT INTO Empleado (nombre_apellido_empleado, correo_empleado, telefono_empleado, baja)
VALUES
('María López', 'maria.lopez@veterinaria.com', '3794123456', 0),
('Juan González', 'juan.gonzalez@veterinaria.com', '3794567890', 0),
('Ana Fernández', 'ana.fernandez@veterinaria.com', '3794891023', 0),
('Carlos Pérez', 'carlos.perez@veterinaria.com', '3794678901', 0),
('Lucía Ramírez', 'lucia.ramirez@veterinaria.com', '3794123987', 0),
('Joaquín Torres', 'joaquin.torres@veterinaria.com', '3794223344', 0),
('Paula Domínguez', 'paula.dominguez@veterinaria.com', '3794901123', 0),
('Sofía Benítez', 'sofia.benitez@veterinaria.com', '3794789456', 0),
('Matías Ríos', 'matias.rios@veterinaria.com', '3794332110', 0),
('Valentina Herrera', 'valentina.herrera@veterinaria.com', '3794556778', 0),
('Federico Acuña', 'federico.acuna@veterinaria.com', '3794773344', 0),
('Camila Duarte', 'camila.duarte@veterinaria.com', '3794665544', 0),
('Julieta Cabrera', 'julieta.cabrera@veterinaria.com', '3794212456', 0),
('Martín Gómez', 'martin.gomez@veterinaria.com', '3794001122', 0),
('Florencia Ayala', 'florencia.ayala@veterinaria.com', '3794552233', 0),
('Agustín Molina', 'agustin.molina@veterinaria.com', '3794223345', 0),
('Josefina Silva', 'josefina.silva@veterinaria.com', '3794002233', 0),
('Franco Ortiz', 'franco.ortiz@veterinaria.com', '3794552211', 0),
('Micaela Navarro', 'micaela.navarro@veterinaria.com', '3794669988', 0),
('Tomás Figueroa', 'tomas.figueroa@veterinaria.com', '3794789001', 0),
('Ramiro Cáceres', 'ramiro.caceres@veterinaria.com', '3794011223', 0),
('Laura Giménez', 'laura.gimenez@veterinaria.com', '3794322123', 0),
('Victoria Cabrera', 'victoria.cabrera@veterinaria.com', '3794567345', 0),
('Lautaro Sánchez', 'lautaro.sanchez@veterinaria.com', '3794778890', 0),
('Malena Medina', 'malena.medina@veterinaria.com', '3794004567', 0),
('Rocío López', 'rocio.lopez@veterinaria.com', '3794998899', 0),
('Gonzalo Romero', 'gonzalo.romero@veterinaria.com', '3794556677', 0),
('Milagros Vega', 'milagros.vega@veterinaria.com', '3794890112', 0),
('Bruno Correa', 'bruno.correa@veterinaria.com', '3794789011', 0),
('Nicolás Leiva', 'nicolas.leiva@veterinaria.com', '3794009988', 0),
('Valeria Quiroga', 'valeria.quiroga@veterinaria.com', '3794663344', 0),
('Santiago Flores', 'santiago.flores@veterinaria.com', '3794229900', 0),
('Ariana Torres', 'ariana.torres@veterinaria.com', '3794770012', 0),
('Martina Duarte', 'martina.duarte@veterinaria.com', '3794338999', 0),
('Ezequiel Vera', 'ezequiel.vera@veterinaria.com', '3794780900', 0),
('Carolina Soto', 'carolina.soto@veterinaria.com', '3794007766', 0),
('Benjamín Navarro', 'benjamin.navarro@veterinaria.com', '3794222233', 0),
('Gabriela Ruiz', 'gabriela.ruiz@veterinaria.com', '3794661122', 0),
('Lucas Godoy', 'lucas.godoy@veterinaria.com', '3794899988', 0),
('Melina Duarte', 'melina.duarte@veterinaria.com', '3794553322', 0),
('Julio Torres', 'julio.torres@veterinaria.com', '3794220044', 0),
('Cecilia Ríos', 'cecilia.rios@veterinaria.com', '3794335544', 0),
('Esteban Blanco', 'esteban.blanco@veterinaria.com', '3794789988', 0),
('Nadia Acosta', 'nadia.acosta@veterinaria.com', '3794666677', 0),
('Kevin Maidana', 'kevin.maidana@veterinaria.com', '3794779900', 0),
('Ivana Gómez', 'ivana.gomez@veterinaria.com', '3794223444', 0),
('Luciano Morales', 'luciano.morales@veterinaria.com', '3794556678', 0),
('Bianca Torres', 'bianca.torres@veterinaria.com', '3794990022', 0),
('Jazmín Vázquez', 'jazmin.vazquez@veterinaria.com', '3794225566', 0),
('Emanuel Ramírez', 'emanuel.ramirez@veterinaria.com', '3794784567', 0);
GO
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- ==================================================
-- VETERINARIOS (20) – inserta uniendo por nombre de especialidad
-- Requiere que la tabla Veterinario_especialidad ya tenga cargados
-- los nombres usados abajo (Cirugía General, Dermatología, etc.).
-- ==================================================
INSERT INTO Veterinario (
    nombre_apellido_veterinario, correo_veterinario, matricula, baja, id_veterinario_especialidad
)
SELECT v.nombre, v.correo, v.matricula, 0, ve.id_veterinario_especialidad
FROM (VALUES
('Dr. Adrián Salinas',      'adrian.salinas@vetpro.com',       'MV-2025-0001', 'Cirugía General'),
('Dra. Belén Álvarez',      'belen.alvarez@vetpro.com',        'MV-2025-0002', 'Dermatología'),
('Dr. Cristian Maidana',    'cristian.maidana@vetpro.com',     'MV-2025-0003', 'Oftalmología'),
('Dra. Daniela Ojeda',      'daniela.ojeda@vetpro.com',        'MV-2025-0004', 'Cardiología'),
('Dr. Esteban Marchi',      'esteban.marchi@vetpro.com',       'MV-2025-0005', 'Neurología'),
('Dra. Florencia Russo',    'florencia.russo@vetpro.com',      'MV-2025-0006', 'Medicina Interna'),
('Dr. Gastón Paredes',      'gaston.paredes@vetpro.com',       'MV-2025-0007', 'Odontología'),
('Dra. Helena Romero',      'helena.romero@vetpro.com',        'MV-2025-0008', 'Oncología'),
('Dr. Iván Pereyra',        'ivan.pereyra@vetpro.com',         'MV-2025-0009', 'Traumatología'),
('Dra. Julieta Rivas',      'julieta.rivas@vetpro.com',        'MV-2025-0010', 'Rehabilitación'),
('Dr. Kevin Duarte',        'kevin.duarte@vetpro.com',         'MV-2025-0011', 'Cirugía General'),
('Dra. Lucía Méndez',       'lucia.mendez@vetpro.com',         'MV-2025-0012', 'Dermatología'),
('Dr. Marcos Varela',       'marcos.varela@vetpro.com',        'MV-2025-0013', 'Oftalmología'),
('Dra. Nadia Sosa',         'nadia.sosa@vetpro.com',           'MV-2025-0014', 'Cardiología'),
('Dr. Octavio Godoy',       'octavio.godoy@vetpro.com',        'MV-2025-0015', 'Neurología'),
('Dra. Paula Benítez',      'paula.benitez@vetpro.com',        'MV-2025-0016', 'Medicina Interna'),
('Dr. Ramiro Acosta',       'ramiro.acosta@vetpro.com',        'MV-2025-0017', 'Odontología'),
('Dra. Sofía Quiroga',      'sofia.quiroga@vetpro.com',        'MV-2025-0018', 'Oncología'),
('Dr. Tomás Ferreyra',      'tomas.ferreyra@vetpro.com',       'MV-2025-0019', 'Traumatología'),
('Dra. Valentina Cabrera',  'valentina.cabrera@vetpro.com',    'MV-2025-0020', 'Rehabilitación')
) AS v(nombre, correo, matricula, especialidad)
JOIN Veterinario_especialidad ve
  ON ve.especialidad = v.especialidad;
GO

-- Verificacion:

--SELECT COUNT(*) AS veterinarios_cargados FROM Veterinario;
--SELECT TOP 5 * FROM Veterinario ORDER BY id_veterinario DESC;

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------

  -- ==================================================
-- CLIENTES (100 registros aleatorios y realistas)
-- ==================================================
INSERT INTO Cliente (nombre_apellido_cliente, dni_cliente, telefono_cliente, correo_cliente, domicilio_cliente, baja)
VALUES
('Lucas Fernández', '40823145', '3794512301', 'lucas.fernandez@mail.com', 'Belgrano 450', 0),
('Camila González', '39584122', '3794556743', 'camila.gonzalez@mail.com', 'San Martín 1200', 0),
('Martín López', '40123988', '3794567821', 'martin.lopez@mail.com', 'Lavalle 300', 0),
('Valentina Díaz', '42033456', '3794678123', 'valentina.diaz@mail.com', 'Rivadavia 1120', 0),
('Santiago Ramírez', '38764321', '3794987123', 'santiago.ramirez@mail.com', 'España 890', 0),
('Micaela Torres', '39458762', '3794221345', 'micaela.torres@mail.com', '9 de Julio 210', 0),
('Joaquín Herrera', '40561234', '3794559890', 'joaquin.herrera@mail.com', 'Urquiza 970', 0),
('Florencia Medina', '41567890', '3794890023', 'florencia.medina@mail.com', 'Belgrano 770', 0),
('Tomás Cabrera', '41256733', '3794234567', 'tomas.cabrera@mail.com', 'Catamarca 650', 0),
('Agustina Morales', '39875412', '3794778890', 'agustina.morales@mail.com', 'Junín 540', 0),
('Franco Romero', '40124567', '3794789988', 'franco.romero@mail.com', 'Ayacucho 340', 0),
('Milagros Navarro', '40778890', '3794223311', 'milagros.navarro@mail.com', 'Santa Fe 880', 0),
('Nicolás Sosa', '41333554', '3794332123', 'nicolas.sosa@mail.com', 'Mitre 1020', 0),
('Lucía Godoy', '39011234', '3794560011', 'lucia.godoy@mail.com', 'San Juan 440', 0),
('Juan Pérez', '40567789', '3794789001', 'juan.perez@mail.com', 'Corrientes 250', 0),
('Sofía Rivas', '39456782', '3794661122', 'sofia.rivas@mail.com', 'Buenos Aires 980', 0),
('Matías Álvarez', '40099871', '3794002244', 'matias.alvarez@mail.com', 'Lavalle 1234', 0),
('Carla Duarte', '40889900', '3794220099', 'carla.duarte@mail.com', 'Francia 650', 0),
('Federico Leiva', '39112233', '3794770011', 'federico.leiva@mail.com', 'San Lorenzo 410', 0),
('Paula Giménez', '42099811', '3794668890', 'paula.gimenez@mail.com', 'Colón 220', 0),
('Ramiro Ruiz', '41456782', '3794553344', 'ramiro.ruiz@mail.com', 'Catamarca 740', 0),
('Abril Cáceres', '40678901', '3794891133', 'abril.caceres@mail.com', 'La Rioja 320', 0),
('Ezequiel Acosta', '39899012', '3794662233', 'ezequiel.acosta@mail.com', 'Entre Ríos 550', 0),
('Josefina Flores', '40113344', '3794776677', 'josefina.flores@mail.com', 'Independencia 460', 0),
('Brenda Romero', '41777333', '3794009988', 'brenda.romero@mail.com', 'Pellegrini 600', 0),
('Gonzalo Vega', '39056788', '3794892200', 'gonzalo.vega@mail.com', 'Belgrano 480', 0),
('Antonella Soto', '40333456', '3794770022', 'antonella.soto@mail.com', 'Artigas 550', 0),
('Benjamín López', '41822100', '3794667744', 'benjamin.lopez@mail.com', 'Uruguay 700', 0),
('Martina Ferreira', '39982344', '3794224455', 'martina.ferreira@mail.com', 'Junín 890', 0),
('Emanuel Benítez', '40554433', '3794556677', 'emanuel.benitez@mail.com', 'Santa Fe 640', 0),
('Valeria Blanco', '41011223', '3794005678', 'valeria.blanco@mail.com', 'Sarmiento 330', 0),
('Jazmín Rodríguez', '39678890', '3794789000', 'jazmin.rodriguez@mail.com', 'Misiones 1020', 0),
('Sebastián Ortiz', '41900999', '3794552233', 'sebastian.ortiz@mail.com', 'Rawson 210', 0),
('Mariana Núñez', '39876554', '3794227788', 'mariana.nunez@mail.com', 'Urquiza 990', 0),
('Valentino López', '40455667', '3794897766', 'valentino.lopez@mail.com', 'San Martín 123', 0),
('Lourdes Torres', '40198765', '3794332110', 'lourdes.torres@mail.com', 'Rivadavia 220', 0),
('Ignacio Paredes', '39900987', '3794221144', 'ignacio.paredes@mail.com', '9 de Julio 880', 0),
('Camila Ruiz', '41222334', '3794663322', 'camila.ruiz@mail.com', 'Corrientes 340', 0),
('Nahuel Fernández', '41876544', '3794786655', 'nahuel.fernandez@mail.com', 'La Rioja 730', 0),
('Carolina Duarte', '39334322', '3794009987', 'carolina.duarte@mail.com', 'Belgrano 560', 0),
('Bruno Herrera', '40988776', '3794771100', 'bruno.herrera@mail.com', 'España 1010', 0),
('Malena Cabrera', '41788001', '3794222222', 'malena.cabrera@mail.com', 'Catamarca 310', 0),
('Tomás Medina', '40770012', '3794335555', 'tomas.medina@mail.com', 'Lavalle 870', 0),
('Nadia González', '39778811', '3794661123', 'nadia.gonzalez@mail.com', 'Colón 210', 0),
('Evelyn Díaz', '40109923', '3794899900', 'evelyn.diaz@mail.com', 'Ayacucho 540', 0),
('Pablo Benítez', '41444412', '3794556678', 'pablo.benitez@mail.com', 'Junín 480', 0),
('Julieta Herrera', '40076543', '3794667788', 'julieta.herrera@mail.com', 'Belgrano 420', 0),
('Ramiro Sánchez', '41922331', '3794778899', 'ramiro.sanchez@mail.com', 'San Juan 310', 0),
('Melina Vera', '39221133', '3794221199', 'melina.vera@mail.com', 'España 620', 0),
('Agustín Gómez', '39667755', '3794890099', 'agustin.gomez@mail.com', 'Rivadavia 450', 0),
('Ariana Ayala', '40876677', '3794785544', 'ariana.ayala@mail.com', 'Sarmiento 890', 0),
('Kevin Duarte', '40088990', '3794227788', 'kevin.duarte@mail.com', 'Pellegrini 220', 0),
('Catalina Ortiz', '40543322', '3794664455', 'catalina.ortiz@mail.com', 'Uruguay 510', 0);
GO
-- verificacion:
--SELECT COUNT(*) AS clientes_cargados FROM Cliente;
--SELECT TOP 5 * FROM Cliente ORDER BY id_cliente DESC;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- ==================================================
-- MASCOTAS (100 registros aleatorios)
-- ==================================================
INSERT INTO Mascota (nombre_mascota, especie, fecha_nac, sexo, raza, id_mascota_estado, id_cliente)
VALUES
('Luna', 'Perro', '2020-03-12', 'Hembra', 'Labrador Retriever', 1, 1),
('Rocky', 'Perro', '2019-11-03', 'Macho', 'Pastor Alemán', 1, 2),
('Milo', 'Gato', '2021-07-21', 'Macho', 'Siames', 2, 3),
('Olivia', 'Gato', '2018-09-10', 'Hembra', 'Persa', 1, 4),
('Toby', 'Perro', '2022-01-15', 'Macho', 'Golden Retriever', 3, 5),
('Mora', 'Perro', '2017-06-05', 'Hembra', 'Beagle', 1, 6),
('Simba', 'Gato', '2020-08-19', 'Macho', 'Bengalí', 1, 7),
('Nina', 'Gato', '2021-04-09', 'Hembra', 'Maine Coon', 1, 8),
('Zeus', 'Perro', '2016-10-30', 'Macho', 'Rottweiler', 2, 9),
('Lola', 'Perro', '2019-01-11', 'Hembra', 'Caniche', 1, 10),
('Coco', 'Ave', '2023-02-18', 'Macho', 'Cacatúa', 1, 11),
('Kiwi', 'Ave', '2022-11-22', 'Hembra', 'Periquito', 1, 12),
('Tango', 'Conejo', '2021-09-30', 'Macho', 'Enano Holandés', 1, 13),
('Nube', 'Gato', '2018-12-05', 'Hembra', 'Azul Ruso', 1, 14),
('Max', 'Perro', '2020-02-14', 'Macho', 'Bulldog Francés', 3, 15),
('Miel', 'Perro', '2019-08-28', 'Hembra', 'Cocker Spaniel', 1, 16),
('Lolo', 'Gato', '2021-03-15', 'Macho', 'Sphynx', 2, 17),
('Nala', 'Gato', '2020-12-01', 'Hembra', 'British Shorthair', 1, 18),
('Thor', 'Perro', '2017-09-07', 'Macho', 'Boxer', 2, 19),
('Kira', 'Perro', '2022-04-05', 'Hembra', 'Border Collie', 1, 20),
('Oreo', 'Conejo', '2021-06-10', 'Macho', 'Mini Lop', 1, 21),
('Mango', 'Ave', '2020-09-19', 'Macho', 'Canario', 1, 22),
('Cleo', 'Reptil', '2019-03-22', 'Hembra', 'Iguana Verde', 1, 23),
('Fiona', 'Perro', '2021-05-25', 'Hembra', 'Pug', 1, 24),
('Rex', 'Perro', '2018-07-08', 'Macho', 'Doberman', 2, 25),
('Misha', 'Gato', '2019-10-30', 'Hembra', 'Angora', 1, 26),
('Tommy', 'Perro', '2020-12-12', 'Macho', 'Dálmata', 3, 27),
('Kenia', 'Gato', '2017-04-02', 'Hembra', 'Calicó', 1, 28),
('Bobby', 'Perro', '2022-08-03', 'Macho', 'Schnauzer Mini', 1, 29),
('Pepa', 'Ave', '2021-11-29', 'Hembra', 'Agapornis', 1, 30),
('Roco', 'Perro', '2020-01-09', 'Macho', 'Bulldog Inglés', 1, 31),
('Nina', 'Perro', '2019-02-10', 'Hembra', 'Shih Tzu', 1, 32),
('Timon', 'Gato', '2018-03-22', 'Macho', 'Himalayo', 2, 33),
('Dory', 'Pez', '2022-07-05', 'Hembra', 'Betta', 1, 34),
('Pipo', 'Conejo', '2020-10-11', 'Macho', 'Cabeza de León', 1, 35),
('Chispa', 'Perro', '2021-09-15', 'Hembra', 'Jack Russell', 1, 36),
('Momo', 'Gato', '2017-08-03', 'Macho', 'Siberiano', 1, 37),
('Kira', 'Perro', '2020-05-23', 'Hembra', 'Husky Siberiano', 1, 38),
('Duke', 'Perro', '2019-06-20', 'Macho', 'San Bernardo', 2, 39),
('Nina', 'Ave', '2021-03-19', 'Hembra', 'Canario', 1, 40),
('Luz', 'Perro', '2020-09-01', 'Hembra', 'Collie', 1, 41),
('Ares', 'Perro', '2018-02-02', 'Macho', 'Pitbull Terrier', 2, 42),
('Mimi', 'Gato', '2021-01-01', 'Hembra', 'Abisinio', 1, 43),
('Tango', 'Perro', '2020-03-23', 'Macho', 'Poodle', 1, 44),
('Canela', 'Perro', '2019-04-24', 'Hembra', 'Yorkshire Terrier', 1, 45),
('Bobby', 'Gato', '2018-05-25', 'Macho', 'Persa Blanco', 1, 46),
('Daisy', 'Perro', '2019-07-26', 'Hembra', 'Labrador', 1, 47),
('Tito', 'Perro', '2020-08-27', 'Macho', 'Pastor Belga', 2, 48),
('Luna', 'Gato', '2021-09-28', 'Hembra', 'Siames', 1, 49),
('Simón', 'Gato', '2017-10-29', 'Macho', 'Común Europeo', 1, 50),
('Nala', 'Gato', '2022-11-30', 'Hembra', 'Persa Gris', 1, 51),
('Rocky', 'Perro', '2018-01-15', 'Macho', 'Bulldog Inglés', 1, 52),
('Mora', 'Gato', '2020-02-18', 'Hembra', 'Maine Coon', 1, 53),
('Max', 'Perro', '2017-03-19', 'Macho', 'Beagle', 2, 54),
('Coco', 'Perro', '2019-04-22', 'Macho', 'Golden Retriever', 1, 55),
('Mimi', 'Gato', '2020-05-25', 'Hembra', 'Siamés', 1, 56),
('Zeus', 'Perro', '2021-06-28', 'Macho', 'Doberman', 1, 57),
('Tina', 'Perro', '2022-07-31', 'Hembra', 'Cocker', 1, 58),
('Rayo', 'Perro', '2020-08-02', 'Macho', 'Border Collie', 2, 59),
('Kira', 'Perro', '2021-09-05', 'Hembra', 'Husky', 1, 60),
('Rocco', 'Perro', '2020-10-08', 'Macho', 'Bulldog Francés', 1, 61),
('Olivia', 'Gato', '2021-11-11', 'Hembra', 'Angora', 1, 62),
('Simba', 'Gato', '2019-12-14', 'Macho', 'Siberiano', 1, 63),
('Nino', 'Ave', '2020-01-17', 'Macho', 'Canario', 1, 64),
('Milo', 'Perro', '2021-02-20', 'Macho', 'Caniche', 1, 65),
('Kenia', 'Gato', '2022-03-23', 'Hembra', 'Sphynx', 1, 66),
('Beto', 'Conejo', '2021-04-26', 'Macho', 'Mini Rex', 1, 67),
('Mora', 'Perro', '2020-05-29', 'Hembra', 'Pomerania', 1, 68),
('Choco', 'Perro', '2019-06-01', 'Macho', 'Labrador', 1, 69),
('Bali', 'Ave', '2022-07-04', 'Hembra', 'Periquito', 1, 70),
('Ringo', 'Perro', '2018-08-07', 'Macho', 'Boxer', 2, 71),
('Cleo', 'Reptil', '2021-09-10', 'Hembra', 'Gecko Leopardo', 1, 72),
('Luna', 'Perro', '2019-10-13', 'Hembra', 'Chihuahua', 1, 73),
('Thor', 'Perro', '2020-11-16', 'Macho', 'Husky Siberiano', 1, 74),
('Pipo', 'Gato', '2021-12-19', 'Macho', 'Común Doméstico', 1, 75),
('Lila', 'Perro', '2022-01-22', 'Hembra', 'Caniche Toy', 1, 76),
('Ciro', 'Gato', '2019-02-25', 'Macho', 'Bengalí', 2, 77),
('Mimi', 'Gato', '2020-03-28', 'Hembra', 'Persa Blanco', 1, 78),
('Zeus', 'Perro', '2021-04-01', 'Macho', 'Pastor Alemán', 1, 79),
('Nina', 'Perro', '2022-05-04', 'Hembra', 'Beagle', 1, 80),
('Simón', 'Gato', '2021-06-07', 'Macho', 'Azul Ruso', 1, 81),
('Kira', 'Gato', '2020-07-10', 'Hembra', 'Siames', 1, 82),
('Rocky', 'Perro', '2019-08-13', 'Macho', 'Labrador', 1, 83),
('Mora', 'Perro', '2018-09-16', 'Hembra', 'Cocker Spaniel', 1, 84),
('Simba', 'Gato', '2020-10-19', 'Macho', 'Siberiano', 1, 85),
('Nala', 'Gato', '2021-11-22', 'Hembra', 'Persa', 1, 86),
('Coco', 'Perro', '2020-12-25', 'Macho', 'Caniche', 1, 87),
('Mila', 'Perro', '2021-01-28', 'Hembra', 'Labrador', 1, 88),
('Toby', 'Perro', '2022-02-01', 'Macho', 'Beagle', 1, 89),
('Luna', 'Gato', '2021-03-04', 'Hembra', 'Maine Coon', 1, 90),
('Zeus', 'Perro', '2020-04-07', 'Macho', 'Rottweiler', 1, 91),
('Olivia', 'Gato', '2021-05-10', 'Hembra', 'Sphynx', 1, 92),
('Thor', 'Perro', '2019-06-13', 'Macho', 'Boxer', 1, 93),
('Nina', 'Gato', '2020-07-16', 'Hembra', 'Siames', 1, 94),
('Rocky', 'Perro', '2021-08-19', 'Macho', 'Labrador', 1, 95),
('Milo', 'Gato', '2022-09-22', 'Macho', 'Persa', 1, 96),
('Kira', 'Perro', '2021-10-25', 'Hembra', 'Husky', 1, 97),
('Simba', 'Gato', '2020-11-28', 'Macho', 'Bengalí', 1, 98),
('Mora', 'Perro', '2019-12-31', 'Hembra', 'Cocker', 1, 99),
('Zeus', 'Perro', '2021-01-01', 'Macho', 'Labrador', 1, 100);
GO

-- Verificacion :
--SELECT COUNT(*) AS mascotas_cargadas FROM Mascota;
--SELECT TOP 5 * FROM Mascota ORDER BY id_mascota DESC;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- ADMIN
INSERT INTO Usuario (nombre_usuario, contraseña, id_rol, id_empleado, id_veterinario, activo) VALUES
('admin', 'Admin@2025', 1, 1, NULL, 1);
GO


-- RECEPCIONISTAS (empleados 2–11)
INSERT INTO Usuario (nombre_usuario, contraseña, id_rol, id_empleado, id_veterinario, activo) VALUES
('mlopez',        'Recep@123', 2,  2, NULL, 1),   -- María López
('jgonzalez',     'Recep@123', 2,  3, NULL, 1),   -- Juan González
('afernandez',    'Recep@123', 2,  4, NULL, 1),   -- Ana Fernández
('cperez',        'Recep@123', 2,  5, NULL, 1),   -- Carlos Pérez
('lramirez',      'Recep@123', 2,  6, NULL, 1),   -- Lucía Ramírez
('jtorres',       'Recep@123', 2,  7, NULL, 1),   -- Joaquín Torres
('pdominguez',    'Recep@123', 2,  8, NULL, 1),   -- Paula Domínguez
('sbenitez',      'Recep@123', 2,  9, NULL, 1),   -- Sofía Benítez
('mrios',         'Recep@123', 2, 10, NULL, 1),   -- Matías Ríos
('vherrera',      'Recep@123', 2, 11, NULL, 1);   -- Valentina Herrera
GO


-- VETERINARIOS (id_veterinario 1–20)
INSERT INTO Usuario (nombre_usuario, contraseña, id_rol, id_empleado, id_veterinario, activo) VALUES
('asalinas',      'Vet@123', 3, NULL,  1, 1),  -- Dr. Adrián Salinas
('balvarez',      'Vet@123', 3, NULL,  2, 1),  -- Dra. Belén Álvarez
('cmaidana',      'Vet@123', 3, NULL,  3, 1),  -- Dr. Cristian Maidana
('dojeda',        'Vet@123', 3, NULL,  4, 1),  -- Dra. Daniela Ojeda
('emarchi',       'Vet@123', 3, NULL,  5, 1),  -- Dr. Esteban Marchi
('frusso',        'Vet@123', 3, NULL,  6, 1),  -- Dra. Florencia Russo
('gparedes',      'Vet@123', 3, NULL,  7, 1),  -- Dr. Gastón Paredes
('hromero',       'Vet@123', 3, NULL,  8, 1),  -- Dra. Helena Romero
('ipereyra',      'Vet@123', 3, NULL,  9, 1),  -- Dr. Iván Pereyra
('jrivas',        'Vet@123', 3, NULL, 10, 1),  -- Dra. Julieta Rivas
('kduarte',       'Vet@123', 3, NULL, 11, 1),  -- Dr. Kevin Duarte
('lmendez',       'Vet@123', 3, NULL, 12, 1),  -- Dra. Lucía Méndez
('mvarela',       'Vet@123', 3, NULL, 13, 1),  -- Dr. Marcos Varela
('nsosa',         'Vet@123', 3, NULL, 14, 1),  -- Dra. Nadia Sosa
('ogodoy',        'Vet@123', 3, NULL, 15, 1),  -- Dr. Octavio Godoy
('pbenitez',      'Vet@123', 3, NULL, 16, 1),  -- Dra. Paula Benítez
('racosta',       'Vet@123', 3, NULL, 17, 1),  -- Dr. Ramiro Acosta
('squiroga',      'Vet@123', 3, NULL, 18, 1),  -- Dra. Sofía Quiroga
('tferreyra',     'Vet@123', 3, NULL, 19, 1),  -- Dr. Tomás Ferreyra
('vcabrera_vet',  'Vet@123', 3, NULL, 20, 1);  -- Dra. Valentina Cabrera
GO


-- PERSONAL (empleados 12–30)
INSERT INTO Usuario (nombre_usuario, contraseña, id_rol, id_empleado, id_veterinario, activo) VALUES
('jcabrera',     'Emp@123', 2, 12, NULL, 1),  -- Julieta Cabrera
('mgomez',       'Emp@123', 2, 13, NULL, 1),  -- Martín Gómez
('fayala',       'Emp@123', 2, 14, NULL, 1),  -- Florencia Ayala
('amolina',      'Emp@123', 2, 15, NULL, 1),  -- Agustín Molina
('jsilva',       'Emp@123', 2, 16, NULL, 1),  -- Josefina Silva
('fortiz',       'Emp@123', 2, 17, NULL, 1),  -- Franco Ortiz
('mnavarro',     'Emp@123', 2, 18, NULL, 1),  -- Micaela Navarro
('tfigueroa',    'Emp@123', 2, 19, NULL, 1),  -- Tomás Figueroa
('rcaceres',     'Emp@123', 2, 20, NULL, 1),  -- Ramiro Cáceres
('lgimenez',     'Emp@123', 2, 21, NULL, 1),  -- Laura Giménez
('vcabrera',     'Emp@123', 2, 22, NULL, 1),  -- Victoria Cabrera
('lsanchez',     'Emp@123', 2, 23, NULL, 1),  -- Lautaro Sánchez
('mmedina',      'Emp@123', 2, 24, NULL, 1),  -- Malena Medina
('rlopez',       'Emp@123', 2, 25, NULL, 1),  -- Rocío López
('gromero',      'Emp@123', 2, 26, NULL, 1),  -- Gonzalo Romero
('mvega',        'Emp@123', 2, 27, NULL, 1),  -- Milagros Vega
('bcorrea',      'Emp@123', 2, 28, NULL, 1),  -- Bruno Correa
('nleiva',       'Emp@123', 2, 29, NULL, 1),  -- Nicolás Leiva
('vquiroga',     'Emp@123', 2, 30, NULL, 1);  -- Valeria Quiroga
GO


-- Verificacion:
--SELECT COUNT(*) AS total_usuarios FROM Usuario;
--SELECT nombre_usuario, id_rol, id_empleado, id_veterinario
--FROM Usuario
--ORDER BY id_usuario;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- ==================================================
-- TURNOS (180 registros realistas y directos)
-- ==================================================
INSERT INTO Turno (fecha_turno, id_turno_estado, id_usuario, id_veterinario, id_mascota) VALUES
('2025-01-05', 2, 2, 1, 1),
('2025-01-06', 1, 3, 2, 2),
('2025-01-07', 4, 4, 3, 3),
('2025-01-08', 2, 5, 4, 4),
('2025-01-09', 1, 6, 5, 5),
('2025-01-10', 3, 7, 6, 6),
('2025-01-11', 4, 8, 7, 7),
('2025-01-12', 2, 9, 8, 8),
('2025-01-13', 1, 10, 9, 9),
('2025-01-14', 2, 11, 10, 10),
('2025-01-15', 4, 2, 11, 11),
('2025-01-16', 1, 3, 12, 12),
('2025-01-17', 2, 4, 13, 13),
('2025-01-18', 5, 5, 14, 14),
('2025-01-19', 2, 6, 15, 15),
('2025-01-20', 4, 7, 16, 16),
('2025-01-21', 2, 8, 17, 17),
('2025-01-22', 1, 9, 18, 18),
('2025-01-23', 2, 10, 19, 19),
('2025-01-24', 4, 11, 20, 20),
('2025-01-25', 2, 2, 1, 21),
('2025-01-26', 1, 3, 2, 22),
('2025-01-27', 2, 4, 3, 23),
('2025-01-28', 4, 5, 4, 24),
('2025-01-29', 1, 6, 5, 25),
('2025-01-30', 2, 7, 6, 26),
('2025-02-01', 4, 8, 7, 27),
('2025-02-02', 1, 9, 8, 28),
('2025-02-03', 3, 10, 9, 29),
('2025-02-04', 4, 11, 10, 30),
('2025-02-05', 2, 2, 11, 31),
('2025-02-06', 1, 3, 12, 32),
('2025-02-07', 4, 4, 13, 33),
('2025-02-08', 2, 5, 14, 34),
('2025-02-09', 4, 6, 15, 35),
('2025-02-10', 3, 7, 16, 36),
('2025-02-11', 4, 8, 17, 37),
('2025-02-12', 1, 9, 18, 38),
('2025-02-13', 4, 10, 19, 39),
('2025-02-14', 2, 11, 20, 40),
('2025-02-15', 1, 2, 1, 41),
('2025-02-16', 4, 3, 2, 42),
('2025-02-17', 2, 4, 3, 43),
('2025-02-18', 4, 5, 4, 44),
('2025-02-19', 1, 6, 5, 45),
('2025-02-20', 2, 7, 6, 46),
('2025-02-21', 4, 8, 7, 47),
('2025-02-22', 1, 9, 8, 48),
('2025-02-23', 4, 10, 9, 49),
('2025-02-24', 2, 11, 10, 50),
('2025-02-25', 1, 2, 11, 51),
('2025-02-26', 2, 3, 12, 52),
('2025-02-27', 3, 4, 13, 53),
('2025-02-28', 4, 5, 14, 54),
('2025-03-01', 2, 6, 15, 55),
('2025-03-02', 1, 7, 16, 56),
('2025-03-03', 4, 8, 17, 57),
('2025-03-04', 2, 9, 18, 58),
('2025-03-05', 4, 10, 19, 59),
('2025-03-06', 1, 11, 20, 60),
('2025-03-07', 4, 2, 1, 61),
('2025-03-08', 1, 3, 2, 62),
('2025-03-09', 2, 4, 3, 63),
('2025-03-10', 4, 5, 4, 64),
('2025-03-11', 1, 6, 5, 65),
('2025-03-12', 2, 7, 6, 66),
('2025-03-13', 4, 8, 7, 67),
('2025-03-14', 1, 9, 8, 68),
('2025-03-15', 4, 10, 9, 69),
('2025-03-16', 2, 11, 10, 70),
('2025-03-17', 1, 2, 11, 71),
('2025-03-18', 4, 3, 12, 72),
('2025-03-19', 1, 4, 13, 73),
('2025-03-20', 2, 5, 14, 74),
('2025-03-21', 4, 6, 15, 75),
('2025-03-22', 1, 7, 16, 76),
('2025-03-23', 4, 8, 17, 77),
('2025-03-24', 2, 9, 18, 78),
('2025-03-25', 4, 10, 19, 79),
('2025-03-26', 1, 11, 20, 80),
('2025-03-27', 4, 2, 1, 81),
('2025-03-28', 2, 3, 2, 82),
('2025-03-29', 4, 4, 3, 83),
('2025-03-30', 1, 5, 4, 84),
('2025-03-31', 4, 6, 5, 85),
('2025-04-01', 2, 7, 6, 86),
('2025-04-02', 4, 8, 7, 87),
('2025-04-03', 1, 9, 8, 88),
('2025-04-04', 4, 10, 9, 89),
('2025-04-05', 2, 11, 10, 90),
('2025-04-06', 1, 2, 11, 91),
('2025-04-07', 4, 3, 12, 92),
('2025-04-08', 2, 4, 13, 93),
('2025-04-09', 4, 5, 14, 94),
('2025-04-10', 1, 6, 15, 95),
('2025-04-11', 4, 7, 16, 96),
('2025-04-12', 2, 8, 17, 97),
('2025-04-13', 4, 9, 18, 98),
('2025-04-14', 1, 10, 19, 99),
('2025-04-15', 4, 11, 20, 100),
('2025-04-16', 2, 2, 1, 101),
('2025-04-17', 1, 3, 2, 102),
('2025-04-18', 2, 4, 3, 103),
('2025-04-19', 4, 5, 4, 104),
('2025-04-20', 1, 6, 5, 105),
('2025-04-21', 2, 7, 6, 106),
('2025-04-22', 4, 8, 7, 107),
('2025-04-23', 1, 9, 8, 108),
('2025-04-24', 2, 10, 9, 109),
('2025-04-25', 4, 11, 10, 110),
('2025-04-26', 1, 2, 11, 111),
('2025-04-27', 4, 3, 12, 112),
('2025-04-28', 1, 4, 13, 113),
('2025-04-29', 2, 5, 14, 114),
('2025-04-30', 4, 6, 15, 115),
('2025-05-01', 1, 7, 16, 116),
('2025-05-02', 4, 8, 17, 117),
('2025-05-03', 2, 9, 18, 118),
('2025-05-04', 4, 10, 19, 119),
('2025-05-05', 1, 11, 20, 120),
('2025-05-06', 4, 2, 1, 5),
('2025-05-07', 2, 3, 2, 10),
('2025-05-08', 4, 4, 3, 15),
('2025-05-09', 1, 5, 4, 20),
('2025-05-10', 4, 6, 5, 25),
('2025-05-11', 2, 7, 6, 30),
('2025-05-12', 4, 8, 7, 35),
('2025-05-13', 1, 9, 8, 40),
('2025-05-14', 4, 10, 9, 45),
('2025-05-15', 2, 11, 10, 50),
('2025-05-16', 4, 2, 11, 55),
('2025-05-17', 1, 3, 12, 60),
('2025-05-18', 4, 4, 13, 65),
('2025-05-19', 2, 5, 14, 70),
('2025-05-20', 4, 6, 15, 75),
('2025-05-21', 1, 7, 16, 80),
('2025-05-22', 4, 8, 17, 85),
('2025-05-23', 2, 9, 18, 90),
('2025-05-24', 4, 10, 19, 95),
('2025-05-25', 1, 11, 20, 100),
('2025-05-26', 2, 2, 1, 101),
('2025-05-27', 4, 3, 2, 102),
('2025-05-28', 1, 4, 3, 103),
('2025-05-29', 4, 5, 4, 104),
('2025-05-30', 2, 6, 5, 105),
('2025-06-01', 4, 7, 6, 106),
('2025-06-02', 1, 8, 7, 107),
('2025-06-03', 4, 9, 8, 108),
('2025-06-04', 2, 10, 9, 109),
('2025-06-05', 4, 11, 10, 110),
('2025-06-06', 1, 2, 11, 111),
('2025-06-07', 4, 3, 12, 112),
('2025-06-08', 1, 4, 13, 113),
('2025-06-09', 2, 5, 14, 114),
('2025-06-10', 4, 6, 15, 115),
('2025-06-11', 1, 7, 16, 116),
('2025-06-12', 4, 8, 17, 117),
('2025-06-13', 2, 9, 18, 118),
('2025-06-14', 4, 10, 19, 119),
('2025-06-15', 1, 11, 20, 120),
('2025-06-16', 4, 2, 1, 25),
('2025-06-17', 2, 3, 2, 26),
('2025-06-18', 4, 4, 3, 27),
('2025-06-19', 1, 5, 4, 28),
('2025-06-20', 4, 6, 5, 29),
('2025-06-21', 2, 7, 6, 30),
('2025-06-22', 4, 8, 7, 31),
('2025-06-23', 1, 9, 8, 32),
('2025-06-24', 4, 10, 9, 33),
('2025-06-25', 2, 11, 10, 34),
('2025-06-26', 1, 2, 11, 35),
('2025-06-27', 4, 3, 12, 36),
('2025-06-28', 2, 4, 13, 37);
GO
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- ==================================================
-- ATENCIONES (90 registros reales)
-- ==================================================
GO
INSERT INTO Atencion (fecha_atencion, observacion, diagnostico, id_turno) VALUES
('2025-01-07', 'Consulta de control general. Paciente estable.', 'Sin patologías detectadas.', 3),
('2025-01-11', 'Dolor abdominal leve. Se indica ayuno y control.', 'Gastroenteritis leve.', 7),
('2025-01-20', 'Vacunación anual aplicada sin complicaciones.', 'Vacunación antirrábica.', 16),
('2025-01-24', 'Chequeo postoperatorio. Herida cicatrizando bien.', 'Post cirugía canina.', 20),
('2025-01-28', 'Consulta por pérdida de apetito.', 'Gastritis leve.', 24),
('2025-02-01', 'Control de peso y estado general.', 'Sobrepeso leve.', 27),
('2025-02-04', 'Revisión dental. Sarro moderado.', 'Higiene bucal deficiente.', 30),
('2025-02-07', 'Dermatitis localizada. Tratamiento tópico.', 'Alergia por contacto.', 33),
('2025-02-10', 'Chequeo anual. Todo dentro de parámetros normales.', 'Animal sano.', 36),
('2025-02-14', 'Corte en pata posterior. Se realiza curación y vendaje.', 'Herida superficial.', 39),
('2025-02-18', 'Castración controlada. Buena recuperación.', 'Post operatorio exitoso.', 43),
('2025-02-21', 'Consulta por tos frecuente.', 'Tos de las perreras.', 46),
('2025-02-23', 'Control de temperatura. Normal.', 'Sin fiebre.', 48),
('2025-02-24', 'Revisión por caída. Se descarta fractura.', 'Contusión leve.', 49),
('2025-02-28', 'Limpieza de oídos realizada.', 'Otitis externa resuelta.', 53),
('2025-03-03', 'Chequeo general felino. Todo normal.', 'Sin hallazgos.', 56),
('2025-03-05', 'Tratamiento antiparasitario aplicado.', 'Desparasitación interna.', 58),
('2025-03-07', 'Herida infectada. Se realiza limpieza y antibiótico.', 'Infección cutánea.', 60),
('2025-03-10', 'Control de vacunación. Aplicada triple felina.', 'Vacunación felina completa.', 63),
('2025-03-13', 'Control de peso post dieta. Avance positivo.', 'Obesidad en control.', 66),
('2025-03-15', 'Chequeo oftalmológico.', 'Conjuntivitis leve.', 68),
('2025-03-17', 'Curación de herida superficial en oreja.', 'Lesión menor.', 71),
('2025-03-20', 'Vacunación completa aplicada.', 'Calendario al día.', 74),
('2025-03-23', 'Chequeo geriátrico. Signos de artritis.', 'Artrosis leve.', 77),
('2025-03-25', 'Tratamiento dental.', 'Extracción de pieza dañada.', 79),
('2025-03-27', 'Control de temperatura y apetito.', 'Leve fiebre transitoria.', 81),
('2025-03-30', 'Consulta por diarrea leve.', 'Indigestión.', 84),
('2025-04-01', 'Revisión postvacunación. Todo correcto.', 'Sin efectos adversos.', 87),
('2025-04-04', 'Herida superficial en pata delantera. Curación.', 'Corte leve.', 90),
('2025-04-07', 'Consulta por picazón excesiva.', 'Dermatitis alérgica.', 93),
('2025-04-10', 'Control post desparasitación.', 'Normal.', 96),
('2025-04-13', 'Consulta por vómitos ocasionales.', 'Gastritis aguda.', 99),
('2025-04-15', 'Chequeo general. Se observa buena salud.', 'Sin observaciones.', 101),
('2025-04-19', 'Limpieza dental profunda.', 'Placa bacteriana.', 104),
('2025-04-22', 'Vacunación aplicada sin reacciones.', 'Vacuna anual completa.', 107),
('2025-04-25', 'Control de peso. Dieta recomendada.', 'Sobrepeso moderado.', 110),
('2025-04-28', 'Herida en cola. Curación y antibiótico.', 'Lesión menor.', 113),
('2025-05-01', 'Chequeo de cachorro. Primeras vacunas.', 'Inicio plan sanitario.', 116),
('2025-05-03', 'Consulta por cojera leve.', 'Esguince.', 118),
('2025-05-05', 'Control de recuperación. En mejora.', 'Tratamiento efectivo.', 120),
('2025-05-08', 'Vacunación refuerzo. Sin complicaciones.', 'Esquema completo.', 124),
('2025-05-10', 'Consulta por tos seca.', 'Resfrío leve.', 126),
('2025-05-12', 'Control de heridas. Buena cicatrización.', 'Post operatorio controlado.', 128),
('2025-05-14', 'Chequeo general de hembra gestante.', 'Gestación normal.', 130),
('2025-05-17', 'Vacunación antirrábica aplicada.', 'Esquema al día.', 133),
('2025-05-19', 'Limpieza dental de rutina.', 'Sin patologías.', 135),
('2025-05-22', 'Control de peso y pulgas.', 'Aplicado antiparasitario.', 137),
('2025-05-25', 'Consulta por picazón persistente.', 'Alergia estacional.', 139),
('2025-05-27', 'Vacuna aplicada sin efectos secundarios.', 'Normal.', 141),
('2025-05-30', 'Chequeo anual general.', 'Animal sano.', 144),
('2025-06-01', 'Consulta por vómitos.', 'Indigestión.', 146),
('2025-06-03', 'Control de sutura. Buena evolución.', 'Recuperación favorable.', 148),
('2025-06-05', 'Control de temperatura. Fiebre leve.', 'Infección respiratoria.', 150),
('2025-06-07', 'Revisión post operatoria.', 'Correcta cicatrización.', 152),
('2025-06-09', 'Consulta general de control.', 'Sin observaciones.', 154),
('2025-06-11', 'Tratamiento antiparasitario.', 'Desparasitación externa.', 156),
('2025-06-13', 'Chequeo dental.', 'Encías inflamadas.', 158),
('2025-06-15', 'Consulta por tos seca.', 'Traqueítis leve.', 160),
('2025-06-17', 'Revisión ocular.', 'Sin anomalías.', 162),
('2025-06-19', 'Vacunación anual aplicada.', 'Esquema completo.', 164),
('2025-06-21', 'Consulta por falta de apetito.', 'Estrés.', 166),
('2025-06-23', 'Chequeo de hembra adulta.', 'Normal.', 168),
('2025-06-25', 'Consulta por herida leve.', 'Rasguño.', 170),
('2025-06-27', 'Control de peso. Normal.', 'Sin cambios significativos.', 172),
('2025-06-28', 'Control final post tratamiento.', 'Totalmente recuperado.', 174);
GO

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- ==================================================
-- FACTURAS (90 registros, 1 por atención)
-- ==================================================
INSERT INTO Factura (fecha_emision, total, id_metodo_pago, id_estado, id_atencion) VALUES
('2025-01-07', 7500, 1, 1, 1),
('2025-01-11', 8200, 2, 1, 2),
('2025-01-20', 6000, 1, 1, 3),
('2025-01-24', 9400, 3, 1, 4),
('2025-01-28', 7100, 1, 1, 5),
('2025-02-01', 5300, 4, 1, 6),
('2025-02-04', 8900, 2, 1, 7),
('2025-02-07', 9100, 5, 1, 8),
('2025-02-10', 10000, 1, 1, 9),
('2025-02-14', 6400, 1, 1, 10),
('2025-02-18', 7700, 3, 1, 11),
('2025-02-21', 6800, 1, 1, 12),
('2025-02-23', 8700, 2, 1, 13),
('2025-02-24', 7200, 1, 1, 14),
('2025-02-28', 6300, 1, 1, 15),
('2025-03-03', 9200, 2, 1, 16),
('2025-03-05', 5400, 3, 1, 17),
('2025-03-07', 11200, 4, 1, 18),
('2025-03-10', 7600, 1, 1, 19),
('2025-03-13', 5800, 1, 1, 20),
('2025-03-15', 8500, 2, 1, 21),
('2025-03-17', 7200, 1, 1, 22),
('2025-03-20', 6500, 4, 1, 23),
('2025-03-23', 9900, 1, 1, 24),
('2025-03-25', 10200, 2, 1, 25),
('2025-03-27', 7400, 1, 1, 26),
('2025-03-30', 9000, 1, 1, 27),
('2025-04-01', 8300, 1, 1, 28),
('2025-04-04', 5700, 2, 1, 29),
('2025-04-07', 8800, 1, 1, 30),
('2025-04-10', 9400, 3, 1, 31),
('2025-04-13', 7500, 1, 1, 32),
('2025-04-15', 9700, 1, 1, 33),
('2025-04-19', 8000, 2, 1, 34),
('2025-04-22', 11000, 5, 1, 35),
('2025-04-25', 5600, 4, 1, 36),
('2025-04-28', 10300, 1, 1, 37),
('2025-05-01', 6200, 1, 1, 38),
('2025-05-03', 8900, 2, 1, 39),
('2025-05-05', 7100, 4, 1, 40),
('2025-05-08', 8100, 1, 1, 41),
('2025-05-10', 5400, 3, 1, 42),
('2025-05-12', 6000, 1, 1, 43),
('2025-05-14', 6500, 1, 1, 44),
('2025-05-17', 9400, 2, 1, 45),
('2025-05-19', 9900, 4, 1, 46),
('2025-05-22', 8700, 5, 1, 47),
('2025-05-25', 7100, 1, 1, 48),
('2025-05-27', 5900, 1, 1, 49),
('2025-05-30', 9100, 2, 1, 50),
('2025-06-01', 8400, 1, 1, 51),
('2025-06-03', 8800, 1, 1, 52),
('2025-06-05', 6600, 2, 1, 53),
('2025-06-07', 7000, 3, 1, 54),
('2025-06-09', 8200, 1, 1, 55),
('2025-06-11', 9500, 4, 1, 56),
('2025-06-13', 7200, 5, 1, 57),
('2025-06-15', 9700, 2, 1, 58),
('2025-06-17', 5600, 1, 1, 59),
('2025-06-19', 10900, 3, 1, 60),
('2025-06-21', 8600, 2, 1, 61),
('2025-06-23', 7800, 1, 1, 62),
('2025-06-25', 9200, 4, 1, 63),
('2025-06-27', 7300, 5, 1, 64),
('2025-06-28', 10100, 1, 1, 65);
GO

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- ==================================================
-- MEDICAMENTOS (30 registros realistas)
-- ==================================================
INSERT INTO Medicamento (nombre_medicamento, presentacion, precio_unitario, stock, baja) VALUES
('Amoxiclav Vet', 'Tabletas 250mg', 850, 60, 0),
('Enrofloxacina 5%', 'Inyectable 10ml', 1200, 40, 0),
('Ivermectina Plus', 'Tabletas 6mg', 900, 80, 0),
('Ketoprofeno', 'Inyectable 20ml', 1450, 35, 0),
('Meloxicam Vet', 'Suspensión oral 15ml', 780, 50, 0),
('Prednisolona', 'Tabletas 5mg', 500, 70, 0),
('Fipronil Spray', 'Spray 250ml', 1100, 45, 0),
('Gentamicina', 'Pomada oftálmica 5g', 620, 55, 0),
('Clorfenamina', 'Tabletas 4mg', 350, 90, 0),
('Cefalexina', 'Tabletas 500mg', 950, 75, 0),
('Metronidazol', 'Tabletas 250mg', 820, 60, 0),
('Albendazol', 'Suspensión oral 10ml', 400, 100, 0),
('Enalapril', 'Tabletas 10mg', 650, 85, 0),
('Clotrimazol', 'Crema 20g', 380, 70, 0),
('Suero Ringer Lactato', 'Solución 500ml', 1500, 30, 0),
('Atropina', 'Inyectable 1ml', 1250, 25, 0),
('Carprofeno', 'Tabletas 50mg', 1150, 40, 0),
('Povidona Yodada', 'Solución 100ml', 460, 80, 0),
('Cicatrizante VetDerm', 'Pomada 30g', 540, 55, 0),
('Loratadina', 'Tabletas 10mg', 380, 95, 0),
('Multivitamínico PetCare', 'Jarabe 120ml', 730, 70, 0),
('Desparasitante TotalPet', 'Tabletas 50mg', 890, 60, 0),
('Ceftriaxona', 'Inyectable 1g', 1600, 20, 0),
('Antipulgas NexGard', 'Tabletas masticables', 2300, 40, 0),
('Ciclosporina', 'Cápsulas 25mg', 2100, 25, 0),
('Omeprazol Vet', 'Tabletas 20mg', 870, 65, 0),
('Clindamicina', 'Cápsulas 150mg', 960, 50, 0),
('Enrofloxacina Oral', 'Solución 50ml', 1400, 45, 0),
('Antiinflamatorio Melovet', 'Tabletas 10mg', 1300, 50, 0),
('Calcio Pet', 'Jarabe 100ml', 590, 75, 0);
GO

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- ==================================================
-- MEDICAMENTO_ATENCION (fragmento de ejemplo)
-- ==================================================
INSERT INTO Medicamento_atencion (id_atencion, id_medicamento, dosis, cantidad, precio_unit)
VALUES
(1, 1, '1 comprimido cada 12h', 10, 250),
(2, 3, '5ml cada 8h', 1, 800),
(3, 5, '2ml cada 24h', 1, 600),
(4, 7, '1 comprimido diario', 7, 400),
(5, 8, 'Aplicar tópico 2 veces al día', 1, 700),
(6, 10, '1 comprimido cada 12h', 10, 300),
(7, 11, '5ml cada 8h', 1, 500),
(8, 12, '1 comprimido cada 24h', 5, 250),
(9, 14, '5ml cada 12h', 2, 400),
(10, 15, 'Aplicar cada 24h', 1, 650),
(11, 16, '1 comprimido cada 8h', 8, 280),
(12, 18, 'Spray tópico cada 12h', 1, 500),
(13, 19, '1 dosis diaria', 1, 600),
(14, 20, 'Aplicar cada 12h', 1, 450),
(15, 22, '3ml cada 8h', 1, 550),
(16, 23, '1 comprimido diario', 10, 300),
(17, 25, 'Ungüento tópico', 1, 700),
(18, 26, '1 comprimido cada 12h', 10, 250),
(19, 28, 'Aplicar 2 veces al día', 1, 500),
(20, 29, '5ml cada 12h', 1, 400);


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
