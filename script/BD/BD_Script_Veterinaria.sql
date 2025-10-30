CREATE DATABASE DB_Integrador_Grupo37;
USE DB_Integrador_Grupo37;
GO;


--  TABLA: CLIENTE
CREATE TABLE Cliente (
    id_cliente INT IDENTITY(1,1),
    nombre_apellido_cliente NVARCHAR(120) NOT NULL,
    dni_cliente VARCHAR(20) NOT NULL,
    telefono_cliente VARCHAR(30) NULL,
    correo_cliente VARCHAR(200) NOT NULL,
    domicilio_cliente NVARCHAR(200) NULL,
    baja BIT NOT NULL DEFAULT 0,
    CONSTRAINT PK_Cliente PRIMARY KEY (id_cliente),
    CONSTRAINT UQ_Cliente_DNI UNIQUE (dni_cliente),
    CONSTRAINT UQ_Cliente_Correo UNIQUE (correo_cliente),
    CONSTRAINT CHK_Cliente_DNI CHECK (LEN(dni_cliente) >= 7)
);


--  TABLA: MASCOTA_ESTADO
CREATE TABLE Mascota_estado (
    id_mascota_estado INT IDENTITY(1,1),
    estado_mascota NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_Mascota_estado PRIMARY KEY (id_mascota_estado),
    CONSTRAINT UQ_Mascota_estado UNIQUE (estado_mascota)
);

--  TABLA: MASCOTA
CREATE TABLE Mascota (
    id_mascota INT IDENTITY(1,1),
    nombre_mascota NVARCHAR(120) NOT NULL,
    especie NVARCHAR(120) NOT NULL,
    fecha_nac DATE NULL,
    sexo NVARCHAR(20) CONSTRAINT CHK_Mascota_Sexo CHECK (sexo IN ('Macho','Hembra')),
    raza NVARCHAR(200) NULL,
    id_mascota_estado INT NOT NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT PK_Mascota PRIMARY KEY (id_mascota),
    CONSTRAINT FK_Mascota_Estado FOREIGN KEY (id_mascota_estado) REFERENCES Mascota_estado(id_mascota_estado),
    CONSTRAINT FK_Mascota_Cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

--  TABLA: TURNO_ESTADO
CREATE TABLE Turno_estado (
    id_turno_estado INT IDENTITY(1,1),
    estado_turno NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_Turno_estado PRIMARY KEY (id_turno_estado),
    CONSTRAINT UQ_Turno_estado UNIQUE (estado_turno)
);

--  TABLA: ROL
CREATE TABLE Rol (
    id_rol INT IDENTITY(1,1),
    nombre_rol NVARCHAR(120) NOT NULL,
    CONSTRAINT PK_Rol PRIMARY KEY (id_rol),
    CONSTRAINT UQ_Rol UNIQUE (nombre_rol)
);

--  TABLA: EMPLEADO
CREATE TABLE Empleado (
    id_empleado INT IDENTITY(1,1),
    nombre_apellido_empleado NVARCHAR(200) NOT NULL,
    correo_empleado NVARCHAR(120) NOT NULL,
    telefono_empleado VARCHAR(30) NULL,
    baja BIT NOT NULL DEFAULT 0,
    CONSTRAINT PK_Empleado PRIMARY KEY (id_empleado),
    CONSTRAINT UQ_Empleado_Correo UNIQUE (correo_empleado)
);

--  TABLA: VETERINARIO_ESPECIALIDAD
CREATE TABLE Veterinario_especialidad (
    id_veterinario_especialidad INT IDENTITY(1,1),
    especialidad NVARCHAR(120) NOT NULL,
    CONSTRAINT PK_Veterinario_especialidad PRIMARY KEY (id_veterinario_especialidad),
    CONSTRAINT UQ_Veterinario_especialidad UNIQUE (especialidad)
);

--  TABLA: VETERINARIO
CREATE TABLE Veterinario (
    id_veterinario INT IDENTITY(1,1),
    nombre_apellido_veterinario NVARCHAR(120) NOT NULL,
    correo_veterinario NVARCHAR(200) NOT NULL,
    matricula VARCHAR(30) NOT NULL,
    baja BIT NOT NULL DEFAULT 0,
    id_veterinario_especialidad INT NOT NULL,
    CONSTRAINT PK_Veterinario PRIMARY KEY (id_veterinario),
    CONSTRAINT FK_Veterinario_Especialidad FOREIGN KEY (id_veterinario_especialidad) REFERENCES Veterinario_especialidad(id_veterinario_especialidad),
    CONSTRAINT UQ_Veterinario_Correo UNIQUE (correo_veterinario),
    CONSTRAINT UQ_Veterinario_Matricula UNIQUE (matricula)
);

--  TABLA: USUARIO
CREATE TABLE Usuario (
    id_usuario INT IDENTITY(1,1),
    nombre_usuario NVARCHAR(120) NOT NULL,
    contraseña NVARCHAR(120) NOT NULL,
    id_rol INT NOT NULL,
    id_empleado INT NULL,
    id_veterinario INT NULL,
    activo BIT NOT NULL DEFAULT 1,
    CONSTRAINT PK_Usuario PRIMARY KEY (id_usuario),
    CONSTRAINT FK_Usuario_Rol FOREIGN KEY (id_rol) REFERENCES Rol(id_rol),
    CONSTRAINT FK_Usuario_Empleado FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    CONSTRAINT FK_Usuario_Veterinario FOREIGN KEY (id_veterinario) REFERENCES Veterinario(id_veterinario),
    CONSTRAINT UQ_Usuario_Nombre UNIQUE (nombre_usuario)
);

--  TABLA: TURNO
CREATE TABLE Turno (
    id_turno INT IDENTITY(1,1),
    fecha_turno DATETIME NOT NULL CONSTRAINT DF_Turno_Fecha_Turno DEFAULT (GETDATE()),
    id_turno_estado INT NOT NULL,
    id_usuario INT NOT NULL,
    id_veterinario INT NOT NULL,
    id_mascota INT NOT NULL,
    CONSTRAINT PK_Turno PRIMARY KEY (id_turno),
    CONSTRAINT FK_Turno_Estado FOREIGN KEY (id_turno_estado) REFERENCES Turno_estado(id_turno_estado),
    CONSTRAINT FK_Turno_Usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    CONSTRAINT FK_Turno_Veterinario FOREIGN KEY (id_veterinario) REFERENCES Veterinario(id_veterinario),
    CONSTRAINT FK_Turno_Mascota FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota),
    CONSTRAINT CHK_Turno_Fecha CHECK (fecha_turno >= '2025-01-01')
);

