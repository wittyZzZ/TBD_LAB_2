
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
INSERT INTO CLIENTE (username, direccion, email, contrasena, telefono, rol, coordenadas, latitude, longitude) VALUES
('user_1', 'Calle 123, Santiago Centro', 'carlos.mendoza@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-1234', 'USER', ST_SetSRID(ST_MakePoint(-70.6450, -33.4550), 4326), -33.4550, -70.6450),
('user_2', 'Av. Central 45, Providencia', 'lucia.fernandez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-5678', 'ADMIN', ST_SetSRID(ST_MakePoint(-70.6410, -33.4520), 4326), -33.4520, -70.6410),
('user_3', 'Calle Los Robles 85, Las Condes', 'andres.castillo@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-8765', 'USER', ST_SetSRID(ST_MakePoint(-70.5750, -33.4150), 4326), -33.4150, -70.5750),
('user_4', 'Av. Los Alamos 10, Ñuñoa', 'maria.lopez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-4321', 'ADMIN', ST_SetSRID(ST_MakePoint(-70.6150, -33.4630), 4326), -33.4630, -70.6150),
('user_5', 'Calle Primavera 21, Ñuñoa', 'jorge.martinez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-2468', 'USER', ST_SetSRID(ST_MakePoint(-70.6180, -33.4660), 4326), -33.4660, -70.6180),
('user_6', 'Av. La Esperanza 99, Maipú', 'ana.ruiz@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-1357', 'USER', ST_SetSRID(ST_MakePoint(-70.7550, -33.5020), 4326), -33.5020, -70.7550),
('user_7', 'Calle Las Palmas 7, Maipú', 'pedro.gonzalez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-9753', 'ADMIN', ST_SetSRID(ST_MakePoint(-70.7570, -33.5070), 4326), -33.5070, -70.7570),
('user_8', 'Calle San Juan 88, Renca', 'laura.gil@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-3579', 'USER', ST_SetSRID(ST_MakePoint(-70.7300, -33.4000), 4326), -33.4000, -70.7300),
('user_9', 'Av. Norte 66, Pudahuel', 'sofia.duarte@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-9632', 'ADMIN', ST_SetSRID(ST_MakePoint(-70.8000, -33.4300), 4326), -33.4300, -70.8000),
('user_10', 'Calle del Sol 41, La Florida', 'ramon.perez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-4682', 'USER', ST_SetSRID(ST_MakePoint(-70.5900, -33.5400), 4326), -33.5400, -70.5900),
('user_11', 'Av. Oriente 23, La Florida', 'carmen.vazquez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-7524', 'ADMIN', ST_SetSRID(ST_MakePoint(-70.5950, -33.5350), 4326), -33.5350, -70.5950),
('user_12', 'Calle Pino 12, Peñalolén', 'diego.sanchez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-6142', 'USER', ST_SetSRID(ST_MakePoint(-70.5500, -33.4900), 4326), -33.4900, -70.5500),
('user_13', 'Av. Libertad 14, Santiago Centro', 'paula.reyes@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-8237', 'ADMIN', ST_SetSRID(ST_MakePoint(-70.6500, -33.4510), 4326), -33.4510, -70.6500),
('user_14', 'Calle Nueva 33, Providencia', 'alberto.morales@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-7481', 'USER', ST_SetSRID(ST_MakePoint(-70.6380, -33.4390), 4326), -33.4390, -70.6380),
('user_15', 'Av. Los Pinos 54, Ñuñoa', 'marta.salinas@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-2153', 'ADMIN', ST_SetSRID(ST_MakePoint(-70.6200, -33.4700), 4326), -33.4700, -70.6200),
('user_16', 'Calle Cedros 98, Santiago Centro', 'luis.rojas@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-9425', 'USER', ST_SetSRID(ST_MakePoint(-70.6520, -33.4525), 4326), -33.4525, -70.6520),
('user_17', 'Av. Amanecer 60, Renca', 'gloria.vega@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-7893', 'ADMIN', ST_SetSRID(ST_MakePoint(-70.7280, -33.4020), 4326), -33.4020, -70.7280),
('user_18', 'Calle Luna 67, Ñuñoa', 'tomas.rivera@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-1568', 'USER', ST_SetSRID(ST_MakePoint(-70.6170, -33.4640), 4326), -33.4640, -70.6170),
('user_19', 'Av. Principal 5, Maipú', 'isabel.romero@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-8947', 'ADMIN', ST_SetSRID(ST_MakePoint(-70.7500, -33.5000), 4326), -33.5000, -70.7500),
('user_20', 'Calle Real 19, Peñalolén', 'vicente.navarro@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-3256', 'USER', ST_SetSRID(ST_MakePoint(-70.5450, -33.4920), 4326), -33.4920, -70.5450);

-- Inserción de datos en la tabla Tienda
INSERT INTO tienda (nombre, direccion, coordenadas, latitude, longitude) 
VALUES ('Tienda Costanera Center', 'Av. Andres Bello 2425, Providencia, Santiago', ST_SetSRID(ST_MakePoint(-70.6056, -33.4170), 4326), -70.6056, -33.4170);


