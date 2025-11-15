CREATE DATABASE DB_Integrador_Grupo37;

USE DB_Integrador_Grupo37
GO

-------------------------------------------------------------------------------
-- CLIENTE

CREATE TABLE Cliente
(
  id_cliente INT IDENTITY (1,1) NOT NULL,
  nombre_apellido_cliente NVARCHAR(120) NOT NULL,
  dni_cliente VARCHAR(20) NOT NULL,
  telefono_cliente VARCHAR(30) NOT NULL,
  correo_cliente NVARCHAR(200) NOT NULL,
  domicilio_cliente NVARCHAR(200) NOT NULL,
  baja BIT NOT NULL DEFAULT 0,
  CONSTRAINT PK_cliente PRIMARY KEY (id_cliente),
  CONSTRAINT UQ_cliente_dni UNIQUE (dni_cliente),
  CONSTRAINT UQ_cliente_correo UNIQUE (correo_cliente)
);
GO

-------------------------------------------------------------------------------
-- ESPECIE

CREATE TABLE Especie
(
  id_especie INT IDENTITY(1,1) NOT NULL,
  nombre_especie NVARCHAR(100) NOT NULL,
  CONSTRAINT PK_especie PRIMARY KEY (id_especie),
  CONSTRAINT UQ_especie UNIQUE (nombre_especie)
);
GO

-------------------------------------------------------------------------------
-- RAZA

CREATE TABLE Raza
(
  id_raza INT IDENTITY(1,1) NOT NULL,
  nombre_raza NVARCHAR(120) NOT NULL,
  id_especie INT NOT NULL,
  CONSTRAINT PK_raza PRIMARY KEY (id_raza),
  CONSTRAINT FK_raza_especie FOREIGN KEY (id_especie) REFERENCES Especie(id_especie),
  CONSTRAINT UQ_raza UNIQUE (nombre_raza, id_especie)
);
GO

-------------------------------------------------------------------------------
-- MASCOTA

CREATE TABLE Mascota
(
  id_mascota INT IDENTITY(1,1) NOT NULL,
  nombre_mascota NVARCHAR(120) NOT NULL,
  fecha_nac DATE NOT NULL,
  sexo NVARCHAR(20) NOT NULL CHECK (sexo IN ('Macho','Hembra')),
  id_raza INT NOT NULL,
  id_cliente INT NOT NULL,
  CONSTRAINT PK_mascota PRIMARY KEY (id_mascota),
  CONSTRAINT FK_mascota_raza FOREIGN KEY (id_raza) REFERENCES Raza(id_raza),
  CONSTRAINT FK_mascota_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);
GO

-------------------------------------------------------------------------------
-- TURNO_ESTADO

CREATE TABLE Turno_estado
(
  id_turno_estado INT IDENTITY(1,1) NOT NULL,
  estado_turno NVARCHAR(100) NOT NULL,
  CONSTRAINT PK_turno_estado PRIMARY KEY (id_turno_estado),
  CONSTRAINT UQ_turno_estado UNIQUE (estado_turno)
);
GO

-------------------------------------------------------------------------------
-- ROL

CREATE TABLE Rol
(
  id_rol INT IDENTITY(1,1) NOT NULL,
  nombre_rol NVARCHAR(120) NOT NULL,
  CONSTRAINT PK_rol PRIMARY KEY (id_rol),
  CONSTRAINT UQ_rol UNIQUE (nombre_rol)
);
GO

-------------------------------------------------------------------------------
-- USUARIO

CREATE TABLE Usuario
(
  id_usuario INT IDENTITY(1,1) NOT NULL,
  nombre_usuario NVARCHAR(120) NOT NULL,
  contraseña NVARCHAR(120) NOT NULL,
  correo NVARCHAR(200) NOT NULL,
  num_telefono NVARCHAR(30) NOT NULL,
  id_rol INT NOT NULL,
  CONSTRAINT PK_usuario PRIMARY KEY (id_usuario),
  CONSTRAINT FK_usuario_rol FOREIGN KEY (id_rol) REFERENCES Rol(id_rol),
  CONSTRAINT UQ_usuario_nombre UNIQUE (nombre_usuario)
);
GO

-------------------------------------------------------------------------------
-- TURNO 

