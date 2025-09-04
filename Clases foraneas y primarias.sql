USE tienda_db;
GO

-- Borrar tablas si existen
IF OBJECT_ID('pedidos', 'U') IS NOT NULL
    DROP TABLE pedidos;
IF OBJECT_ID('clientes', 'U') IS NOT NULL
    DROP TABLE clientes;

-- Crear tabla clientes
CREATE TABLE clientes (
    cliente_id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    correo NVARCHAR(150) UNIQUE
);

-- Crear tabla pedidos
CREATE TABLE pedidos (
    pedido_id INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    cliente_id INT,
    CONSTRAINT fk_cliente
        FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Insertar clientes
INSERT INTO clientes (nombre, correo) VALUES
('Danna', 'danna@email.com'),
('Carlos', 'carlos@email.com');

-- Insertar pedidos
INSERT INTO pedidos (fecha, monto, cliente_id) VALUES
('2025-09-01', 250.00, 1),
('2025-09-02', 100.50, 2),
('2025-09-03', 75.99, 1);

-- Consultar pedidos con nombre de cliente
SELECT p.pedido_id, c.nombre, p.fecha, p.monto
FROM pedidos p
INNER JOIN clientes c ON p.cliente_id = c.cliente_id;
