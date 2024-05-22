-- 데이터베이스 생성
CREATE DATABASE my_store;

-- 데이터베이스 사용
USE my_store;

-- 제품 테이블 생성
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

-- 판매 테이블 생성
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    sale_date DATE NOT NULL,
    quantity INT NOT NULL
);

-- 초기 데이터 삽입
INSERT INTO products (product_name, category, price, stock) VALUES
('Laptop', 'Electronics', 1200.00, 10),
('Smartphone', 'Electronics', 600.00, 50),
('Charger', 'Accessories', 20.00, 150),
('Headphones', 'Accessories', 80.00, 75);

INSERT INTO products (product_name, category, price, stock)
VALUES ('Mouse', 'Accessories', 25.00, 200);

UPDATE products
SET price = 650.00
WHERE product_name = 'Smartphone';

UPDATE products
SET stock = 15
WHERE product_name = 'Laptop';

DELETE FROM products
WHERE product_name = 'Charger';

INSERT INTO sales (product_name, sale_date, quantity)
VALUES ('Headphones', '2023-02-01', 10);

UPDATE sales
SET quantity = 3
WHERE product_name = 'Laptop' AND sale_date = '2023-01-10';

DELETE FROM sales
WHERE sale_date = '2023-01-25';

UPDATE products
SET price = price * 1.10
WHERE category = 'Electronics';

UPDATE products
SET stock = stock + 5
WHERE price >= 500.00;