DROP TABLE IF EXISTS RegistroEnvios;
DROP TABLE IF EXISTS Envios;
DROP TABLE IF EXISTS Pedidos;
DROP TABLE IF EXISTS Clientes;

CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Email NVARCHAR(100)
);


CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    FechaPedido DATE,
    Monto DECIMAL(10,2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);


CREATE TABLE Envios (
    EnvioID INT PRIMARY KEY,
    ClienteID INT,
    FechaPedido DATE,
    Monto DECIMAL(10,2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);


CREATE TABLE RegistroEnvios (
    RegistroEnvioID INT PRIMARY KEY IDENTITY(1,1),
    EnvioID INT,
    FechaEnvio DATE,
    Estado NVARCHAR(50),
    Observaciones NVARCHAR(255),
    FOREIGN KEY (EnvioID) REFERENCES Envios(EnvioID)
);


INSERT INTO Clientes (ClienteID, Nombre, Email)
VALUES (1, 'Juan Pérez', 'juan.perez@example.com'),
       (2, 'Ana Gómez', 'ana.gomez@example.com');


INSERT INTO Pedidos (PedidoID, ClienteID, FechaPedido, Monto)
VALUES (100, 1, '2025-08-28', 150.50),
       (101, 2, '2025-08-29', 200.00);


INSERT INTO Envios (EnvioID, ClienteID, FechaPedido, Monto)
VALUES (1, 1, '2025-08-30', 150.50),
       (2, 2, '2025-08-31', 200.00);

INSERT INTO RegistroEnvios (EnvioID, FechaEnvio, Estado, Observaciones)
VALUES 
(1, '2025-08-30', 'Enviado', 'Envío por paquetería DHL'),
(2, '2025-08-31', 'Pendiente', 'Esperando confirmación de dirección');

SELECT * FROM Clientes;
SELECT * FROM Pedidos;
SELECT * FROM Envios;
SELECT * FROM RegistroEnvios;