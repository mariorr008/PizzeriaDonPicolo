USE pizzeria_don_piccolo;

-- ============================================================
-- PERSONA 
-- ============================================================
INSERT INTO persona (nombre, telefono, direccion, email, tipo_persona, fecha_registro) VALUES
('Juan Pérez', '3001234567', 'Cra 10 #15-20', 'juan.perez@mail.com', 'cliente', '2026-01-05 10:00:00'),
('María Rodríguez', '3012345678', 'Cll 45 #8-12', 'maria.rodriguez@mail.com', 'cliente', '2026-01-06 11:15:00'),
('Carlos Gómez', '3023456789', 'Cra 27 #33-10', 'carlos.gomez@mail.com', 'cliente', '2026-01-08 09:30:00'),
('Laura Martínez', '3034567890', 'Cll 56 #19-45', 'laura.martinez@mail.com', 'cliente', '2026-01-10 14:20:00'),
('Andrés Torres', '3045678901', 'Cra 33 #45-60', 'andres.torres@mail.com', 'cliente', '2026-01-12 08:00:00'),
('Camila Ramírez', '3056789012', 'Cll 30 #22-18', 'camila.ramirez@mail.com', 'cliente', '2026-01-14 17:45:00'),
('Diego Herrera', '3067890123', 'Cra 15 #70-05', 'diego.herrera@mail.com', 'cliente', '2026-01-15 12:10:00'),
('Valentina López', '3078901234', 'Cll 9 #12-33', 'valentina.lopez@mail.com', 'cliente', '2026-01-18 19:00:00'),
('Santiago Morales', '3089012345', 'Cra 21 #50-14', 'santiago.morales@mail.com', 'cliente', '2026-01-20 13:25:00'),
('Isabella Castro', '3090123456', 'Cll 65 #11-40', 'isabella.castro@mail.com', 'cliente', '2026-01-22 20:05:00'),
('Felipe Vargas', '3101234567', 'Cra 8 #18-27', 'felipe.vargas@mail.com', 'cliente', '2026-01-25 10:50:00'),
('Daniela Ortiz', '3112345678', 'Cll 100 #7-23', 'daniela.ortiz@mail.com', 'cliente', '2026-01-27 16:40:00'),
('Sebastián Rojas', '3123456789', 'Cra 45 #12-08', 'sebastian.rojas@mail.com', 'cliente', '2026-01-28 09:15:00'),
('Mariana Suárez', '3134567890', 'Cll 72 #14-16', 'mariana.suarez@mail.com', 'cliente', '2026-01-30 18:30:00'),
('Nicolás Jiménez', '3145678901', 'Cra 19 #60-33', 'nicolas.jimenez@mail.com', 'cliente', '2026-02-01 11:05:00'),
('Jorge Medina', '3156789012', 'Cll 22 #9-11', 'jorge.medina@mail.com', 'repartidor', '2025-11-01 08:00:00'),
('Paula Cárdenas', '3167890123', 'Cra 30 #24-19', 'paula.cardenas@mail.com', 'repartidor', '2025-11-03 08:00:00'),
('Miguel Ángel Duarte', '3178901234', 'Cll 48 #16-27', 'miguel.duarte@mail.com', 'repartidor', '2025-11-05 08:00:00'),
('Lorena Peña', '3189012345', 'Cra 12 #40-08', 'lorena.pena@mail.com', 'repartidor', '2025-11-07 08:00:00'),
('Julián Rueda', '3190123456', 'Cll 60 #10-30', 'julian.rueda@mail.com', 'repartidor', '2025-11-10 08:00:00'),
('Tatiana Villamizar', '3201234567', 'Cra 24 #33-45', 'tatiana.villamizar@mail.com', 'repartidor', '2025-11-12 08:00:00'),
('Esteban Prada', '3212345678', 'Cll 14 #8-19', 'esteban.prada@mail.com', 'repartidor', '2025-11-14 08:00:00'),
('Natalia Camacho', '3223456789', 'Cra 36 #20-12', 'natalia.camacho@mail.com', 'repartidor', '2025-11-16 08:00:00'),
('Ricardo Serrano', '3234567890', 'Cll 5 #22-40', 'ricardo.serrano@mail.com', 'repartidor', '2025-11-18 08:00:00'),
('Adriana Flórez', '3245678901', 'Cra 17 #55-08', 'adriana.florez@mail.com', 'repartidor', '2025-11-20 08:00:00'),
('Óscar Niño', '3256789012', 'Cll 41 #9-27', 'oscar.nino@mail.com', 'repartidor', '2025-11-22 08:00:00'),
('Carolina Ardila', '3267890123', 'Cra 28 #14-33', 'carolina.ardila@mail.com', 'repartidor', '2025-11-24 08:00:00'),
('Fabián Delgado', '3278901234', 'Cll 33 #18-15', 'fabian.delgado@mail.com', 'repartidor', '2025-11-26 08:00:00'),
('Sofía Contreras', '3289012345', 'Cra 6 #44-21', 'sofia.contreras@mail.com', 'repartidor', '2025-11-28 08:00:00'),
('Iván Guerrero', '3290123456', 'Cll 52 #12-09', 'ivan.guerrero@mail.com', 'repartidor', '2025-11-30 08:00:00');

