-- 03_SELECT 정렬.sql

-- 기본문법
-- SELECT 컬럼명
-- FROM 테이블명
-- ORDER BY 컬럼명 [ASC|DESC], ...
-- 컬럼명 : 정렬할 기준이 되는 열
-- ASC : 오름차순
-- DESC : 내림차순
use scott; -- DB 사용 선언

-- sal 기준으로 오름차순 정렬 (ASC, DESC 생략시 기본값 : 오름차순)
-- 급여 적은 순으로 직원 정렬하여 조회
SELECT * FROM emp ORDER BY sal;

-- 급여 많은 순으로 직원 정렬하여 조회 (내림차순)
SELECT * FROM emp ORDER BY sal DESC;

-- 여러 컬럼을 기준으로 정렬하기
-- 부서 기준으로 정렬하고 각 부서 내부에서 급여 많은 순으로 조회
SELECT * FROM emp 
ORDER BY deptno ASC, sal DESC;

-- LIMIT 조회 결과를 제한

-- 급여를 가장 적게 받는 3인을 조회
SELECT * FROM emp 
ORDER BY sal LIMIT 3;

-- 급여를 가장 많이 받는 3인을 조회
SELECT * FROM emp 
ORDER BY sal DESC LIMIT 3;

-- OFFSET : 결과 셋에서 몇 행을 건너 뛸 때 사용

-- 급여 많이받는 순위 4 ~ 6위까지를 조회
SELECT * FROM emp 
ORDER BY sal DESC LIMIT 3 OFFSET 3;

-- LIMIT ~ OFFSET 은 대규모의 데이터셋에서 필요한 부분만 조회
-- 응답시간과 성능을 최적화하여 사용자 경험을 개선
-- 데이터 페이지네이션(Pagenation)

-- DISTINCT : 중복된 값을 제거하고 고유값만 반환

-- 직원 테이블에서 어떤 직무가 있는지 조회
SELECT DISTINCT job FROM emp;
-- 직원 테이블에서 어떤 부서번호가 있는지 조회
SELECT DISTINCT deptno FROM emp;

-- 직원 테이블에서 어떤 부서번호가 있는지 조회 + 오름차순 정렬
SELECT DISTINCT deptno FROM emp ORDER BY deptno;

-- 1. country 테이블에서 대륙(Continent)이 'Asia'인 나라들 중 인구(Population)가 많은 상위 5개 나라를 조회하세요.
-- 결과는 나라 이름(Name)과 인구(Population)를 내림차순으로 정렬하여 조회하세요.
SELECT Name, Population
FROM country
WHERE Continent = 'Asia'
ORDER BY Population DESC LIMIT 5;

-- 2. countrylanguage 테이블에서 고유한 나라 코드(CountryCode) 목록을 조회하세요.
-- 결과는 나라 코드(CountryCode)를 오름차순으로 정렬하여 조회하세요.
SELECT DISTINCT CountryCode
FROM countrylanguage
ORDER BY CountryCode;

-- 3. city 테이블에서 이름(Name)이 'S'로 시작하는 도시들 중 인구(Population)가 많은 상위 5개 도시를 조회하세요.
-- 결과는 도시 이름(Name)과 인구(Population)를 내림차순으로 정렬하여 조회하세요.
SELECT Name, Population
FROM city
WHERE Name LIKE 'S%'
ORDER BY Population DESC LIMIT 5;

-- 4. country 테이블에서 인구(Population)가 1000만에서 5000만 사이인 나라들을 조회하세요.
-- 결과는 나라 이름(Name)과 인구(Population)를 인구가 많은 순서로 정렬하여 조회하세요.
SELECT Name, Population
FROM country
WHERE Population BETWEEN 10000000 AND 50000000
ORDER BY Population DESC;


-- 5. country 테이블에서 대륙(Continent)이 'Europe', 'Asia', 'North America'인 나라들 중 GNP가 높은 상위 10개 나라를 조회하세요.
-- 결과는 나라 이름(Name)과 GNP를 내림차순으로 정렬하여 조회하세요.
SELECT Name, GNP
FROM country
WHERE Continent IN ('Europe', 'Asia', 'North America')
ORDER BY GNP DESC LIMIT 10;