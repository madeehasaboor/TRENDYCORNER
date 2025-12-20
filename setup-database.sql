-- Create all required tables for Trendy Corner backend

-- Admins table
CREATE TABLE IF NOT EXISTS admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('super_admin', 'admin') DEFAULT 'admin',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Brands table
CREATE TABLE IF NOT EXISTS brands (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories table
CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Subcategories table
CREATE TABLE IF NOT EXISTS subcategories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

-- Products table
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    description TEXT,
    brand_id INT,
    category_id INT,
    subcategory_id INT,
    image VARCHAR(255),
    stock INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (brand_id) REFERENCES brands(id) ON DELETE SET NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL,
    FOREIGN KEY (subcategory_id) REFERENCES subcategories(id) ON DELETE SET NULL
);

-- Insert default admin user (email: madeehasaboor@gmail.com, password: admin123)
INSERT INTO admins (username, email, password, role) 
VALUES ('admin', 'madeehasaboor@gmail.com', '$2b$10$aSsILhUDg5tWZ9msGhsuxeDoYKRufFqFTX39gRJZveHqEkG2yCc8q', 'super_admin')
ON DUPLICATE KEY UPDATE username = username;

-- Insert sample brands
INSERT INTO brands (name, description) VALUES 
('Nike', 'Sports and athletic wear'),
('Adidas', 'Sports and casual wear'),
('Apple', 'Technology and electronics'),
('Samsung', 'Technology and electronics'),
('Zara', 'Fashion and clothing')
ON DUPLICATE KEY UPDATE name = name;

-- Insert sample categories
INSERT INTO categories (name, slug, description) VALUES 
('Electronics', 'electronics', 'Electronic devices and gadgets'),
('Clothing', 'clothing', 'Apparel and fashion items'),
('Sports', 'sports', 'Sports equipment and wearables'),
('Home', 'home', 'Home and kitchen items')
ON DUPLICATE KEY UPDATE name = name;

-- Insert sample subcategories
INSERT INTO subcategories (name, category_id, description) VALUES 
('Mobile Phones', 1, 'Smartphones and mobile devices'),
('Laptops', 1, 'Portable computers'),
('T-Shirts', 2, 'Casual t-shirts'),
('Jeans', 2, 'Denim pants'),
('Running Shoes', 3, 'Athletic footwear'),
('Kitchen Appliances', 4, 'Cooking and food prep items')
ON DUPLICATE KEY UPDATE name = name;
