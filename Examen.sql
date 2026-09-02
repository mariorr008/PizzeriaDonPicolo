--muestra el estado y desempeño de cada repartidor.

SELECT 
    r.id AS id_repartidor,
    ps.nombre AS nombre_repartidor,
    r.estado AS estado_actual,
    COUNT(d.id) AS total_entregas
FROM repartidores r
LEFT JOIN persona ps ON r.id_persona = ps.id
LEFT JOIN domicilios d ON r.id = d.id_repartidor
GROUP BY r.id, ps.nombre, r.estado;

--Pedidos de mas de 40min

SELECT 
    id AS id_domicilio,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, hora_salida, hora_entrega)), 2) AS tiempo_promedio_minutos
FROM domicilios
WHERE hora_entrega IS NOT NULL
GROUP BY id
HAVING tiempo_promedio_minutos > 20
ORDER BY tiempo_promedio_minutos desc;

--repartidores sin domicilios asignados

select 
    r.id AS id_repartidor,
    ps.nombre AS nombre_repartidor,
    r.zona,
    r.estado
from repartidores r
left join persona ps on r.id_persona = ps.id
left join domicilios d on r.id = d.id_repartidor
where d.id is null;


--resumen de desempeño 

CREATE VIEW desempeno_repartidor AS
SELECT 
    r.id AS id_repartidor,
    ps.nombre AS nombre_repartidor,
    COUNT(d.id) AS total_entregas,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, d.hora_salida, d.hora_entrega)), 2) AS tiempo_promedio_minutos
FROM repartidores r
LEFT JOIN persona ps ON r.id_persona = ps.id
LEFT JOIN domicilios d ON r.id = d.id_repartidor
LEFT JOIN pedidos p ON d.id_pedido = p.id
GROUP BY r.id, ps.nombre
ORDER BY tiempo_promedio_minutos ASC;