CREATE TABLE Turno
(
  id_turno INT IDENTITY(1,1) NOT NULL,
  fecha_turno DATE NOT NULL,
  hora_turno TIME NOT NULL,
  motivo NVARCHAR(500) NULL,
  id_turno_estado INT NOT NULL,
  id_usuario INT NOT NULL,
  id_mascota INT NOT NULL,
  CONSTRAINT PK_turno PRIMARY KEY (id_turno),
  CONSTRAINT FK_turno_estado FOREIGN KEY (id_turno_estado) REFERENCES Turno_estado(id_turno_estado),
  CONSTRAINT FK_turno_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
  CONSTRAINT FK_turno_mascota FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota)
);
GO

-------------------------------------------------------------------------------
-- CERTIFICADO MÉDICO

CREATE TABLE Certificado_Medico
(
  id_certificado_medico INT IDENTITY(1,1) NOT NULL,
  fecha_emision DATE NOT NULL,
  observacion NVARCHAR(1000) NULL,
  diagnostico NVARCHAR(1000) NULL,
  id_turno INT NOT NULL,
  id_usuario INT NOT NULL,
  CONSTRAINT PK_certificado_medico PRIMARY KEY (id_certificado_medico),
  CONSTRAINT FK_certificado_turno FOREIGN KEY (id_turno) REFERENCES Turno(id_turno),
  CONSTRAINT FK_certificado_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);
GO

-------------------------------------------------------------------------------
-- MEDICAMENTO

CREATE TABLE Medicamento
(
  id_medicamento INT IDENTITY(1,1) NOT NULL,
  nombre_medicamento NVARCHAR(120) NOT NULL,
  precio_unitario DECIMAL(12,2) NOT NULL CHECK (precio_unitario >= 0),
  stock INT NOT NULL CHECK (stock >= 0),
  baja BIT NOT NULL DEFAULT 0,
  CONSTRAINT PK_medicamento PRIMARY KEY (id_medicamento),
  CONSTRAINT UQ_medicamento UNIQUE (nombre_medicamento)
);
GO

-------------------------------------------------------------------------------
-- MEDICAMENTO - CERTIFICADO (relación N:M)

CREATE TABLE Medicamento_certificado
(
  id_medicamento INT NOT NULL,
  id_certificado_medico INT NOT NULL,
  dosis NVARCHAR(120) NOT NULL,
  subtotal DECIMAL(12,2) NOT NULL CHECK (subtotal >= 0),
  CONSTRAINT PK_medicamento_certificado PRIMARY KEY (id_medicamento, id_certificado_medico),
  CONSTRAINT FK_mc_medicamento FOREIGN KEY (id_medicamento) REFERENCES Medicamento(id_medicamento),
  CONSTRAINT FK_mc_certificado FOREIGN KEY (id_certificado_medico) REFERENCES Certificado_Medico(id_certificado_medico)
);
GO

-------------------------------------------------------------------------------
-- MÉTODO DE PAGO

CREATE TABLE Metodo_pago
(
  id_metodo_pago INT IDENTITY(1,1) NOT NULL,
  metodo_pago NVARCHAR(120) NOT NULL,
  CONSTRAINT PK_metodo_pago PRIMARY KEY (id_metodo_pago),
  CONSTRAINT UQ_metodo_pago UNIQUE (metodo_pago)
);
GO

-------------------------------------------------------------------------------
-- FACTURA 

CREATE TABLE Factura
(
  id_factura INT IDENTITY(1,1) NOT NULL,
  fecha_emision DATE NOT NULL DEFAULT GETDATE(),
  total DECIMAL(12,2) NOT NULL CHECK (total >= 0),
  id_metodo_pago INT NOT NULL,
  id_usuario INT NOT NULL,
  id_turno INT NOT NULL,
  id_cliente INT NOT NULL,
  CONSTRAINT PK_factura PRIMARY KEY (id_factura),
  CONSTRAINT FK_factura_metodo FOREIGN KEY (id_metodo_pago) REFERENCES Metodo_pago(id_metodo_pago),
  CONSTRAINT FK_factura_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
  CONSTRAINT FK_factura_turno FOREIGN KEY (id_turno) REFERENCES Turno(id_turno),
  CONSTRAINT FK_factura_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);
GO