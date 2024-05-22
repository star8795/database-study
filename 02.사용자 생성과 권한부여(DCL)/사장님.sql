-- 사장님(전역(global) 읽기 권한만 부여됨)
CREATE DATABASE abc;				-- 데이터베이스 생성 권한 없음(오류)

USE shopdb;							-- 데이터베이스 접근 가능
DROP TABLE membertbl;				-- 테이블 삭제 권한 없음(오류)
INSERT INTO membertbl
	VALUES(10, '홍길동', '부산');		-- INSERT데이터 삽입 권한 없음(오류)
    
SELECT * FROM membertbl;			-- SELECT권한 존재
SELECT * FROM sakila.actor;			-- 전역적인 읽기 권한 있음