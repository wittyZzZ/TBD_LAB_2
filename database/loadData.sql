
-- Creación de la base de datos
\c tbd_lab_1

\encoding UTF8

insert into CATEGORIA (id_categoria, nombre)
values (1, 'Tecnología'),
       (2, 'Electrodomésticos'),
       (3, 'Muebles para Oficina'),
       (4, 'Accesorios para Vehículos');

insert into PRODUCTO (nombre, descripcion, precio, stock, estado, id_categoria)
values ('Mouse Silencioso RGB',
 	'Mouse Silencioso RGB\nMarca: Generic\nModel: SMRGBCD001\nDescripción: Mouse inhalámbrico de botones silenciosos y luces RGB',
 	4500, 12, 'Disponible', 1),
	('Teclado DELL',
 	'Teclado inhalámbrico DELL\nMarca: DELL\nModel: KM632\nDescripción: Teclado inhalámbrico DELL distribución Latinoamericana con pad numérico',
	 23000, 5, 'Disponible', 1),
	('Notebook Asus Gamer',
	 'Notebook para juegos con gráfica integrada',
	 500000, 3, 'Disponible', 1),
	('Pendrive 32 GB',
 	'Este dispositivo posee una gran velocidad para transferir datos',
	 6500, 20, 'Disponible', 1),
	('Batería portátil',
	 'Esta batería te permite llevar contigo sin preocupaciones tus dispositivos por un largo período de tiempo',
	 500000, 4, 'Disponible', 1),
	('Computador Gamer Ryzen 5500',
	 'Computador diseñado para videojuegos de altos requisitos junto con una NVIDIA 3060',
	 720000, 1, 'Disponible', 1),
	('Smartphone Samsung Galaxy A52',
 	'Teléfono inteligente con pantalla AMOLED y cámara de alta resolución',
 	280000, 10, 'Disponible', 1),
	('Audífonos Bluetooth Sony WH-1000XM4',
 	'Audífonos inalámbricos con cancelación de ruido y sonido de alta fidelidad',
 	150000, 8, 'Disponible', 1),
	('Refrigerador LG InstaView',
	 'Refrigerador de alta capacidad con panel táctil y eficiencia energética clase A++',
	 900000, 3, 'Disponible', 2),
	('Horno Microondas Panasonic',
	 'Horno microondas con múltiples configuraciones y grill integrado',
	 120000, 7, 'Disponible', 2),
	('Escritorio Ejecutivo',
 	'Escritorio de madera con acabado premium y amplio espacio de almacenamiento',
 	180000, 5, 'Disponible', 3),
	('Silla Ergonómica para Oficina',
	 'Silla ergonómica con soporte lumbar ajustable y reposabrazos',
	 85000, 10, 'Disponible', 3),	
	('Cargador Rápido para Auto',
	 'Cargador rápido USB con soporte para carga dual',
	 12000, 15, 'Disponible', 4);
		
-- Inserción de datos en la tabla CLIENTE sin caracteres especiales
INSERT INTO CLIENTE (username, direccion, email, contrasena, telefono, rol) VALUES
('user_1', 'Calle 123, Ciudad A', 'carlos.mendoza@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-1234', 'USER'),
('user_2', 'Av. Central 45, Ciudad B', 'lucia.fernandez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-5678', 'ADMIN'),
('user_3', 'Calle Los Robles 85, Ciudad C', 'andres.castillo@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-8765', 'USER'),
('user_4', 'Av. Los Alamos 10, Ciudad D', 'maria.lopez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-4321', 'ADMIN'),
('user_5', 'Calle Primavera 21, Ciudad E', 'jorge.martinez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-2468', 'USER'),
('user_6', 'Av. La Esperanza 99, Ciudad F', 'ana.ruiz@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-1357', 'USER'),
('user_7', 'Calle Las Palmas 7, Ciudad G', 'pedro.gonzalez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-9753', 'ADMIN'),
('user_8', 'Calle San Juan 88, Ciudad H', 'laura.gil@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-3579', 'USER'),
('user_9', 'Av. Norte 66, Ciudad I', 'sofia.duarte@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-9632', 'ADMIN'),
('user_10', 'Calle del Sol 41, Ciudad J', 'ramon.perez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-4682', 'USER'),
('user_11', 'Av. Oriente 23, Ciudad K', 'carmen.vazquez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-7524', 'ADMIN'),
('user_12', 'Calle Pino 12, Ciudad L', 'diego.sanchez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-6142', 'USER'),
('user_13', 'Av. Libertad 14, Ciudad M', 'paula.reyes@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-8237', 'ADMIN'),
('user_14', 'Calle Nueva 33, Ciudad N', 'alberto.morales@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-7481', 'USER'),
('user_15', 'Av. Los Pinos 54, Ciudad O', 'marta.salinas@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-2153', 'ADMIN'),
('user_16', 'Calle Cedros 98, Ciudad P', 'luis.rojas@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-9425', 'USER'),
('user_17', 'Av. Amanecer 60, Ciudad Q', 'gloria.vega@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-7893', 'ADMIN'),
('user_18', 'Calle Luna 67, Ciudad R', 'tomas.rivera@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-1568', 'USER'),
('user_19', 'Av. Principal 5, Ciudad S', 'isabel.romero@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-8947', 'ADMIN'),
('user_20', 'Calle Real 19, Ciudad T', 'vicente.navarro@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-3256', 'USER');

