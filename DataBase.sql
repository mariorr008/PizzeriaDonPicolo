
DROP DATABASE IF EXISTS pizzeria_don_piccolo;
CREATE DATABASE pizzeria_don_piccolo
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE pizzeria_don_piccolo;

-- ============================================================
-- TABLA: PERSONA
-- ============================================================
CREATE TABLE persona (
    id             INT AUTO_INCREMENT PRIMARY KEY,
    nombre         VARCHAR(100) NOT NULL,
    telefono       VARCHAR(20)  NOT NULL,
    direccion      VARCHAR(200),
    email          VARCHAR(100) UNIQUE,
    tipo_persona   ENUM('cliente','repartidor') NOT NULL,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- TABLA: CLIENTES
-- ============================================================
CREATE TABLE clientes (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    id_persona  INT NOT NULL UNIQUE,
    CONSTRAINT fk_cliente_persona
        FOREIGN KEY (id_persona) REFERENCES persona(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================================
-- TABLA: REPARTIDORES
-- ============================================================
CREATE TABLE repartidores (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    id_persona  INT NOT NULL UNIQUE,
    zona        VARCHAR(50) NOT NULL,
    estado      ENUM('disponible','no disponible') NOT NULL DEFAULT 'disponible',
    CONSTRAINT fk_repartidor_persona
        FOREIGN KEY (id_persona) REFERENCES persona(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================================
-- TABLA: PIZZAS
-- ============================================================
CREATE TABLE pizzas (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    nombre      VARCHAR(100) NOT NULL,
    tamano      ENUM('personal','mediana','grande','familiar') NOT NULL,
    precio_base DECIMAL(10,2) NOT NULL CHECK (precio_base >= 0),
    tipo        ENUM('vegetariana','especial','clasica') NOT NULL,
    activa      BOOLEAN NOT NULL DEFAULT TRUE
);

-- ============================================================
-- TABLA: INGREDIENTES
-- ============================================================
CREATE TABLE ingredientes (
    id             INT AUTO_INCREMENT PRIMARY KEY,
    nombre         VARCHAR(100) NOT NULL UNIQUE,
    stock          DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (stock >= 0),
    stock_minimo   DECIMAL(10,2) NOT NULL DEFAULT 0,
    unidad         VARCHAR(20) NOT NULL,
    costo_unitario DECIMAL(10,2) NOT NULL DEFAULT 0
);

-- ============================================================
-- TABLA: PIZZA_INGREDIENTE
-- ============================================================
CREATE TABLE pizza_ingrediente (
    id_pizza       INT NOT NULL,
    id_ingrediente INT NOT NULL,
    cantidad       DECIMAL(10,2) NOT NULL CHECK (cantidad > 0),
    PRIMARY KEY (id_pizza, id_ingrediente),
    CONSTRAINT fk_pi_pizza
        FOREIGN KEY (id_pizza) REFERENCES pizzas(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_pi_ingrediente
        FOREIGN KEY (id_ingrediente) REFERENCES ingredientes(id)
        ON DELETE CASCADE
);

-- ============================================================
-- TABLA: PEDIDOS
-- ============================================================
CREATE TABLE pedidos (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente  INT NOT NULL,
    fecha_hora  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    metodo_pago ENUM('efectivo','tarjeta','app') NOT NULL,
    estado      ENUM('pendiente','en preparacion','entregado','cancelado') NOT NULL DEFAULT 'pendiente',
    total       DECIMAL(10,2) NOT NULL DEFAULT 0,
    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- ============================================================
-- TABLA: DETALLE_PEDIDO 
-- ============================================================
CREATE TABLE detalle_pedido (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido       INT NOT NULL,
    id_pizza        INT NOT NULL,
    cantidad        INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_dp_pedido
        FOREIGN KEY (id_pedido) REFERENCES pedidos(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_dp_pizza
        FOREIGN KEY (id_pizza) REFERENCES pizzas(id)
);

-- ============================================================
-- TABLA: DOMICILIOS
-- ============================================================
CREATE TABLE domicilios (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido     INT NOT NULL UNIQUE,
    id_repartidor INT NOT NULL,
    hora_salida   DATETIME NULL,
    hora_entrega  DATETIME NULL,
    distancia_km  DECIMAL(6,2) NOT NULL,
    costo_envio   DECIMAL(10,2) NOT NULL DEFAULT 0,
    CONSTRAINT fk_dom_pedido
        FOREIGN KEY (id_pedido) REFERENCES pedidos(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_dom_repartidor
        FOREIGN KEY (id_repartidor) REFERENCES repartidores(id)
);

-- ============================================================
-- TABLA: PAGOS
-- ============================================================
CREATE TABLE pagos (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido   INT NOT NULL,
    monto       DECIMAL(10,2) NOT NULL,
    metodo_pago ENUM('efectivo','tarjeta','app') NOT NULL,
    fecha_pago  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_pago_pedido
        FOREIGN KEY (id_pedido) REFERENCES pedidos(id)
        ON DELETE CASCADE
);

-- ============================================================
-- TABLA: HISTORIAL_PRECIOS
-- ============================================================
CREATE TABLE historial_precios (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    id_pizza        INT NOT NULL,
    precio_anterior DECIMAL(10,2) NOT NULL,
    precio_nuevo    DECIMAL(10,2) NOT NULL,
    fecha_cambio    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_hist_pizza
        FOREIGN KEY (id_pizza) REFERENCES pizzas(id)
);

