-- Eliminar la base de datos si ya existe
DROP DATABASE IF EXISTS tbd_lab_1;

-- Crear la base de datos
CREATE DATABASE tbd_lab_1;

-- Conectarse a la nueva base de datos
\c tbd_lab_1

-- Inicio de la creación de tablas
BEGIN;

CREATE TABLE IF NOT EXISTS CATEGORIA
(
    id_categoria serial NOT NULL PRIMARY KEY,
    nombre varchar(100)
);
--comment on table public.categoria is 'blabla';

CREATE TABLE IF NOT EXISTS PRODUCTO
(
    id_producto serial NOT NULL PRIMARY KEY,
    nombre varchar(255),
    descripcion text,
    precio decimal(10,2),
    stock int,
    estado varchar(50),
    id_categoria integer,
    foreign key (id_categoria) references CATEGORIA(id_categoria)
);

CREATE TABLE IF NOT EXISTS CLIENTE
(
    id_cliente serial NOT NULL PRIMARY KEY,
    username varchar(255),
    direccion varchar(255),
    email varchar(100),
    contrasena varchar(100),
    telefono varchar(20),
    rol varchar(20)
);

CREATE TABLE IF NOT EXISTS ORDEN
(
    id_orden serial NOT NULL PRIMARY KEY,
    fecha_orden timestamp,
    estado varchar(50),
    id_cliente integer,
    total decimal(10, 2),
    FOREIGN KEY(id_cliente) references CLIENTE(id_cliente)
);

CREATE TABLE IF NOT EXISTS DETALLE_ORDEN
(
    id_detalle serial NOT NULL PRIMARY KEY,
    id_orden integer,
    id_producto integer,
    cantidad int,
    precio_unitario decimal(10,2),
    FOREIGN KEY(id_orden) references ORDEN(id_orden),
    FOREIGN KEY(id_producto) references PRODUCTO(id_producto)
);

-- Se crea una tabla para llevar registro de las llamadas de insercion, actualizacion o eliminacion realizadas en el backend

CREATE TABLE IF NOT EXISTS audit_log
(
    id_log serial PRIMARY KEY,
    tabla VARCHAR(50),
    operacion VARCHAR(10),
    datos JSONB,
    usuario VARCHAR(255),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

END;