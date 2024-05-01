-- 데이터베이스 생성
-- if not exists : 존재하지 않을 때만 생성(오류회피)
create database if not exists test_db;
use test_db;	-- 사용

-- 테이블 생성 문법
-- CREATE table 테이블명 (
-- 	컬럼명1 데이터타입 제약조건,
--     컬럼명2 데이터타입 제약조건,
--     ....
--     추가 제약조건
-- );
-- 직원 테이블 완성
create table employees (
	employee_id INT NOT NULL,	-- 숫자, Null 불허용
    first_name VARCHAR(50),		-- 문자. Null 허용
    last_name VARCHAR(50),		-- 문자. Null 허용
    PRIMARY KEY (employee_id)	-- 기본키 컬럼 : 중복 불허용
);

-- 테이블 정보 확인
describe employees;

select * from employees;	-- 테이블 조회

- 도메인 제약조건 위반(타입 불일치)하는 데이터를 입력했을 경우 오류 발생
INSERT INTO `test_db`.`employees` (`employee_id`, `first_name`, `last_name`) VALUES ('가나다', '가', '나');

-- 데이터 타입(도메인 제약조건)에 맞는 데이터를 입력하면 정상 수행
INSERT INTO `test_db`.`employees` (`employee_id`, `first_name`, `last_name`) VALUES ('1', '길동', '홍');

-- Null 허용 컬럼에 값을 입력하지 않아도 정상 수행
INSERT INTO `test_db`.`employees` (`employee_id`) VALUES ('2');

-- Not Null 제약 조건에 데이터를 입력하지 않으면 제약조건 위반
INSERT INTO `test_db`.`employees` (`first_name`, `last_name`) VALUES ('꺽정', '임');

-- 기본키(PK)에 중복되는 값을 입력할 경우 제약조건 위반(개체 무결성)
INSERT INTO `test_db`.`employees` (`employee_id`, `first_name`, `last_name`) VALUES ('2', '진호', '홍');

-- 기본키(고유값)를 제외한 컬럼은 값이 중복되어도 허용
INSERT INTO `test_db`.`employees` (`employee_id`, `first_name`, `last_name`) VALUES ('3', '길동', '홍');

CREATE TABLE members (
	member_id INT PRIMARY KEY,
    -- 기본 키를 구성하는 컬럼이 하나인 경우
    -- 컬럼과 함께 기본키 제약조건을 지정할 수 있음.
    member_name VARCHAR(50)
);

-- 테이블 구조확인
DESC members;
-- 기본키로 지정할 경우 Not Null 제약조건이 부여됨

create table player (
	-- 각 컬럼은 중복될 수 있어도, 두 컬럼의 조합은 중복될 수 없을때
    -- 2개 이상의 컬럼을 사용하여 복합 기본키 생성
	team_id INT NOT NULL,
	back_number INT NOT NULL, 
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    PRIMARY KEY (team_id, back_number)
);

DESC player;
SELECT * FROM player;

-- 복합 기본키의 구성요소의 조합이 중복될 경우 기본키 제약조건 위반
INSERT INTO `test_db`.`player` (`team_id`, `back_number`, `first_name`, `last_name`) VALUES ('1', '2', '중', '복');

CREATE table users (
	user_id INT PRIMARY KEY,		-- 기본키
    username VARCHAR(50) NOT NULL,	-- 필수(not null)
    email VARCHAR(100) UNIQUE		-- 고유값(중복 불허)
);

DESC users;		-- Key 열에 UNIQUE값 확인 가능

SELECT * FROM users;

-- UNIQUE 제약 조건은 Null을 허용, Null이 중복되는 것을 허용.
INSERT INTO `test_db`.`users` (`user_id`, `username`) VALUES ('2', '임꺽정');
INSERT INTO `test_db`.`users` (`user_id`, `username`) VALUES ('3', '전우치');

-- UNIQUE 제약조건이 있는 속성(컬럼)에 같은 값이 들어갈 경우 제약조건 위반
INSERT INTO `test_db`.`users` (`user_id`, `username`, `email`) VALUES ('1', '홍길동', 'hong@abc.com');
INSERT INTO `test_db`.`users` (`user_id`, `username`, `email`) VALUES ('4', '홍진호', 'hong@abc.com');