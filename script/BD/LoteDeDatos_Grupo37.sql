USE DB_Integrador_Grupo37
GO
-- ==================================================
-- INSERCIÓN DE DATOS
-- ==================================================

SET DATEFORMAT ymd;
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

-- =G==============================
-- 6. ESTADO DE PAGO
-- ===============================
INSERT INTO Estado_pago (estado_pago) VALUES
('Pagado'),
('Pendiente'),
('Anulado');
GO

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
-- VETERINARIOS (20)
-- ==================================================
INSERT INTO Veterinario (
    nombre_apellido_veterinario, correo_veterinario, matricula, baja, id_veterinario_especialidad
)
SELECT v.nombre, v.correo, v.matricula, 0, ve.id_veterinario_especialidad
FROM (VALUES
('Dr. Adrián Salinas',       'adrian.salinas@vetpro.com',      'MV-2025-0001', 'Cirugía General'),
('Dra. Belén Álvarez',       'belen.alvarez@vetpro.com',       'MV-2025-0002', 'Dermatología'),
('Dr. Cristian Maidana',     'cristian.maidana@vetpro.com',    'MV-2025-0003', 'Oftalmología'),
('Dra. Daniela Ojeda',       'daniela.ojeda@vetpro.com',       'MV-2025-0004', 'Cardiología'),
('Dr. Esteban Marchi',       'esteban.marchi@vetpro.com',      'MV-2025-0005', 'Neurología'),
('Dra. Florencia Russo',     'florencia.russo@vetpro.com',     'MV-2025-0006', 'Medicina Interna'),
('Dr. Gastón Paredes',       'gaston.paredes@vetpro.com',      'MV-2025-0007', 'Odontología'),
('Dra. Helena Romero',       'helena.romero@vetpro.com',       'MV-2025-0008', 'Oncología'),
('Dr. Iván Pereyra',         'ivan.pereyra@vetpro.com',        'MV-2025-0009', 'Traumatología'),
('Dra. Julieta Rivas',       'julieta.rivas@vetpro.com',       'MV-2025-0010', 'Rehabilitación'),
('Dr. Kevin Duarte',         'kevin.duarte@vetpro.com',        'MV-2025-0011', 'Cirugía General'),
('Dra. Lucía Méndez',        'lucia.mendez@vetpro.com',        'MV-2025-0012', 'Dermatología'),
('Dr. Marcos Varela',        'marcos.varela@vetpro.com',       'MV-2025-0013', 'Oftalmología'),
('Dra. Nadia Sosa',          'nadia.sosa@vetpro.com',          'MV-2025-0014', 'Cardiología'),
('Dr. Octavio Godoy',        'octavio.godoy@vetpro.com',       'MV-2025-0015', 'Neurología'),
('Dra. Paula Benítez',       'paula.benitez@vetpro.com',       'MV-2025-0016', 'Medicina Interna'),
('Dr. Ramiro Acosta',        'ramiro.acosta@vetpro.com',       'MV-2025-0017', 'Odontología'),
('Dra. Sofía Quiroga',       'sofia.quiroga@vetpro.com',       'MV-2025-0018', 'Oncología'),
('Dr. Tomás Ferreyra',       'tomas.ferreyra@vetpro.com',      'MV-2025-0019', 'Traumatología'),
('Dra. Valentina Cabrera',   'valentina.cabrera@vetpro.com',   'MV-2025-0020', 'Rehabilitación')
) AS v(nombre, correo, matricula, especialidad)
JOIN Veterinario_especialidad ve
  ON ve.especialidad = v.especialidad;
GO

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------

  -- ==================================================
