
--FUNCION 1: CALCULAR TOTAL DE PEDIDO

DELIMITER //

CREATE FUNCTION calcular_total_pedido(p_id INT) 
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE v_subtotal DOUBLE;
    DECLARE v_costo_envio DOUBLE;
    DECLARE v_iva DOUBLE;
    DECLARE v_total DOUBLE;
    
    SELECT SUM(cantidad * precio_unitario) INTO v_subtotal
    FROM detalle_pedido
    WHERE id_pedido = p_id;
    
    SELECT costo_envio INTO v_costo_envio
    FROM domicilios
    WHERE id_pedido = p_id;
    
    SET v_iva = (v_subtotal + v_costo_envio) * 0.19;
    SET v_total = v_subtotal + v_costo_envio + v_iva;
    
    RETURN v_total;
END //

DELIMITER ;


--FUNCION 2: GANANCIA NETA DIARIA

DELIMITER //

CREATE FUNCTION ganancia_neta_diaria(p_fecha DATE) 
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE v_ventas_totales DOUBLE;
    DECLARE v_costo_ingredientes DOUBLE;
    DECLARE v_costo_envios DOUBLE;
    
    SELECT SUM(total) INTO v_ventas_totales
    FROM pedidos
    WHERE DATE(fecha_hora) = p_fecha AND estado = 'entregado';
    
    SELECT (SUM(dp.cantidad * pi.cantidad * i.costo_unitario)) INTO v_costo_ingredientes
    FROM pedidos p
    LEFT JOIN detalle_pedido dp ON p.id = dp.id_pedido
    LEFT JOIN pizza_ingrediente pi ON dp.id_pizza = pi.id_pizza
    LEFT JOIN ingredientes i ON pi.id_ingrediente = i.id
    WHERE DATE(p.fecha_hora) = p_fecha AND p.estado = 'entregado';
    
    SELECT SUM(d.costo_envio) INTO v_costo_envios
    FROM pedidos p
    LEFT JOIN domicilios d ON p.id = d.id_pedido
    WHERE DATE(p.fecha_hora) = p_fecha AND p.estado = 'entregado';
    
    RETURN v_ventas_totales - v_costo_ingredientes - v_costo_envios;
END //

DELIMITER ;


--PROCEDIMIENTO: ESTADO DE PEDIDO

DELIMITER //

CREATE PROCEDURE actualizar_estado_pedido(IN p_id INT, IN p_hora_entrega DATETIME)
BEGIN
    DECLARE estado_actual VARCHAR(20);
    
    SELECT estado INTO estado_actual
    FROM pedidos
    WHERE id = p_id;
    
    IF estado_actual = 'cancelado' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'No se puede entregar un pedido cancelado';
    END IF;
    
    UPDATE domicilios
    SET hora_entrega = p_hora_entrega
    WHERE id_pedido = p_id;
    
    UPDATE pedidos
    SET estado = 'entregado',
        total = calcular_total_pedido(p_id)
    WHERE id = p_id;
    
    SELECT CONCAT(' Pedido #', p_id, ' entregado') AS mensaje;
END //

DELIMITER ;