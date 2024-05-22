-- 팀장님 권한(DBA 권한)
-- 모든 권한이 존재, 모든 명령어 수행가능
-- 모든 데이터베이스와 모든 테이블을 제어가능

-- DDL으로 DB
CREATE DATABASE dc1_db;
DROP DATABASE dc1_db;

-- 특정 데이터베이스에 접근하여 테이블 객체 생성 삭제
USE shopdb;
CREATE TABLE test(id int);
DROP TABLE test;