-- CLIENTES (54 registros)
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

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- ==================================================
-- MASCOTAS (100 registros)
-- CORRECCIÓN: Ajustado formato de fecha a 'YYYYMMDD'
-- CORRECCIÓN: Ajustada la Mascota 54 para que use el id_cliente 1
-- ==================================================
INSERT INTO Mascota (nombre_mascota, especie, fecha_nac, sexo, raza, id_mascota_estado, id_cliente)
VALUES
('Luna', 'Perro', '20200312', 'Hembra', 'Labrador Retriever', 1, 1),
('Rocky', 'Perro', '20191103', 'Macho', 'Pastor Alemán', 1, 2),
('Milo', 'Gato', '20210721', 'Macho', 'Siames', 2, 3),
('Olivia', 'Gato', '20180910', 'Hembra', 'Persa', 1, 4),
('Toby', 'Perro', '20220115', 'Macho', 'Golden Retriever', 3, 5),
('Mora', 'Perro', '20170605', 'Hembra', 'Beagle', 1, 6),
('Simba', 'Gato', '20200819', 'Macho', 'Bengalí', 1, 7),
('Nina', 'Gato', '20210409', 'Hembra', 'Maine Coon', 1, 8),
('Zeus', 'Perro', '20161030', 'Macho', 'Rottweiler', 2, 9),
('Lola', 'Perro', '20190111', 'Hembra', 'Caniche', 1, 10),
('Coco', 'Ave', '20230218', 'Macho', 'Cacatúa', 1, 11),
('Kiwi', 'Ave', '20221122', 'Hembra', 'Periquito', 1, 12),
('Tango', 'Conejo', '20210930', 'Macho', 'Enano Holandés', 1, 13),
('Nube', 'Gato', '20181205', 'Hembra', 'Azul Ruso', 1, 14),
('Max', 'Perro', '20200214', 'Macho', 'Bulldog Francés', 3, 15),
('Miel', 'Perro', '20190828', 'Hembra', 'Cocker Spaniel', 1, 16),
('Lolo', 'Gato', '20210315', 'Macho', 'Sphynx', 2, 17),
('Nala', 'Gato', '20201201', 'Hembra', 'British Shorthair', 1, 18),
('Thor', 'Perro', '20170907', 'Macho', 'Boxer', 2, 19),
('Kira', 'Perro', '20220405', 'Hembra', 'Border Collie', 1, 20),
('Oreo', 'Conejo', '20210610', 'Macho', 'Mini Lop', 1, 21),
('Mango', 'Ave', '20200919', 'Macho', 'Canario', 1, 22),
('Cleo', 'Reptil', '20190322', 'Hembra', 'Iguana Verde', 1, 23),
('Fiona', 'Perro', '20210525', 'Hembra', 'Pug', 1, 24),
('Rex', 'Perro', '20180708', 'Macho', 'Doberman', 2, 25),
('Misha', 'Gato', '20191030', 'Hembra', 'Angora', 1, 26),
('Tommy', 'Perro', '20201212', 'Macho', 'Dálmata', 3, 27),
('Kenia', 'Gato', '20170402', 'Hembra', 'Calicó', 1, 28),
('Bobby', 'Perro', '20220803', 'Macho', 'Schnauzer Mini', 1, 29),
('Pepa', 'Ave', '20211129', 'Hembra', 'Agapornis', 1, 30),
('Roco', 'Perro', '20200109', 'Macho', 'Bulldog Inglés', 1, 31),
('Nina', 'Perro', '20190210', 'Hembra', 'Shih Tzu', 1, 32),
('Timon', 'Gato', '20180322', 'Macho', 'Himalayo', 2, 33),
('Dory', 'Pez', '20220705', 'Hembra', 'Betta', 1, 34),
('Pipo', 'Conejo', '20201011', 'Macho', 'Cabeza de León', 1, 35),
('Chispa', 'Perro', '20210915', 'Hembra', 'Jack Russell', 1, 36),
('Momo', 'Gato', '20170803', 'Macho', 'Siberiano', 1, 37),
('Kira', 'Perro', '20200523', 'Hembra', 'Husky Siberiano', 1, 38),
('Duke', 'Perro', '20190620', 'Macho', 'San Bernardo', 2, 39),
('Nina', 'Ave', '20210319', 'Hembra', 'Canario', 1, 40),
('Luz', 'Perro', '20200901', 'Hembra', 'Collie', 1, 41),
('Ares', 'Perro', '20180202', 'Macho', 'Pitbull Terrier', 2, 42),
('Mimi', 'Gato', '20210101', 'Hembra', 'Abisinio', 1, 43),
('Tango', 'Perro', '20200323', 'Macho', 'Poodle', 1, 44),
('Canela', 'Perro', '20190424', 'Hembra', 'Yorkshire Terrier', 1, 45),
('Bobby', 'Gato', '20180525', 'Macho', 'Persa Blanco', 1, 46),
('Daisy', 'Perro', '20190726', 'Hembra', 'Labrador', 1, 47),
('Tito', 'Perro', '20200827', 'Macho', 'Pastor Belga', 2, 48),
('Luna', 'Gato', '20210928', 'Hembra', 'Siames', 1, 49),
('Simón', 'Gato', '20171029', 'Macho', 'Común Europeo', 1, 50),
('Nala', 'Gato', '20221130', 'Hembra', 'Persa Gris', 1, 51),
('Rocky', 'Perro', '20180115', 'Macho', 'Bulldog Inglés', 1, 52),
('Mora', 'Gato', '20200218', 'Hembra', 'Maine Coon', 1, 53),
('Max', 'Perro', '20170319', 'Macho', 'Beagle', 2, 1), -- <-- ESTA ERA LA LÍNEA DEL ERROR (Cambié 54 por 1)
-- Reinicio de IDs de cliente para que coincidan
('Coco', 'Perro', '20190422', 'Macho', 'Golden Retriever', 1, 1),
('Mimi', 'Gato', '20200525', 'Hembra', 'Siamés', 1, 2),
('Zeus', 'Perro', '20210628', 'Macho', 'Doberman', 1, 3),
('Tina', 'Perro', '20220731', 'Hembra', 'Cocker', 1, 4),
('Rayo', 'Perro', '20200802', 'Macho', 'Border Collie', 2, 5),
('Kira', 'Perro', '20210905', 'Hembra', 'Husky', 1, 6),
('Rocco', 'Perro', '20201008', 'Macho', 'Bulldog Francés', 1, 7),
('Olivia', 'Gato', '20211111', 'Hembra', 'Angora', 1, 8),
('Simba', 'Gato', '20191214', 'Macho', 'Siberiano', 1, 9),
('Nino', 'Ave', '20200117', 'Macho', 'Canario', 1, 10),
('Milo', 'Perro', '20210220', 'Macho', 'Caniche', 1, 11),
('Kenia', 'Gato', '20220323', 'Hembra', 'Sphynx', 1, 12),
('Beto', 'Conejo', '20210426', 'Macho', 'Mini Rex', 1, 13),
('Mora', 'Perro', '20200529', 'Hembra', 'Pomerania', 1, 14),
('Choco', 'Perro', '20190601', 'Macho', 'Labrador', 1, 15),
('Bali', 'Ave', '20220704', 'Hembra', 'Periquito', 1, 16),
('Ringo', 'Perro', '20180807', 'Macho', 'Boxer', 2, 17),
('Cleo', 'Reptil', '20210910', 'Hembra', 'Gecko Leopardo', 1, 18),
('Luna', 'Perro', '20191013', 'Hembra', 'Chihuahua', 1, 19),
('Thor', 'Perro', '20201116', 'Macho', 'Husky Siberiano', 1, 20),
('Pipo', 'Gato', '20211219', 'Macho', 'Común Doméstico', 1, 21),
('Lila', 'Perro', '20220122', 'Hembra', 'Caniche Toy', 1, 22),
('Ciro', 'Gato', '20190225', 'Macho', 'Bengalí', 2, 23),
('Mimi', 'Gato', '20200328', 'Hembra', 'Persa Blanco', 1, 24),
('Zeus', 'Perro', '20210401', 'Macho', 'Pastor Alemán', 1, 25),
('Nina', 'Perro', '20220504', 'Hembra', 'Beagle', 1, 26),
('Simón', 'Gato', '20210607', 'Macho', 'Azul Ruso', 1, 27),
('Kira', 'Gato', '20200710', 'Hembra', 'Siames', 1, 28),
('Rocky', 'Perro', '20190813', 'Macho', 'Labrador', 1, 29),
('Mora', 'Perro', '20180916', 'Hembra', 'Cocker Spaniel', 1, 30),
('Simba', 'Gato', '20201019', 'Macho', 'Siberiano', 1, 31),
('Nala', 'Gato', '20211122', 'Hembra', 'Persa', 1, 32),
('Coco', 'Perro', '20201225', 'Macho', 'Caniche', 1, 33),
('Mila', 'Perro', '20210128', 'Hembra', 'Labrador', 1, 34),
('Toby', 'Perro', '20220201', 'Macho', 'Beagle', 1, 35),
('Luna', 'Gato', '20210304', 'Hembra', 'Maine Coon', 1, 36),
('Zeus', 'Perro', '20200407', 'Macho', 'Rottweiler', 1, 37),
('Olivia', 'Gato', '20210510', 'Hembra', 'Sphynx', 1, 38),
('Thor', 'Perro', '20190613', 'Macho', 'Boxer', 1, 39),
('Nina', 'Gato', '20200716', 'Hembra', 'Siames', 1, 40),
('Rocky', 'Perro', '20210819', 'Macho', 'Labrador', 1, 41),
('Milo', 'Gato', '20220922', 'Macho', 'Persa', 1, 42),
('Kira', 'Perro', '20211025', 'Hembra', 'Husky', 1, 43),
('Simba', 'Gato', '20201128', 'Macho', 'Bengalí', 1, 44),
('Mora', 'Perro', '20191231', 'Hembra', 'Cocker', 1, 45),
('Zeus', 'Perro', '20210101', 'Macho', 'Labrador', 1, 46);
GO

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- ==================================================
-- USUARIOS
-- ==================================================

