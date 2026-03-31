-- Insertar Categorías
INSERT INTO categories (nombre) VALUES ('Packs de Regalo'), ('Café Molido');

-- Insertar Productos (IDs: 1, 2, 3)
INSERT INTO products (category_id, nombre, precio, descripcion, img_url) VALUES 
(1, 'Caribe pack', 63290, 'Café grano selección Caribe', 'assets/img/caribe.png'),
(1, 'Vernazza pack', 70490, 'Café grano selección Vernazza', 'assets/img/vernazza.png'),
(2, 'Consentido', 26090, 'Café molido fino', 'assets/img/consentido.png');

-- Inicializar Stock
INSERT INTO inventory (product_id, stock) VALUES (1, 10), (2, 5), (3, 20);

-- Insertar un Cliente de prueba
INSERT INTO customers (nombre, email) VALUES ('Ale Fuentes', 'ale@cafecafe.cl');