
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
INSERT INTO CLIENTE (username, direccion, email, contrasena, telefono, rol, coordenadas) VALUES
('user_1', 'Calle 123, Santiago Centro', 'carlos.mendoza@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-1234', 'USER', ST_SetSRID(ST_MakePoint(-70.6450, -33.4550), 4326)),
('user_2', 'Av. Central 45, Providencia', 'lucia.fernandez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-5678', 'ADMIN', ST_SetSRID(ST_MakePoint(-70.6410, -33.4520), 4326)),
('user_3', 'Calle Los Robles 85, Las Condes', 'andres.castillo@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-8765', 'USER', ST_SetSRID(ST_MakePoint(-70.5750, -33.4150), 4326)),
('user_4', 'Av. Los Alamos 10, Ñuñoa', 'maria.lopez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-4321', 'ADMIN', ST_SetSRID(ST_MakePoint(-70.6150, -33.4630), 4326)),
('user_5', 'Calle Primavera 21, Ñuñoa', 'jorge.martinez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-2468', 'USER', ST_SetSRID(ST_MakePoint(-70.6180, -33.4660), 4326)),
('user_6', 'Av. La Esperanza 99, Maipú', 'ana.ruiz@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-1357', 'USER', ST_SetSRID(ST_MakePoint(-70.7550, -33.5020), 4326)),
('user_7', 'Calle Las Palmas 7, Maipú', 'pedro.gonzalez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-9753', 'ADMIN', ST_SetSRID(ST_MakePoint(-70.7570, -33.5070), 4326)),
('user_8', 'Calle San Juan 88, Renca', 'laura.gil@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-3579', 'USER', ST_SetSRID(ST_MakePoint(-70.7300, -33.4000), 4326)),
('user_9', 'Av. Norte 66, Pudahuel', 'sofia.duarte@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-9632', 'ADMIN', ST_SetSRID(ST_MakePoint(-70.8000, -33.4300), 4326)),
('user_10', 'Calle del Sol 41, La Florida', 'ramon.perez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-4682', 'USER', ST_SetSRID(ST_MakePoint(-70.5900, -33.5400), 4326)),
('user_11', 'Av. Oriente 23, La Florida', 'carmen.vazquez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-7524', 'ADMIN', ST_SetSRID(ST_MakePoint(-70.5950, -33.5350), 4326)),
('user_12', 'Calle Pino 12, Peñalolén', 'diego.sanchez@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-6142', 'USER', ST_SetSRID(ST_MakePoint(-70.5500, -33.4900), 4326)),
('user_13', 'Av. Libertad 14, Santiago Centro', 'paula.reyes@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-8237', 'ADMIN', ST_SetSRID(ST_MakePoint(-70.6500, -33.4510), 4326)),
('user_14', 'Calle Nueva 33, Providencia', 'alberto.morales@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-7481', 'USER', ST_SetSRID(ST_MakePoint(-70.6380, -33.4390), 4326)),
('user_15', 'Av. Los Pinos 54, Ñuñoa', 'marta.salinas@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-2153', 'ADMIN', ST_SetSRID(ST_MakePoint(-70.6200, -33.4700), 4326)),
('user_16', 'Calle Cedros 98, Santiago Centro', 'luis.rojas@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-9425', 'USER', ST_SetSRID(ST_MakePoint(-70.6520, -33.4525), 4326)),
('user_17', 'Av. Amanecer 60, Renca', 'gloria.vega@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-7893', 'ADMIN', ST_SetSRID(ST_MakePoint(-70.7280, -33.4020), 4326)),
('user_18', 'Calle Luna 67, Ñuñoa', 'tomas.rivera@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-1568', 'USER', ST_SetSRID(ST_MakePoint(-70.6170, -33.4640), 4326)),
('user_19', 'Av. Principal 5, Maipú', 'isabel.romero@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-8947', 'ADMIN', ST_SetSRID(ST_MakePoint(-70.7500, -33.5000), 4326)),
('user_20', 'Calle Real 19, Peñalolén', 'vicente.navarro@mail.com', '$2a$10$dlbYCOz.DNvH98Aqjm4Yk.wQ6ReUh9yBjrcTLPkNHRDdhE8IIzgS.', '555-3256', 'USER', ST_SetSRID(ST_MakePoint(-70.5450, -33.4920), 4326));