--  TABLA: ATENCION
CREATE TABLE Atencion (
    id_atencion INT IDENTITY(1,1),
    fecha_atencion DATETIME NOT NULL CONSTRAINT DF_Atencion_Fecha_Atencion DEFAULT (GETDATE()),
    observacion NVARCHAR(1000) NULL,
    diagnostico NVARCHAR(1000) NULL,
    id_turno INT NULL UNIQUE,
    CONSTRAINT PK_Atencion PRIMARY KEY (id_atencion),
    CONSTRAINT FK_Atencion_Turno FOREIGN KEY (id_turno) REFERENCES Turno(id_turno)
);

--  TABLA: MEDICAMENTO
CREATE TABLE Medicamento (
    id_medicamento INT IDENTITY(1,1),
    nombre_medicamento NVARCHAR(120) NOT NULL,
    presentacion NVARCHAR(120) NOT NULL,
    precio_unitario DECIMAL(12,2) NOT NULL DEFAULT 0,
    stock INT NOT NULL DEFAULT 0,
    baja BIT NOT NULL DEFAULT 0,
    CONSTRAINT PK_Medicamento PRIMARY KEY (id_medicamento),
    CONSTRAINT UQ_Medicamento UNIQUE (nombre_medicamento, presentacion),
    CONSTRAINT CHK_Medicamento_Precio CHECK (precio_unitario >= 0),
    CONSTRAINT CHK_Medicamento_Stock CHECK (stock >= 0)
);

--  TABLA: METODO_PAGO
CREATE TABLE Metodo_pago (
    id_metodo_pago INT IDENTITY(1,1),
    metodo_pago NVARCHAR(120) NOT NULL,
    CONSTRAINT PK_Metodo_pago PRIMARY KEY (id_metodo_pago),
    CONSTRAINT UQ_Metodo_pago UNIQUE (metodo_pago)
);

--  TABLA: ESTADO_PAGO
CREATE TABLE Estado_pago (
    id_estado INT IDENTITY(1,1),
    estado_pago NVARCHAR(120) NOT NULL,
    CONSTRAINT PK_Estado_pago PRIMARY KEY (id_estado),
    CONSTRAINT UQ_Estado_pago UNIQUE (estado_pago)
);

--  TABLA: FACTURA
CREATE TABLE Factura (
    id_factura INT IDENTITY(1,1),
    fecha_emision DATETIME NOT NULL CONSTRAINT DF_Factura_Fecha_Emision DEFAULT (GETDATE()),
    total DECIMAL(12,2) NOT NULL DEFAULT 0,
    id_metodo_pago INT NOT NULL,
    id_estado INT NOT NULL,
    id_atencion INT NOT NULL UNIQUE,
    CONSTRAINT PK_Factura PRIMARY KEY (id_factura),
    CONSTRAINT FK_Factura_Metodo FOREIGN KEY (id_metodo_pago) REFERENCES Metodo_pago(id_metodo_pago),
    CONSTRAINT FK_Factura_Estado FOREIGN KEY (id_estado) REFERENCES Estado_pago(id_estado),
    CONSTRAINT FK_Factura_Atencion FOREIGN KEY (id_atencion) REFERENCES Atencion(id_atencion),
    CONSTRAINT CHK_Factura_Total CHECK (total >= 0)
);

--  TABLA: MEDICAMENTO_ATENCION
CREATE TABLE Medicamento_atencion (
    id_atencion INT NOT NULL,
    id_medicamento INT NOT NULL,
    dosis NVARCHAR(120) NULL,
    cantidad INT NOT NULL,
    precio_unit DECIMAL(12,2) NOT NULL,
    subtotal AS (cantidad * precio_unit) PERSISTED,
    CONSTRAINT PK_Medicamento_atencion PRIMARY KEY (id_atencion, id_medicamento),
    CONSTRAINT FK_MA_Atencion FOREIGN KEY (id_atencion) REFERENCES Atencion(id_atencion),
    CONSTRAINT FK_MA_Medicamento FOREIGN KEY (id_medicamento) REFERENCES Medicamento(id_medicamento),
    CONSTRAINT CHK_MA_Cantidad CHECK (cantidad > 0),
    CONSTRAINT CHK_MA_Precio CHECK (precio_unit > 0)
);
