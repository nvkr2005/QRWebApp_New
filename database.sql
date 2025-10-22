-- Wienerschnitzel Database Setup Script
-- MySQL Database Schema with Seed Data

-- Create database if not exists
CREATE DATABASE IF NOT EXISTS drive_through;
USE drive_through;

-- Drop tables if they exist (for clean setup)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS menu_item_addons;
DROP TABLE IF EXISTS addons;
DROP TABLE IF EXISTS menu_items;
DROP TABLE IF EXISTS categories;

-- Create Categories table
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Menu Items table
CREATE TABLE menu_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    category_id INT NOT NULL,
    image_url TEXT,
    available BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Create Add-ons table
CREATE TABLE addons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Menu Item Add-ons junction table
CREATE TABLE menu_item_addons (
    menu_item_id INT,
    addon_id INT,
    PRIMARY KEY (menu_item_id, addon_id),
    FOREIGN KEY (menu_item_id) REFERENCES menu_items(id),
    FOREIGN KEY (addon_id) REFERENCES addons(id)
);

-- Create Customers table with car information
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(255),
    car_type VARCHAR(100),
    car_color VARCHAR(50),
    plate VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Create Order Items table
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    menu_item_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    addons JSON,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (menu_item_id) REFERENCES menu_items(id)
);

-- Insert Categories
INSERT INTO categories (name, description) VALUES
('Hot Dogs', 'Classic hot dogs and sausages'),
('Burgers', 'Juicy burgers and sandwiches'),
('Sides', 'Fries, onion rings, and more'),
('Beverages', 'Drinks and shakes'),
('Desserts', 'Sweet treats and ice cream');

-- Insert Add-ons
INSERT INTO addons (name, price) VALUES
('Extra Cheese', 0.75),
('Bacon', 1.25),
('Chili', 0.50),
('Onions', 0.25),
('Mustard', 0.00),
('Ketchup', 0.00),
('Relish', 0.25),
('Jalapeños', 0.50),
('Avocado', 1.00),
('Extra Meat', 2.00);

-- Insert Menu Items
INSERT INTO menu_items (name, description, price, category_id, image_url, available) VALUES
-- Hot Dogs
('Original Wiener', 'Classic all-beef hot dog with mustard', 4.99, 1, 'https://images.unsplash.com/photo-1612392062798-2dd8b83e8d8e?w=400', 1),
('Chili Dog', 'Hot dog topped with our signature chili', 6.49, 1, 'https://images.unsplash.com/photo-1551782450-17144efb9c50?w=400', 1),
('Chicago Dog', 'All-beef hot dog with yellow mustard, onions, bright green relish', 7.99, 1, 'https://images.unsplash.com/photo-1612392062798-2dd8b83e8d8e?w=400', 1),
('Corn Dog', 'Classic corn dog on a stick', 5.49, 1, 'https://images.unsplash.com/photo-1551782450-17144efb9c50?w=400', 1),

-- Burgers
('Classic Burger', 'Quarter pound beef patty with lettuce, tomato, onion', 8.99, 2, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400', 1),
('Cheeseburger', 'Classic burger with American cheese', 9.49, 2, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400', 1),
('Bacon Burger', 'Classic burger with crispy bacon', 10.99, 2, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400', 1),
('Double Burger', 'Two quarter pound patties with all the fixings', 12.99, 2, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400', 1),

-- Sides
('French Fries', 'Crispy golden fries', 3.49, 3, 'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=400', 1),
('Onion Rings', 'Beer-battered onion rings', 4.49, 3, 'https://images.unsplash.com/photo-1639024471283-03518883512d?w=400', 1),
('Chili Fries', 'Fries topped with chili and cheese', 5.99, 3, 'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=400', 1),
('Loaded Fries', 'Fries with bacon, cheese, and sour cream', 6.99, 3, 'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=400', 1),

-- Beverages
('Coca-Cola', 'Classic Coke', 2.49, 4, 'https://images.unsplash.com/photo-1581636625402-29b2a704ef13?w=400', 1),
('Sprite', 'Lemon-lime soda', 2.49, 4, 'https://images.unsplash.com/photo-1581636625402-29b2a704ef13?w=400', 1),
('Orange Juice', 'Fresh squeezed orange juice', 3.49, 4, 'https://images.unsplash.com/photo-1613478223719-2ab802602423?w=400', 1),
('Chocolate Shake', 'Rich chocolate milkshake', 4.99, 4, 'https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=400', 1),

-- Desserts
('Apple Pie', 'Classic apple pie slice', 3.99, 5, 'https://images.unsplash.com/photo-1535920527002-b35e96722da9?w=400', 1),
('Ice Cream Sundae', 'Vanilla ice cream with chocolate sauce', 4.49, 5, 'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=400', 1),
('Chocolate Chip Cookie', 'Fresh baked cookie', 2.49, 5, 'https://images.unsplash.com/photo-1499636136210-6f4ee915583e?w=400', 1);

-- Insert sample customers with car information
INSERT INTO customers (name, phone, email, car_type, car_color, plate) VALUES
('John Doe', '555-0123', 'john.doe@email.com', 'Toyota Camry', 'Blue', 'ABC123'),
('Jane Smith', '555-0456', 'jane.smith@email.com', 'Honda Civic', 'Red', 'XYZ789'),
('Mike Johnson', '555-0789', 'mike.johnson@email.com', 'Ford F-150', 'Black', 'DEF456');

-- Insert sample orders
INSERT INTO orders (customer_id, total, status) VALUES
(1, 15.48, 'completed'),
(2, 22.97, 'preparing'),
(3, 8.99, 'pending');

-- Insert sample order items
INSERT INTO order_items (order_id, menu_item_id, quantity, price, addons) VALUES
(1, 1, 2, 4.99, '[1,5]'), -- 2 Original Wieners with extra cheese and mustard
(1, 9, 1, 3.49, '[]'),    -- 1 French Fries
(1, 13, 1, 2.49, '[]'),   -- 1 Coca-Cola

(2, 5, 1, 8.99, '[2,4]'), -- 1 Classic Burger with bacon and onions
(2, 6, 1, 9.49, '[1]'),   -- 1 Cheeseburger with extra cheese
(2, 12, 1, 4.49, '[]'),   -- 1 Loaded Fries

(3, 5, 1, 8.99, '[]');    -- 1 Classic Burger

-- Create indexes for better performance
CREATE INDEX idx_menu_items_category ON menu_items(category_id);
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_order_items_order ON order_items(order_id);
CREATE INDEX idx_order_items_menu_item ON order_items(menu_item_id);
CREATE INDEX idx_customers_plate ON customers(plate);

-- Display summary
SELECT 'Database setup complete!' as message;
SELECT COUNT(*) as total_categories FROM categories;
SELECT COUNT(*) as total_menu_items FROM menu_items;
SELECT COUNT(*) as total_addons FROM addons;
SELECT COUNT(*) as total_customers FROM customers;
SELECT COUNT(*) as total_orders FROM orders;