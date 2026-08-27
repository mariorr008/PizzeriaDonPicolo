
-- VISTA 1: RESUMEN DE PEDIDOS POR CLIENTE

CREATE OR REPLACE VIEW resumen_clientes AS
SELECT 
    c.id AS id_cliente,
    ps.nombre AS nombre_cliente,
    ps.telefono,
    ps.email,
    COUNT(pe.id) AS total_pedidos,
    SUM(pe.total) AS total_gastado
FROM clientes c
LEFT JOIN persona ps ON c.id_persona = ps.id
LEFT JOIN pedidos pe ON c.id = pe.id_cliente
GROUP BY c.id, ps.nombre, ps.telefono, ps.email
ORDER BY total_gastado DESC;



-- VISTA 2: DESEMPEñO DE REPARTIDORES


CREATE OR REPLACE VIEW desempeno_repartidores AS
SELECT 
    r.id AS id_repartidor,
    ps.nombre AS nombre_repartidor,
    ps.telefono,
    r.zona,
    r.estado AS estado_actual,
    COUNT(d.id) AS total_entregas,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, d.hora_salida, d.hora_entrega)), 2) AS tiempo_promedio_minutos,
    ROUND(AVG(d.distancia_km), 2) AS distancia_promedio_km,
    SUM(p.total) AS total_ventas_generadas
FROM repartidores r
LEFT JOIN persona ps ON r.id_persona = ps.id
LEFT JOIN domicilios d ON r.id = d.id_repartidor
LEFT JOIN pedidos p ON d.id_pedido = p.id
GROUP BY r.id, ps.nombre, ps.telefono, r.zona, r.estado
ORDER BY tiempo_promedio_minutos ASC;



-- VISTA 3: STOCK DE INGREDIENTES POR DEBAJO DEL MiNIMO



CREATE OR REPLACE VIEW stock_bajo AS
SELECT 
    id AS id_ingrediente,
    nombre AS nombre_ingrediente,
    stock AS stock_actual,
    stock_minimo,
    unidad,
    costo_unitario,
    ROUND(stock_minimo - stock, 2) AS faltante_para_minimo,
    CASE 
        WHEN stock <= 0 THEN 'SIN STOCK'
        WHEN stock < stock_minimo THEN 'BAJO'
    END AS nivel_alerta
FROM ingredientes i
WHERE stock < stock_minimo;
