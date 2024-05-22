DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
-- departments 테이블 생성
CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100) UNIQUE NOT NULL,
    location VARCHAR(100)
);

-- employees 테이블 생성
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    salary NUMERIC CHECK (salary > 0) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- projects 테이블 생성
CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) UNIQUE NOT NULL,
    start_date DATE DEFAULT CURRENT_TIMESTAMP,
    end_date DATE CHECK (end_date > start_date)
);

-- assignments 테이블 생성
CREATE TABLE assignments (
    assignment_id SERIAL PRIMARY KEY,
    emp_id INT,
    project_id INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- departments 테이블 구조 확인
DESCRIBE departments;

-- employees 테이블 구조 확인
DESCRIBE employees;

-- projects 테이블 구조 확인
DESCRIBE projects;

-- assignments 테이블 구조 확인
DESCRIBE assignments;

