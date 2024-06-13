USE world;

-- 문제 1: ORDER BY와 LIMIT 사용
-- 1. country 테이블에서 인구(Population)가 많은 상위 10개의 나라를 조회하세요.
SELECT Name, Population FROM country
ORDER BY Population DESC
LIMIT 10;

-- 문제 2: ORDER BY와 LIMIT, OFFSET 사용
-- 2. city 테이블에서 인구(Population)가 많은 상위 10번째에서 20번째까지의 도시를 조회하세요.
SELECT Name, Population FROM city
ORDER BY Population DESC
LIMIT 10 OFFSET 10;

-- 문제 3: ORDER BY와 LIMIT, OFFSET 사용
-- 3. country 테이블에서 대륙(Continent)이 'Asia'인 나라들을 면적(SurfaceArea) 기준으로 내림차순 정렬하여 상위 5개의 나라를 조회하세요.
SELECT Name, SurfaceArea FROM country
WHERE Continent = 'Asia'
ORDER BY SurfaceArea DESC
LIMIT 5;

-- 문제 4: ORDER BY와 LIMIT 사용
-- 4. city 테이블에서 이름(Name)을 오름차순 정렬하여 첫 5개의 도시를 조회하세요.
SELECT Name FROM city
ORDER BY Name ASC
LIMIT 5;

-- 문제 5: DISTINCT 사용
-- 5. country 테이블에서 고유한 대륙(Continent) 목록을 조회하세요.
SELECT DISTINCT Continent FROM country;

-- 문제 6: ORDER BY와 DISTINCT 사용
-- 6. city 테이블에서 고유한 국가 코드(CountryCode)를 조회하고, 이를 오름차순으로 정렬하세요.
SELECT DISTINCT CountryCode FROM city
ORDER BY CountryCode ASC;
