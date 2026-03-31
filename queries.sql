-- Productos más vendidos

SELECT p.nombre, SUM(oi.cantidad) as total_vendido
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.nombre
ORDER BY total_vendido DESC;

-- Alerta stock bajo (-5)

SELECT p.nombre, i.stock 
FROM products p
JOIN inventory i ON p.id = i.product_id
WHERE i.stock <= 5;

-- Transaccion de venta (compra finalizada)

BEGIN;

-- 1. Crear la orden
INSERT INTO orders (customer_id, total) VALUES (1, 133780);

-- 2. Insertar ítems (2 Caribe pack)
INSERT INTO order_items (order_id, product_id, cantidad, precio_unitario) 
VALUES (currval('orders_id_seq'), 1, 2, 63290);

-- 3. Descontar stock
UPDATE inventory SET stock = stock - 2 WHERE product_id = 1;

-- 4. Verificar si el stock quedó negativo (opcional según RDBMS, o se maneja con el CHECK)
-- Si todo está correcto:
COMMIT;
-- Si algo falla: ROLLBACK;