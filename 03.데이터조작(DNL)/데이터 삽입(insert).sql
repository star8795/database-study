CREATE SCHEMA insert_db;
USE insert_db;

-- 테이블 생성
-- 기존의 스키마를 복사하여 테이블 생성
CREATE TABLE employees
	LIKE employees.employees;
    
DESCRIBE employees;		-- 스키마 확인

-- INSERT 데이터 삽입
-- 문법
-- INSERT INTO 테이블명
-- VALUES

INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
	VALUES (1, '2000-05-22', '길동', '홍', 'M', '2024-05-22');
    
SELECT * FROM employees;

INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
	VALUES ('문자열', '날짜아님', '길동', '홍', 'XXX', '2024-05-22');
    
SELECT * FROM employees;

-- 2. 컬럼명을 명시하지 않고, 데이터를 삽입
INSERT INTO employees
VALUES (2, '2000-01-01', '꺽정', '임', 'M', '2024-05-22');
-- 테이블의 구조와 타입을 정확히 알고 있어야 가능
-- 모든 컬럼의 값을 삽입해야 가능
-- 테이블의 구조가 변경되면 오류가 발생할 수 있음.

SELECT * FROM employees;	-- 데이터 확인