-- ============================================================
-- CLIENTES
-- ============================================================
INSERT INTO clientes (id_persona) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15);

-- ============================================================
-- REPARTIDORES
-- ============================================================
INSERT INTO repartidores (id_persona, zona, estado) VALUES
(16, 'Norte', 'disponible'),
(17, 'Sur', 'disponible'),
(18, 'Centro', 'no disponible'),
(19, 'Cabecera', 'disponible'),
(20, 'Provenza', 'disponible'),
(21, 'Norte', 'no disponible'),
(22, 'Sur', 'disponible'),
(23, 'Centro', 'disponible'),
(24, 'Cabecera', 'disponible'),
(25, 'Provenza', 'no disponible'),
(26, 'Norte', 'disponible'),
(27, 'Sur', 'disponible'),
(28, 'Centro', 'disponible'),
(29, 'Cabecera', 'no disponible'),
(30, 'Provenza', 'disponible');

-- ============================================================
-- PIZZAS
-- ============================================================
INSERT INTO pizzas (nombre, tamano, precio_base, tipo, activa) VALUES
('Margarita', 'mediana', 18000, 'clasica', TRUE),
('Hawaiana', 'mediana', 20000, 'clasica', TRUE),
('Pepperoni', 'mediana', 19000, 'clasica', TRUE),
('Cuatro Quesos', 'grande', 25000, 'especial', TRUE),
('Vegetariana Deluxe', 'grande', 24000, 'vegetariana', TRUE),
('Napolitana', 'personal', 14000, 'clasica', TRUE),
('BBQ Pollo', 'grande', 26000, 'especial', TRUE),
('Champiñones', 'mediana', 19500, 'vegetariana', TRUE),
('Especial Don Piccolo', 'familiar', 32000, 'especial', TRUE),
('Carnívora', 'familiar', 34000, 'especial', TRUE),
('Rúcula y Jamón', 'grande', 27000, 'especial', TRUE),
('Mexicana', 'mediana', 21000, 'especial', TRUE),
('Espinaca y Ricotta', 'mediana', 20500, 'vegetariana', TRUE),
('Margarita Familiar', 'familiar', 28000, 'clasica', TRUE),
('Prosciutto', 'grande', 29000, 'especial', TRUE);