-- Inserción de datos en la tabla Tienda
INSERT INTO TIENDA (nombre, direccion, coordenadas) 
VALUES ('Tienda Costanera Center', 'Av. Andres Bello 2425, Providencia, Santiago', ST_SetSRID(ST_MakePoint(-70.6056, -33.4170), 4326)),
('Tienda La Reina', 'Av. Blest Gana 5962, La Reina, Santiago', ST_SetSRID(ST_MakePoint(-70.5685, -33.4553), 4326)),
('Tienda Las Nieves', 'Los Mallines 1996, Puente Alto, Santiago', ST_SetSRID(ST_MakePoint(-70.57602256706053, -33.59415557033961), 4326)),
('Tienda Maipú', 'Rafael Frontaura 5-99, Maipú, Santiago', ST_SetSRID(ST_MakePoint(-70.75585819880487, -33.514533912551755), 4326)),
('Tienda La Reina', 'Av. Blest Gana 5962, La Reina, Santiago', ST_SetSRID(ST_MakePoint(-70.5685, -33.4553), 4326)),
('TecTec - Tecnología y Computación','Oficina Contable - Ventas Solo en Nuestra Web - Moneda 812, Santiago, Región Metropolitana', ST_SetSRID(ST_MakePoint(-70.64745903544836, -33.44157280323984), 4326)),
('ABCDIN Estado', 'Paseo Estado 73, 8320256 Santiago, Región Metropolitana',ST_SetSRID(ST_MakePoint(-70.64899653193504, -33.44174084107714), 4326)),
('Tecnodetodo', 'Av. Domingo Sta. María 3584, 8640722 Renca, Región Metropolitana', ST_SetSRID(ST_MakePoint(-70.69452693082134, -33.40700876892923), 4326)),
('Techcenter', 'San Diego 335, 8320000 Santiago, Región Metropolitana', ST_SetSRID(ST_MakePoint(-70.65089521869716, -33.4484501686001), 4326)),
('Tecnozona', 'Francisco Bilbao 1344, Local 103, 7500000 Providencia, Región Metropolitana', ST_SetSRID(ST_MakePoint(-70.6096002299189, -33.437859593913444), 4326)),
('Informatica y electronica Lufraja - Punto Blue express', 'Alberdi 01781, 8500020 Santiago, Quinta Normal, Región Metropolitana', ST_SetSRID(ST_MakePoint(-70.70295864279399, -33.42567739504398), 4326));

-- Inserción de datos en la tabla Repartidor
INSERT INTO REPARTIDOR (nombre, coordenadas)
VALUES ('Tomás Soto', ST_SetSRID(ST_MakePoint(-70.60836609, -33.50862745), 4326)),
('Carlos Barra', ST_SetSRID(ST_MakePoint(-70.6453284199841, -33.45860089018716), 4326)),
('Benjamín Tapia', ST_SetSRID(ST_MakePoint(-70.7103335299697, -33.50162765386649), 4326)),
('Andrés Garrido', ST_SetSRID(ST_MakePoint(-70.57405727196812, -33.54751053310172), 4326));

-- Inserción de datos en la tabla Orden
INSERT INTO ORDEN (estado, id_cliente, total, id_repartidor, id_tienda) VALUES
('Enviada', 10, 24000, 1, 2),
('Completada', 1, 30000, 2, 1),
('Enviada', 4, 5600, 3, 1),
('Enviada', 16, 12000, 4, 1),
('Completada', 1, 44000, 1, 1);

-- Inserción de datos en la tabla Poligono
INSERT INTO ZONA_REPARTO (nombre, poligono)
VALUES ('Poligono Centro', ST_SetSRID(ST_MakePolygon(ST_GeomFromText('LINESTRING(-70.68965994719805 -33.419622713280866, -70.63343880436038 -33.436767034525424, -70.60684528230406 -33.41658069751892, -70.58021703839037 -33.48742592788876, -70.69165479386703 -33.49488968909503, -70.68965994719805 -33.419622713280866)')), 4326)),
('Poligono Puente Alto', ST_SetSRID(ST_MakePolygon(ST_GeomFromText('LINESTRING(-70.55608391865024 -33.54342781519428, -70.6196885668074 -33.54201144195442, -70.59856793794873 -33.62695273425572, -70.53423499229359 -33.6061296330255, -70.55608391865024 -33.54342781519428)')), 4326)),
('Poligono Santiago', ST_SetSRID(ST_MakePolygon(ST_GeomFromText('LINESTRING(-70.76233181623087 -33.383944888168216, -70.66545818578015 -33.36756690642463, -70.60721514415948 -33.38642613149192, -70.54203392164673 -33.329007657048415, -70.49355731556004 -33.33735851993195, -70.53503729769275 -33.609990046732385, -70.7064545773473 -33.644944725790786, -70.86187957211999 -33.5750211910383, -70.76233181623087 -33.383944888168216)')), 4326));