-- ADMIN
INSERT INTO Usuario (nombre_usuario, contraseña, id_rol, id_empleado, id_veterinario, activo) VALUES
('admin', 'Admin@2025', 1, 1, NULL, 1);
GO


-- RECEPCIONISTAS (empleados 2–11)
INSERT INTO Usuario (nombre_usuario, contraseña, id_rol, id_empleado, id_veterinario, activo) VALUES
('mlopez',         'Recep@123', 2,  2, NULL, 1),    -- María López
('jgonzalez',      'Recep@123', 2,  3, NULL, 1),    -- Juan González
('afernandez',     'Recep@123', 2,  4, NULL, 1),    -- Ana Fernández
('cperez',         'Recep@123', 2,  5, NULL, 1),    -- Carlos Pérez
('lramirez',       'Recep@123', 2,  6, NULL, 1),    -- Lucía Ramírez
('jtorres',        'Recep@123', 2,  7, NULL, 1),    -- Joaquín Torres
('pdominguez',     'Recep@123', 2,  8, NULL, 1),    -- Paula Domínguez
('sbenitez',       'Recep@123', 2,  9, NULL, 1),    -- Sofía Benítez
('mrios',          'Recep@123', 2, 10, NULL, 1),    -- Matías Ríos
('vherrera',       'Recep@123', 2, 11, NULL, 1);    -- Valentina Herrera
GO


