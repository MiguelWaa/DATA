-- Eliminar la tabla existente si ya no la necesitas
DROP TABLE IF EXISTS tablero_cerro_verde;

-- Ahora crear la tabla de nuevo
CREATE TABLE tablero_cerro_verde (
    id INT PRIMARY KEY IDENTITY(1,1),  -- ID único para cada entrada (con auto incremento)
    columna INT,                        -- Número de la columna
    fila INT,                           -- Número de la fila
    zona VARCHAR(100),                  -- Descripción o nombre de la zona
    latitud DECIMAL(9, 6),              -- Coordenadas geográficas
    longitud DECIMAL(9, 6)              -- Coordenadas geográficas
);

-- Insertar datos de ejemplo en la tabla
INSERT INTO tablero_cerro_verde (columna, fila, zona, latitud, longitud) 
VALUES
(1, 1, 'Zona A', -16.3927, -71.4322),
(1, 2, 'Zona B', -16.3930, -71.4325),
(2, 1, 'Zona C', -16.3940, -71.4330),
(2, 2, 'Zona D', -16.3950, -71.4335);

-- Consultar y mostrar los datos del tablero
SELECT * FROM tablero_cerro_verde;
