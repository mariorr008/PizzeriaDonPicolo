
-- CONSULTA 1: Clientes con pedidos entre dos fechas (BETWEEN)
-- ============================================================
SELECT 
    c.id AS id_cliente,
    ps.nombre AS nombre_cliente,
    ps.telefono,
    ps.email,
    p.fecha_hora
FROM clientes c
LEFT JOIN persona ps ON c.id_persona = ps.id
LEFT JOIN pedidos p ON c.id = p.id_cliente
WHERE p.fecha_hora BETWEEN '2026-08-01' AND '2026-08-10';



-- CONSULTA 2: Pizzas mas vendidas (GROUP BY y COUNT)
-- ============================================================
SELECT 
    pz.id AS id_pizza,
    pz.nombre AS nombre_pizza,
    pz.tamano,
    pz.precio_base,
    COUNT(dp.id_pedido) AS veces_pedida,
    SUM(dp.cantidad * dp.precio_unitario) AS total_ventas
FROM pizzas pz
LEFT JOIN detalle_pedido dp ON pz.id = dp.id_pizza
LEFT JOIN pedidos p ON dp.id_pedido = p.id
GROUP BY pz.id, pz.nombre, pz.tamano, pz.precio_base
ORDER BY veces_pedida DESC;



-- CONSULTA 3: Pedidos por repartidor (JOIN)
-- ============================================================
SELECT 
    r.id AS id_repartidor,
    ps.nombre AS nombre_repartidor,
    r.zona,
    COUNT(d.id) AS total_entregas
FROM repartidores r
LEFT JOIN persona ps ON r.id_persona = ps.id
LEFT JOIN domicilios d ON r.id = d.id_repartidor
GROUP BY r.id, ps.nombre, r.zona
ORDER BY total_entregas DESC;



-- CONSULTA 4: Promedio de entrega por zona (AVG y JOIN)
-- ============================================================
SELECT 
    r.zona,
    COUNT(d.id) AS total_entregas,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, d.hora_salida, d.hora_entrega)), 2) AS tiempo_promedio_minutos,
    ROUND(AVG(d.distancia_km), 2) AS distancia_promedio_km,
FROM repartidores r
LEFT JOIN domicilios d ON r.id = d.id_repartidor
WHERE d.hora_entrega IS NOT NULL
GROUP BY r.zona
ORDER BY tiempo_promedio_minutos ASC;



-- CONSULTA 5: Clientes que gastaron mas de un monto (HAVING)
-- ============================================================
SELECT 
    c.id AS id_cliente,
    ps.nombre AS nombre_cliente,
    ps.telefono,
    ps.email,
    COUNT(p.id) AS total_pedidos,
    SUM(p.total) AS total_gastado
FROM clientes c
LEFT JOIN persona ps ON c.id_persona = ps.id
LEFT JOIN pedidos p ON c.id = p.id_cliente
GROUP BY c.id, ps.nombre, ps.telefono, ps.email
HAVING total_gastado > 50000
ORDER BY total_gastado DESC;



-- CONSULTA 6: Busqueda por coincidencia parcial de nombre de pizza (LIKE)
-- ============================================================
SELECT 
    id AS id_pizza,
    nombre AS nombre_pizza,
    tamano,
    precio_base,
    tipo,
    activa
FROM pizzas
WHERE nombre LIKE '%Margarita%'
ORDER BY nombre;



-- CONSULTA 7: Subconsulta para obtener los clientes frecuentes (mas de 5 pedidos mensuales)
-- ============================================================
SELECT 
    c.id AS id_cliente,
    ps.nombre AS nombre_cliente,
    ps.telefono,
    ps.email,
    YEAR(p.fecha_hora) AS año,
    MONTH(p.fecha_hora) AS mes,
    COUNT(p.id) AS pedidos_mes,
    SUM(p.total) AS total_gastado_mes
FROM clientes c
LEFT JOIN persona ps ON c.id_persona = ps.id
LEFT JOIN pedidos p ON c.id = p.id_cliente
GROUP BY c.id, ps.nombre, ps.telefono, ps.email, YEAR(p.fecha_hora), MONTH(p.fecha_hora)
HAVING COUNT(p.id) >= 5
ORDER BY pedidos_mes DESC, total_gastado_mes DESC;