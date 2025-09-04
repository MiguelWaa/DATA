USE tienda_db;
GO

-- IS NULL: Buscar pedidos donde no se haya especificado un cliente (cliente_id es NULL)
SELECT * FROM pedidos
WHERE cliente_id IS NULL;  -- Aqu� uso IS NULL para verificar valores nulos

-- LIKE: Buscar clientes cuyo nombre empieza con 'D'
SELECT * FROM clientes
WHERE nombre LIKE 'D%';  -- Aqu� uso LIKE para patr�n (nombres que empiezan con 'D')

-- IN: Buscar pedidos que pertenezcan a ciertos clientes espec�ficos (cliente_id 1 o 2)
SELECT * FROM pedidos
WHERE cliente_id IN (1, 2);  -- Aqu� uso IN para filtrar varios valores posibles

-- BETWEEN: Buscar pedidos con monto entre 50 y 200
SELECT * FROM pedidos
WHERE monto BETWEEN 50 AND 200;  -- Aqu� uso BETWEEN para rango de valores

-- L�gica de Tres Valores: Mostrar pedidos donde el monto es mayor a 200 o el cliente es desconocido (cliente_id NULL)
SELECT * FROM pedidos
WHERE monto > 200 OR cliente_id IS NULL;  -- Aqu� ejemplifico la l�gica TRUE/FALSE/UNKNOWN con NULL

-- GROUP BY: Obtener el total de pedidos y monto promedio por cliente
SELECT cliente_id, COUNT(pedido_id) AS TotalPedidos, AVG(monto) AS MontoPromedio
FROM pedidos
GROUP BY cliente_id;  -- Aqu� uso GROUP BY para agrupar por cliente_id

-- Para hacerlo m�s completo y mostrar nombres de clientes con su resumen:
SELECT c.nombre, COUNT(p.pedido_id) AS TotalPedidos, AVG(p.monto) AS MontoPromedio
FROM pedidos p
INNER JOIN clientes c ON p.cliente_id = c.cliente_id
GROUP BY c.nombre;