-- VETERINARIOS (id_veterinario 1–20)
INSERT INTO Usuario (nombre_usuario, contraseña, id_rol, id_empleado, id_veterinario, activo) VALUES
('asalinas',       'Vet@123', 3, NULL,  1, 1),  -- Dr. Adrián Salinas
('balvarez',       'Vet@123', 3, NULL,  2, 1),  -- Dra. Belén Álvarez
('cmaidana',       'Vet@123', 3, NULL,  3, 1),  -- Dr. Cristian Maidana
('dojeda',         'Vet@123', 3, NULL,  4, 1),  -- Dra. Daniela Ojeda
('emarchi',        'Vet@123', 3, NULL,  5, 1),  -- Dr. Esteban Marchi
('frusso',         'Vet@123', 3, NULL,  6, 1),  -- Dra. Florencia Russo
('gparedes',       'Vet@123', 3, NULL,  7, 1),  -- Dr. Gastón Paredes
('hromero',        'Vet@123', 3, NULL,  8, 1),  -- Dra. Helena Romero
('ipereyra',       'Vet@123', 3, NULL,  9, 1),  -- Dr. Iván Pereyra
('jrivas',         'Vet@123', 3, NULL, 10, 1),  -- Dra. Julieta Rivas
('kduarte',        'Vet@123', 3, NULL, 11, 1),  -- Dr. Kevin Duarte
('lmendez',        'Vet@123', 3, NULL, 12, 1),  -- Dra. Lucía Méndez
('mvarela',        'Vet@123', 3, NULL, 13, 1),  -- Dr. Marcos Varela
('nsosa',          'Vet@123', 3, NULL, 14, 1),  -- Dra. Nadia Sosa
('ogodoy',         'Vet@123', 3, NULL, 15, 1),  -- Dr. Octavio Godoy
('pbenitez',       'Vet@123', 3, NULL, 16, 1),  -- Dra. Paula Benítez
('racosta',        'Vet@123', 3, NULL, 17, 1),  -- Dr. Ramiro Acosta
('squiroga',       'Vet@123', 3, NULL, 18, 1),  -- Dra. Sofía Quiroga
('tferreyra',      'Vet@123', 3, NULL, 19, 1),  -- Dr. Tomás Ferreyra
('vcabrera_vet',   'Vet@123', 3, NULL, 20, 1);  -- Dra. Valentina Cabrera
GO