-- ============================================================
-- INGREDIENTES 
-- ============================================================
INSERT INTO ingredientes (nombre, stock, stock_minimo, unidad, costo_unitario) VALUES
('Queso Mozzarella', 50, 10, 'kg', 18000),
('Salsa de Tomate', 40, 8, 'l', 8000),
('Masa de Pizza', 100, 20, 'unidad', 2500),
('Jamón', 25, 5, 'kg', 22000),
('Piña', 15, 5, 'kg', 6000),
('Pepperoni', 20, 5, 'kg', 25000),
('Champiñones', 12, 5, 'kg', 9000),
('Pimentón', 18, 5, 'kg', 5000),
('Cebolla', 22, 5, 'kg', 3000),
('Pollo BBQ', 16, 5, 'kg', 15000),
('Aceitunas', 8, 3, 'kg', 12000),
('Rúcula', 6, 3, 'kg', 10000),
('Ricotta', 10, 3, 'kg', 16000),
('Espinaca', 9, 3, 'kg', 7000),
('Prosciutto', 7, 3, 'kg', 30000);

-- ============================================================
-- PIZZA_INGREDIENTE 
-- ============================================================
INSERT INTO pizza_ingrediente (id_pizza, id_ingrediente, cantidad) VALUES
(1, 1, 0.20), (1, 2, 0.15), (1, 3, 1.00),
(2, 1, 0.20), (2, 4, 0.15), (2, 5, 0.10),
(3, 1, 0.20), (3, 6, 0.15),
(4, 1, 0.30), (4, 13, 0.10),
(5, 7, 0.10), (5, 8, 0.10), (5, 9, 0.10),
(7, 10, 0.20),
(8, 7, 0.15),
(9, 1, 0.25), (9, 4, 0.10),
(10, 6, 0.15), (10, 10, 0.15),
(11, 12, 0.10), (11, 4, 0.15),
(15, 15, 0.12);

-- ============================================================
-- PEDIDOS
-- ============================================================
INSERT INTO pedidos (id_cliente, fecha_hora, metodo_pago, estado, total) VALUES
(1, '2026-08-01 12:30:00', 'efectivo', 'entregado', 41000),
(2, '2026-08-02 13:10:00', 'tarjeta', 'entregado', 58000),
(3, '2026-08-03 19:45:00', 'app', 'entregado', 32000),
(4, '2026-08-04 20:15:00', 'tarjeta', 'entregado', 66000),
(5, '2026-08-05 12:05:00', 'efectivo', 'entregado', 24000),
(6, '2026-08-06 18:30:00', 'app', 'cancelado', 27000),
(7, '2026-08-07 21:00:00', 'tarjeta', 'entregado', 48000),
(8, '2026-08-08 13:40:00', 'efectivo', 'en preparacion', 34000),
(9, '2026-08-09 19:20:00', 'app', 'entregado', 70000),
(10, '2026-08-10 12:50:00', 'tarjeta', 'entregado', 39000),
(11, '2026-08-11 20:35:00', 'efectivo', 'pendiente', 52000),
(12, '2026-08-12 13:00:00', 'app', 'entregado', 21000),
(13, '2026-08-13 19:55:00', 'tarjeta', 'entregado', 60000),
(14, '2026-08-14 12:15:00', 'efectivo', 'entregado', 28000),
(15, '2026-08-15 21:10:00', 'app', 'entregado', 45000);

-- ============================================================
-- DETALLE_PEDIDO
-- ============================================================
INSERT INTO detalle_pedido (id_pedido, id_pizza, cantidad, precio_unitario) VALUES
(1, 1, 1, 18000), (1, 6, 1, 14000),
(2, 4, 1, 25000), (2, 3, 1, 19000),
(3, 2, 1, 20000),
(4, 9, 1, 32000), (4, 6, 1, 14000),
(5, 8, 1, 19500),
(7, 7, 1, 26000), (7, 6, 1, 14000),
(8, 12, 1, 21000),
(9, 10, 1, 34000), (9, 3, 1, 19000),
(10, 5, 1, 24000),
(12, 13, 1, 20500),
(13, 9, 1, 32000),
(14, 1, 1, 18000),
(15, 15, 1, 29000);

