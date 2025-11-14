CREATE DATABASE DB_Integrador_Grupo37;

USE DB_Integrador_Grupo37
GO


CREATE TABLE Cliente
(
  id_cliente INT IDENTITY (1,1) NOT NULL,
  nombre_apellido_cliente VARCHAR(120) NOT NULL,
  dni_cliente VARCHAR(20) NOT NULL,
  telefono_cliente INT NOT NULL,
  correo_cliente VARCHAR(200) NOT NULL,
  domicilio_cliente VARCHAR(200) NOT NULL,
  baja BIT NOT NULL,
  CONSTRAINT PK_cliente PRIMARY KEY (id_cliente),
  CONSTRAINT UQ_cliente_dni UNIQUE (dni_cliente),
  CONSTRAINT UQ_cliente_correo UNIQUE (correo_cliente)
);

CREATE TABLE Mascota
(
  id_mascota INT IDENTITY(1,1) NOT NULL,
  nombre_mascota VARCHAR(120) NOT NULL,
  especie VARCHAR(120) NOT NULL,
  fecha_nac DATE NOT NULL,
  sexo VARCHAR(100) NOT NULL,
  raza VARCHAR(200) NOT NULL,
  id_cliente INT NOT NULL,
  CONSTRAINT PK_mascota PRIMARY KEY (id_mascota),
  CONSTRAINT FK_mascota_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Turno_estado
(
  id_turno_estado INT IDENTITY(1,1) NOT NULL,
  estado_turno VARCHAR(100) NOT NULL,
  CONSTRAINT PK_turno_estado PRIMARY KEY (id_turno_estado)
);

CREATE TABLE Rol
(
  id_rol INT IDENTITY(1,1) NOT NULL,
  nombre_rol VARCHAR(120) NOT NULL,
  CONSTRAINT PK_rol PRIMARY KEY (id_rol),
  CONSTRAINT UQ_nombre_rol UNIQUE (nombre_rol)
);

CREATE TABLE Usuario
(
  id_usuario INT IDENTITY (1,1) NOT NULL,
  nombre_usuario VARCHAR(120) NOT NULL,
  contraseña VARCHAR(120) NOT NULL,
  correo VARCHAR(200) NOT NULL,
  num_telefono INT NOT NULL,
  id_rol INT NOT NULL,
  CONSTRAINT PK_usuario PRIMARY KEY (id_usuario),
  CONSTRAINT FK_usuario_rol FOREIGN KEY (id_rol) REFERENCES Rol(id_rol),
  CONSTRAINT UQ_usuario_nombre UNIQUE (nombre_usuario)
);

CREATE TABLE Turno
(
  id_turno INT IDENTITY(1,1) NOT NULL,
  fecha_turno DATE NOT NULL,
  id_turno_estado INT NOT NULL,
  id_usuario INT NOT NULL,
  id_mascota INT NOT NULL,
  CONSTRAINT PK_turno PRIMARY KEY (id_turno),
  CONSTRAINT FK_turno_estado FOREIGN KEY (id_turno_estado) REFERENCES Turno_estado(id_turno_estado),
  CONSTRAINT FK_turno_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
  CONSTRAINT FK_turno_mascota FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota)
);

CREATE TABLE Certificado_Medico
(
  id_certificado_medico INT IDENTITY(1,1) NOT NULL,
  fecha_emision DATE NOT NULL,
  observacion VARCHAR(1000) NOT NULL,
  diagnostico VARCHAR(1000) NOT NULL,
  id_turno INT NOT NULL,
  id_usuario INT NOT NULL,
  CONSTRAINT PK_certificado_medico PRIMARY KEY (id_certificado_medico),
  CONSTRAINT FK_certiciado_medico_turno FOREIGN KEY (id_turno) REFERENCES Turno(id_turno),
  CONSTRAINT FK_certificado_medico_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Medicamento
(
  id_medicamento INT IDENTITY(1,1) NOT NULL,
  nombre_medicamento VARCHAR(120) NOT NULL,
  precio_unitario INT NOT NULL,
  stock INT NOT NULL,
  baja BIT NOT NULL,
  CONSTRAINT PK_medicamento PRIMARY KEY (id_medicamento),
  CONSTRAINT UQ_medicamento_nombre UNIQUE (nombre_medicamento),
  CONSTRAINT CHK_medicamento_stock CHECK (stock > 0)
);

CREATE TABLE Metodo_pago
(
  id_metodo_pago INT IDENTITY(1,1) NOT NULL,
  metodo_pago VARCHAR(120) NOT NULL,
  CONSTRAINT FK_metodo_pago PRIMARY KEY (id_metodo_pago),
  CONSTRAINT UQ_metodo_pago UNIQUE (metodo_pago)
);

CREATE TABLE Factura
(
  id_factura INT IDENTITY(1,1) NOT NULL,
  fecha_emision DATE NOT NULL,
  total INT NOT NULL,
  id_metodo_pago INT NOT NULL,
  id_usuario INT NOT NULL,
  CONSTRAINT PK_factura PRIMARY KEY (id_factura),
  CONSTRAINT FK_factura_metodo_pago FOREIGN KEY (id_metodo_pago) REFERENCES Metodo_pago(id_metodo_pago),
  CONSTRAINT FK_factura_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Medicamento_certificado
(
  dosis INT(120) NOT NULL,
  subtotal INT NOT NULL,
  id_medicamento INT NOT NULL,
  id_certificado_medico INT NOT NULL,
  CONSTRAINT PK_medicamento_certificado PRIMARY KEY (id_medicamento, id_certificado_medico),
  CONSTRAINT FK_medicamento_certificado_medicamento FOREIGN KEY (id_medicamento) REFERENCES Medicamento(id_medicamento),
  CONSTRAINT FK_medicamento_certificado_medico FOREIGN KEY (id_certificado_medico) REFERENCES Certificado_Medico(id_certificado_medico)
);