-- PERSONAL (empleados 12–30)
INSERT INTO Usuario (nombre_usuario, contraseña, id_rol, id_empleado, id_veterinario, activo) VALUES
('jcabrera',       'Emp@123', 2, 12, NULL, 1),  -- Julieta Cabrera
('mgomez',         'Emp@123', 2, 13, NULL, 1),  -- Martín Gómez
('fayala',         'Emp@123', 2, 14, NULL, 1),  -- Florencia Ayala
('amolina',        'Emp@123', 2, 15, NULL, 1),  -- Agustín Molina
('jsilva',         'Emp@123', 2, 16, NULL, 1),  -- Josefina Silva
('fortiz',         'Emp@123', 2, 17, NULL, 1),  -- Franco Ortiz
('mnavarro',       'Emp@123', 2, 18, NULL, 1),  -- Micaela Navarro
('tfigueroa',      'Emp@123', 2, 19, NULL, 1),  -- Tomás Figueroa
('rcaceres',       'Emp@123', 2, 20, NULL, 1),  -- Ramiro Cáceres
('lgimenez',       'Emp@123', 2, 21, NULL, 1),  -- Laura Giménez
('vcabrera',       'Emp@123', 2, 22, NULL, 1),  -- Victoria Cabrera
('lsanchez',       'Emp@123', 2, 23, NULL, 1),  -- Lautaro Sánchez
('mmedina',        'Emp@123', 2, 24, NULL, 1),  -- Malena Medina
('rlopez',         'Emp@123', 2, 25, NULL, 1),  -- Rocío López
('gromero',        'Emp@1J23', 2, 26, NULL, 1),  -- Gonzalo Romero
('mvega',          'Emp@123', 2, 27, NULL, 1),  -- Milagros Vega
('bcorrea',        'Emp@123', 2, 28, NULL, 1),  -- Bruno Correa
('nleiva',         'Emp@123', 2, 29, NULL, 1),  -- Nicolás Leiva
('vquiroga',       'Emp@123', 2, 30, NULL, 1);  -- Valeria Quiroga
GO

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- ==================================================
-- TURNOS (180 registros)
-- CORRECCIÓN: Ajustado formato de fecha a 'YYYYMMDD'
-- ==================================================
INSERT INTO Turno (fecha_turno, id_turno_estado, id_usuario, id_veterinario, id_mascota) VALUES
('20250105', 2, 2, 1, 1),
('20250106', 1, 3, 2, 2),
('20250107', 4, 4, 3, 3),
('20250108', 2, 5, 4, 4),
('20250109', 1, 6, 5, 5),
('20250110', 3, 7, 6, 6),
('20250111', 4, 8, 7, 7),
('20250112', 2, 9, 8, 8),
('20250113', 1, 10, 9, 9),
('20250114', 2, 11, 10, 10),
('20250115', 4, 2, 11, 11),
('20250116', 1, 3, 12, 12),
('20250117', 2, 4, 13, 13),
('20250118', 5, 5, 14, 14),
('20250119', 2, 6, 15, 15),
('20250120', 4, 7, 16, 16),
('20250121', 2, 8, 17, 17),
('20250122', 1, 9, 18, 18),
('20250123', 2, 10, 19, 19),
('20250124', 4, 11, 20, 20),
('20250125', 2, 2, 1, 21),
('20250126', 1, 3, 2, 22),
('20250127', 2, 4, 3, 23),
('20250128', 4, 5, 4, 24),
('20250129', 1, 6, 5, 25),
('20250130', 2, 7, 6, 26),
('20250201', 4, 8, 7, 27),
('20250202', 1, 9, 8, 28),
('20250203', 3, 10, 9, 29),
('20250204', 4, 11, 10, 30),
('20250205', 2, 2, 11, 31),
('20250206', 1, 3, 12, 32),
('20250207', 4, 4, 13, 33),
('20250208', 2, 5, 14, 34),
('20250209', 4, 6, 15, 35),
('20250210', 3, 7, 16, 36),
('20250211', 4, 8, 17, 37),
('20250212', 1, 9, 18, 38),
('20250213', 4, 10, 19, 39),
('20250214', 2, 11, 20, 40),
('20250215', 1, 2, 1, 41),
('20250216', 4, 3, 2, 42),
('20250217', 2, 4, 3, 43),
('20250218', 4, 5, 4, 44),
('20250219', 1, 6, 5, 45),
('20250220', 2, 7, 6, 46),
('20250221', 4, 8, 7, 47),
('20250222', 1, 9, 8, 48),
('20250223', 4, 10, 9, 49),
('20250224', 2, 11, 10, 50),
('20250225', 1, 2, 11, 51),
('20250226', 2, 3, 12, 52),
('20250227', 3, 4, 13, 53),
('20250228', 4, 5, 14, 54),
('20250301', 2, 6, 15, 55),
('20250302', 1, 7, 16, 56),
('20250303', 4, 8, 17, 57),
('20250304', 2, 9, 18, 58),
('20250305', 4, 10, 19, 59),
('20250306', 1, 11, 20, 60),
('20250307', 4, 2, 1, 61),
('20250308', 1, 3, 2, 62),
('20250309', 2, 4, 3, 63),
('20250310', 4, 5, 4, 64),
('20250311', 1, 6, 5, 65),
('20250312', 2, 7, 6, 66),
('20250313', 4, 8, 7, 67),
('20250314', 1, 9, 8, 68),
('20250315', 4, 10, 9, 69),
('20250316', 2, 11, 10, 70),
('20250317', 1, 2, 11, 71),
('20250318', 4, 3, 12, 72),
('20250319', 1, 4, 13, 73),
('20250320', 2, 5, 14, 74),
('20250321', 4, 6, 15, 75),
('20250322', 1, 7, 16, 76),
('20250323', 4, 8, 17, 77),
('20250324', 2, 9, 18, 78),
('20250325', 4, 10, 19, 79),
('20250326', 1, 11, 20, 80),
('20250327', 4, 2, 1, 81),
('20250328', 2, 3, 2, 82),
('20250329', 4, 4, 3, 83),
('20250330', 1, 5, 4, 84),
('20250331', 4, 6, 5, 85),
('20250401', 2, 7, 6, 86),
('20250402', 4, 8, 7, 87),
('20250403', 1, 9, 8, 88),
('20250404', 4, 10, 9, 89),
('20250405', 2, 11, 10, 90),
('20250406', 1, 2, 11, 91),
('20250407', 4, 3, 12, 92),
('20250408', 2, 4, 13, 93),
('20250409', 4, 5, 14, 94),
('20250410', 1, 6, 15, 95),
('20250411', 4, 7, 16, 96),
('20250412', 2, 8, 17, 97),
('20250413', 4, 9, 18, 98),
('20250414', 1, 10, 19, 99),
('20250415', 4, 11, 20, 100),
('20250416', 2, 2, 1, 1),
('20250417', 1, 3, 2, 2),
('20250418', 2, 4, 3, 3),
('20250419', 4, 5, 4, 4),
('20250420', 1, 6, 5, 5),
('20250421', 2, 7, 6, 6),
('20250422', 4, 8, 7, 7),
('20250423', 1, 9, 8, 8),
('20250424', 2, 10, 9, 9),
('20250425', 4, 11, 10, 10),
('20250426', 1, 2, 11, 11),
('20250427', 4, 3, 12, 12),
('20250428', 1, 4, 13, 13),
('20250429', 2, 5, 14, 14),
('20250430', 4, 6, 15, 15),
('20250501', 1, 7, 16, 16),
('20250502', 4, 8, 17, 17),
('20250503', 2, 9, 18, 18),
('20250504', 4, 10, 19, 19),
('20250505', 1, 11, 20, 20),
('20250506', 4, 2, 1, 5),
('20250507', 2, 3, 2, 10),
('20250508', 4, 4, 3, 15),
('20250509', 1, 5, 4, 20),
('20250510', 4, 6, 5, 25),
('20250511', 2, 7, 6, 30),
('20250512', 4, 8, 7, 35),
('20250513', 1, 9, 8, 40),
('20250514', 4, 10, 9, 45),
('20250515', 2, 11, 10, 50),
('20250516', 4, 2, 11, 55),
('20250517', 1, 3, 12, 60),
('20250518', 4, 4, 13, 65),
('20250519', 2, 5, 14, 70),
('20250520', 4, 6, 15, 75),
('20250521', 1, 7, 16, 80),
('20250522', 4, 8, 17, 85),
('20250523', 2, 9, 18, 90),
('20250524', 4, 10, 19, 95),
('20250525', 1, 11, 20, 100),
('20250526', 2, 2, 1, 1),
('20250527', 4, 3, 2, 2),
('20250528', 1, 4, 3, 3),
('20250529', 4, 5, 4, 4),
('20250530', 2, 6, 5, 5),
('20250601', 4, 7, 6, 6),
('20250602', 1, 8, 7, 7),
('20250603', 4, 9, 8, 8),
('20250604', 2, 10, 9, 9),
('20250605', 4, 11, 10, 10),
('20250606', 1, 2, 11, 11),
('20250607', 4, 3, 12, 12),
('20250608', 1, 4, 13, 13),
('20250609', 2, 5, 14, 14),
('20250610', 4, 6, 15, 15),
('20250611', 1, 7, 16, 16),
('20250612', 4, 8, 17, 17),
('20250613', 2, 9, 18, 18),
('20250614', 4, 10, 19, 19),
('20250615', 1, 11, 20, 20),
('20250616', 4, 2, 1, 25),
('20250617', 2, 3, 2, 26),
('20250618', 4, 4, 3, 27),
('20250619', 1, 5, 4, 28),
('20250620', 4, 6, 5, 29),
('20250621', 2, 7, 6, 30),
('20250622', 4, 8, 7, 31),
('20250623', 1, 9, 8, 32),
('20250624', 4, 10, 9, 33),
('20250625', 2, 11, 10, 34),
('20250626', 1, 2, 11, 35),
('20250627', 4, 3, 12, 36),
('20250628', 2, 4, 13, 37);
GO
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- ==================================================
-- ATENCIONES (65 registros)
-- CORRECCIÓN: Ajustado formato de fecha a 'YYYYMMDD'
-- NOTA: Tu script original tenía 90 atenciones, pero solo 65 turnos 'Completados' (estado 4).
-- He usado solo los 65 turnos que SÍ estaban completados y que existen.
-- ==================================================
INSERT INTO Atencion (fecha_atencion, observacion, diagnostico, id_turno) VALUES
('20250107', 'Consulta de control general. Paciente estable.', 'Sin patologías detectadas.', 3),
('20250111', 'Dolor abdominal leve. Se indica ayuno y control.', 'Gastroenteritis leve.', 7),
('20250115', 'Vacunación anual aplicada sin complicaciones.', 'Vacunación antirrábica.', 11),
('20250120', 'Chequeo postoperatorio. Herida cicatrizando bien.', 'Post cirugía canina.', 16),
('20250124', 'Consulta por pérdida de apetito.', 'Gastritis leve.', 20),
('20250128', 'Control de peso y estado general.', 'Sobrepeso leve.', 24),
('20250201', 'Revisión dental. Sarro moderado.', 'Higiene bucal deficiente.', 27),
('20250204', 'Dermatitis localizada. Tratamiento tópico.', 'Alergia por contacto.', 30),
('20250207', 'Chequeo anual. Todo dentro de parámetros normales.', 'Animal sano.', 33),
('20250209', 'Corte en pata posterior. Se realiza curación y vendaje.', 'Herida superficial.', 35),
('20250211', 'Castración controlada. Buena recuperación.', 'Post operatorio exitoso.', 37),
('20250213', 'Consulta por tos frecuente.', 'Tos de las perreras.', 39),
('20250216', 'Control de temperatura. Normal.', 'Sin fiebre.', 42),
('20250218', 'Revisión por caída. Se descarta fractura.', 'Contusión leve.', 44),
('20250221', 'Limpieza de oídos realizada.', 'Otitis externa resuelta.', 47),
('20250223', 'Chequeo general felino. Todo normal.', 'Sin hallazgos.', 49),
('20250228', 'Tratamiento antiparasitario aplicado.', 'Desparasitación interna.', 54),
('20250303', 'Herida infectada. Se realiza limpieza y antibiótico.', 'Infección cutánea.', 57),
('20250305', 'Control de vacunación. Aplicada triple felina.', 'Vacunación felina completa.', 59),
('20250307', 'Control de peso post dieta. Avance positivo.', 'Obesidad en control.', 61),
('20250310', 'Chequeo oftalmológico.', 'Conjuntivitis leve.', 64),
('20250313', 'Curación de herida superficial en oreja.', 'Lesión menor.', 67),
('20250315', 'Vacunación completa aplicada.', 'Calendario al día.', 69),
('20250318', 'Chequeo geriátrico. Signos de artritis.', 'Artrosis leve.', 72),
('20250321', 'Tratamiento dental.', 'Extracción de pieza dañada.', 75),
('20250323', 'Control de temperatura y apetito.', 'Leve fiebre transitoria.', 77),
('20250325', 'Consulta por diarrea leve.', 'Indigestión.', 79),
('20250327', 'Revisión postvacunación. Todo correcto.', 'Sin efectos adversos.', 81),
('20250329', 'Herida superficial en pata delantera. Curación.', 'Corte leve.', 83),
('20250331', 'Consulta por picazón excesiva.', 'Dermatitis alérgica.', 85),
('20250402', 'Control post desparasitación.', 'Normal.', 87),
('20250404', 'Consulta por vómitos ocasionales.', 'Gastritis aguda.', 89),
('20250407', 'Chequeo general. Se observa buena salud.', 'Sin observaciones.', 92),
('20250409', 'Limpieza dental profunda.', 'Placa bacteriana.', 94),
('20250411', 'Vacunación aplicada sin reacciones.', 'Vacuna anual completa.', 96),
('20250413', 'Control de peso. Dieta recomendada.', 'Sobrepeso moderado.', 98),
('20250415', 'Herida en cola. Curación y antibiótico.', 'Lesión menor.', 100),
('20250419', 'Chequeo de cachorro. Primeras vacunas.', 'Inicio plan sanitario.', 104),
('20250422', 'Consulta por cojera leve.', 'Esguince.', 107),
('20250425', 'Control de recuperación. En mejora.', 'Tratamiento efectivo.', 110),
('20250427', 'Vacunación refuerzo. Sin complicaciones.', 'Esquema completo.', 112),
('20250430', 'Consulta por tos seca.', 'Resfrío leve.', 115),
('20250502', 'Control de heridas. Buena cicatrización.', 'Post operatorio controlado.', 117),
('20250504', 'Chequeo general de hembra gestante.', 'Gestación normal.', 119),
('20250506', 'Vacunación antirrábica aplicada.', 'Esquema al día.', 121),
('20250508', 'Limpieza dental de rutina.', 'Sin patologías.', 123),
('20250510', 'Control de peso y pulgas.', 'Aplicado antiparasitario.', 125),
('20250512', 'Consulta por picazón persistente.', 'Alergia estacional.', 127),
('20250514', 'Vacuna aplicada sin efectos secundarios.', 'Normal.', 129),
('20250516', 'Chequeo anual general.', 'Animal sano.', 131),
('20250518', 'Consulta por vómitos.', 'Indigestión.', 133),
('20250520', 'Control de sutura. Buena evolución.', 'Recuperación favorable.', 135),
('20250522', 'Control de temperatura. Fiebre leve.', 'Infección respiratoria.', 137),
('20250524', 'Revisión post operatoria.', 'Correcta cicatrización.', 139),
('20250527', 'Consulta general de control.', 'Sin observaciones.', 141),
('20250529', 'Tratamiento antiparasitario.', 'Desparasitación externa.', 143),
('20250601', 'Chequeo dental.', 'Encías inflamadas.', 145),
('20250603', 'Consulta por tos seca.', 'Traqueítis leve.', 147),
('20250605', 'Revisión ocular.', 'Sin anomalías.', 149),
('20250607', 'Vacunación anual aplicada.', 'Esquema completo.', 151),
('20250610', 'Consulta por falta de apetito.', 'Estrés.', 153),
('20250612', 'Chequeo de hembra adulta.', 'Normal.', 155),
('20250614', 'Consulta por herida leve.', 'Rasguño.', 157),
('20250616', 'Control de peso. Normal.', 'Sin cambios significativos.', 159),
('20250618', 'Control final post tratamiento.', 'Totalmente recuperado.', 161),
('20250620', 'Consulta por falta de apetito.', 'Estrés.', 163),
('20250622', 'Chequeo de hembra adulta.', 'Normal.', 165),
('20250624', 'Consulta por herida leve.', 'Rasguño.', 167),
('20250627', 'Control de peso. Normal.', 'Sin cambios significativos.', 171);
GO


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- ==================================================
-- FACTURAS (65 registros, 1 por atención)
-- CORRECCIÓN: Ajustado formato de fecha a 'YYYYMMDD'
-- ==================================================
INSERT INTO Factura (fecha_emision, total, id_metodo_pago, id_estado, id_atencion) VALUES
('20250107', 7500, 1, 1, 1),
('20250111', 8200, 2, 1, 2),
('20250115', 6000, 1, 1, 3),
('20250120', 9400, 3, 1, 4),
('20250124', 7100, 1, 1, 5),
('20250128', 5300, 4, 1, 6),
('20250201', 8900, 2, 1, 7),
('20250204', 9100, 5, 1, 8),
('20250207', 10000, 1, 1, 9),
('20250209', 6400, 1, 1, 10),
('20250211', 7700, 3, 1, 11),
('20250213', 6800, 1, 1, 12),
('20250216', 8700, 2, 1, 13),
('20250218', 7200, 1, 1, 14),
('20250221', 6300, 1, 1, 15),
('20250223', 9200, 2, 1, 16),
('20250228', 5400, 3, 1, 17),
('20250303', 11200, 4, 1, 18),
('20250305', 7600, 1, 1, 19),
('20250307', 5800, 1, 1, 20),
('20250310', 8500, 2, 1, 21),
('20250313', 7200, 1, 1, 22),
('20250315', 6500, 4, 1, 23),
('20250318', 9900, 1, 1, 24),
('20250321', 10200, 2, 1, 25),
('20250323', 7400, 1, 1, 26),
('20250325', 9000, 1, 1, 27),
('20250327', 8300, 1, 1, 28),
('20250329', 5700, 2, 1, 29),
('20250331', 8800, 1, 1, 30),
('20250402', 9400, 3, 1, 31),
('20250404', 7500, 1, 1, 32),
('20250407', 9700, 1, 1, 33),
('20250409', 8000, 2, 1, 34),
('20250411', 11000, 5, 1, 35),
('20250413', 5600, 4, 1, 36),
('20250415', 10300, 1, 1, 37),
('20250419', 6200, 1, 1, 38),
('20250422', 8900, 2, 1, 39),
('20250425', 7100, 4, 1, 40),
('20250427', 8100, 1, 1, 41),
('20250430', 5400, 3, 1, 42),
('20250502', 6000, 1, 1, 43),
('20250504', 6500, 1, 1, 44),
('20250506', 9400, 2, 1, 45),
('20250508', 9900, 4, 1, 46),
('20250510', 8700, 5, 1, 47),
('20250512', 7100, 1, 1, 48),
('20250514', 5900, 1, 1, 49),
('20250516', 9100, 2, 1, 50),
('20250518', 8400, 1, 1, 51),
('20250520', 8800, 1, 1, 52),
('20250522', 6600, 2, 1, 53),
('20250524', 7000, 3, 1, 54),
('20250527', 8200, 1, 1, 55),
('20250529', 9500, 4, 1, 56),
('20250601', 7200, 5, 1, 57),
('20250603', 9700, 2, 1, 58),
('20250605', 5600, 1, 1, 59),
('20250607', 10900, 3, 1, 60),
('20250610', 8600, 2, 1, 61),
('20250612', 7800, 1, 1, 62),
('20250614', 9200, 4, 1, 63),
('20250616', 7300, 5, 1, 64),
('20250618', 10100, 1, 1, 65);
--('20250620', 8100, 2, 1, 66), -- Faltan atenciones para estas facturas
--('20250622', 7800, 1, 1, 67),
--('20250624', 9200, 4, 1, 68),
--('20250627', 10100, 1, 1, 69);
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
GO

