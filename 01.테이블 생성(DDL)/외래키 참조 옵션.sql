-- 외래키 참조 옵션
USE test_db;

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- 외래키 참조 관계에서 테이블 생성 순서
-- 1:N 관계에서 1부터 먼저 만들고 N을 만들어야함.
-- N 테이블 쪽이 1을 참조하는 외래키 옵션을 가지기 때문
-- 부서 테이블 생성 (1)
CREATE TABLE departments (
	department_id INT PRIMARY KEY,
	department_name VARCHAR(255) NOT NULL
);
-- 직원 테이블 생성 (N)
CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
	employee_name VARCHAR(255) NOT NULL,
    department_id INT,
	FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- 1. CASCADE 옵션

SELECT * FROM employees;
SELECT * FROM departments;