-- ============================================================
-- DOMICILIOS
-- ============================================================
INSERT INTO domicilios (id_pedido, id_repartidor, hora_salida, hora_entrega, distancia_km, costo_envio) VALUES
(1, 1, '2026-08-01 12:35:00', '2026-08-01 12:58:00', 3.2, 4000),
(2, 2, '2026-08-02 13:15:00', '2026-08-02 13:40:00', 4.5, 5000),
(3, 3, '2026-08-03 19:50:00', '2026-08-03 20:10:00', 2.1, 3000),
(4, 4, '2026-08-04 20:20:00', '2026-08-04 20:50:00', 6.0, 6500),
(5, 5, '2026-08-05 12:10:00', '2026-08-05 12:30:00', 1.8, 3000),
(7, 7, '2026-08-07 21:05:00', '2026-08-07 21:28:00', 3.9, 4500),
(8, 8, '2026-08-08 13:45:00', NULL, 2.7, 3500),
(9, 9, '2026-08-09 19:25:00', '2026-08-09 19:55:00', 7.1, 7000),
(10, 10, '2026-08-10 12:55:00', '2026-08-10 13:18:00', 3.4, 4000),
(12, 12, '2026-08-12 13:05:00', '2026-08-12 13:22:00', 2.0, 3000),
(13, 13, '2026-08-13 20:00:00', '2026-08-13 20:26:00', 5.5, 6000),
(14, 14, '2026-08-14 12:20:00', '2026-08-14 12:42:00', 3.0, 4000),
(15, 15, '2026-08-15 21:15:00', '2026-08-15 21:40:00', 6.3, 6500);

-- ============================================================
-- PAGOS 
-- ============================================================
INSERT INTO pagos (id_pedido, monto, metodo_pago, fecha_pago) VALUES
(1, 41000, 'efectivo', '2026-08-01 12:58:00'),
(2, 58000, 'tarjeta', '2026-08-02 13:40:00'),
(3, 32000, 'app', '2026-08-03 20:10:00'),
(4, 66000, 'tarjeta', '2026-08-04 20:50:00'),
(5, 24000, 'efectivo', '2026-08-05 12:30:00'),
(7, 48000, 'tarjeta', '2026-08-07 21:28:00'),
(8, 34000, 'efectivo', '2026-08-08 13:45:00'),
(10, 39000, 'tarjeta', '2026-08-10 13:18:00'),
(12, 21000, 'app', '2026-08-12 13:22:00'),
(13, 60000, 'tarjeta', '2026-08-13 20:26:00'),
(14, 28000, 'efectivo', '2026-08-14 12:42:00'),
(15, 45000, 'app', '2026-08-15 21:40:00');

-- ============================================================
-- HISTORIAL_PRECIOS 
-- ============================================================
INSERT INTO historial_precios (id_pizza, precio_anterior, precio_nuevo, fecha_cambio) VALUES
(1, 17000, 18000, '2026-03-01 09:00:00'),
(2, 19000, 20000, '2026-03-02 09:00:00'),
(3, 18000, 19000, '2026-03-03 09:00:00'),
(4, 23000, 25000, '2026-03-05 09:00:00'),
(5, 22000, 24000, '2026-03-06 09:00:00'),
(6, 13000, 14000, '2026-03-07 09:00:00'),
(7, 24000, 26000, '2026-03-08 09:00:00'),
(8, 18000, 19500, '2026-03-09 09:00:00'),
(9, 30000, 32000, '2026-03-10 09:00:00'),
(10, 32000, 34000, '2026-03-11 09:00:00'),
(11, 25000, 27000, '2026-03-12 09:00:00'),
(12, 19500, 21000, '2026-03-13 09:00:00'),
(13, 19000, 20500, '2026-03-14 09:00:00'),
(14, 26000, 28000, '2026-03-15 09:00:00'),
(15, 27000, 29000, '2026-03-16 09:00:00');