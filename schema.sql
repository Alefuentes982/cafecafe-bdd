-- Crear tablas para CAFÉ café
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    category_id INT REFERENCES categories(id),
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio INT NOT NULL CHECK (precio > 0), -- Pesos Chilenos
    img_url VARCHAR(255)
);

CREATE TABLE inventory (
    product_id INT PRIMARY KEY REFERENCES products(id),
    stock INT NOT NULL CHECK (stock >= 0)
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total INT NOT NULL DEFAULT 0
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id) ON DELETE CASCADE,
    product_id INT REFERENCES products(id),
    cantidad INT NOT NULL CHECK (cantidad > 1),
    precio_unitario INT NOT NULL -- Precio al momento de la compra
);

-- Índices para optimizar búsquedas frecuentes
CREATE INDEX idx_product_name ON products(nombre);
CREATE INDEX idx_order_customer ON orders(customer_id);