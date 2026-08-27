

--TRIGGER 1: ACTUALIZACIÓN AUTOMÁTICA DE STOCK

DELIMITER //

CREATE TRIGGER actualizar_stock_ingredientes
AFTER INSERT ON detalle_pedido
FOR EACH ROW
BEGIN
    UPDATE ingredientes i
    LEFT JOIN pizza_ingrediente pi ON i.id = pi.id_ingrediente
    SET i.stock = i.stock - (pi.cantidad * NEW.cantidad)
    WHERE pi.id_pizza = NEW.id_pizza;
END //

DELIMITER ;



-- TRIGGER 2: AUDITORÍA DE CAMBIOS DE PRECIO


DELIMITER //

CREATE TRIGGER auditoria_cambio_precio
BEFORE UPDATE ON pizzas
FOR EACH ROW
BEGIN
    IF OLD.precio_base != NEW.precio_base THEN
        INSERT INTO historial_precios (id_pizza, precio_anterior, precio_nuevo)
        VALUES (NEW.id, OLD.precio_base, NEW.precio_base);
    END IF;
END //

DELIMITER ;




-- TRIGGER 3: MARCAR REPARTIDOR COMO DISPONIBLE



DELIMITER //

CREATE TRIGGER marcar_repartidor_disponible
AFTER UPDATE ON domicilios
FOR EACH ROW
BEGIN
    IF OLD.hora_entrega IS NULL AND NEW.hora_entrega IS NOT NULL THEN
        UPDATE repartidores
        SET estado = 'disponible'
        WHERE id = NEW.id_repartidor;
    END IF;
END //

DELIMITER ;
