create database produts_db;
use produts_db;

create table products (
	product_id INT PRIMARY KEY NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    supplier_id INT NOT NULL
);

describe products;

create table coursr_regisrtations (
	student_id INT NOT NULL,
    course_id INT NOT NULL,
    registration_date DATE NOT NULL,
    PRIMARY KEY (student_id, course_id),
    UNIQUE (student_id, course_id)
);

describe coursr_regisrtations;

CREATE TABLE customer_accounts (
    account_id INT PRIMARY KEY NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE
);

describe customer_accounts;
