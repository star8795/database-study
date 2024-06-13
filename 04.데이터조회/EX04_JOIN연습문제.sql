USE sakila;

-- MySQL 샘플 DB sakila : 영화 대여점 비즈니스 모델 기반으로 설계된 DB
SELECT a.first_name, a.last_name, f.title
FROM actor AS a
INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
INNER JOIN film AS f ON fa.film_id = f.film_id
ORDER BY a.last_name, a.first_name, f.title;

SELECT c.first_name, c.last_name, f.title, r.rental_date
FROM customer AS c
INNER JOIN rental AS r ON c.customer_id = r.customer_id
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
INNER JOIN film AS f ON i.film_id = f.film_id
ORDER BY c.last_name, c.first_name, r.rental_date;

SELECT s.store_id, f.title, a.address
FROM store AS s
INNER JOIN inventory AS i ON s.store_id = i.store_id
INNER JOIN film AS f ON i.film_id = f.film_id
INNER JOIN address AS a ON s.address_id = a.address_id
ORDER BY s.store_id, f.title;

SELECT c.customer_id, c.first_name, c.last_name
FROM customer AS c
LEFT JOIN rental AS r ON c.customer_id = r.customer_id
WHERE r.rental_id IS NULL
ORDER BY c.last_name, c.first_name;

SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film AS f
INNER JOIN inventory AS i ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC, f.title;

USE sakila;

-- 문제 1: 고객의 이름과 그들이 대여한 영화의 제목을 조회
SELECT c.first_name, c.last_name, f.title
FROM customer AS c
INNER JOIN rental AS r ON c.customer_id = r.customer_id
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
INNER JOIN film AS f ON i.film_id = f.film_id
ORDER BY c.last_name, c.first_name, f.title;

-- 문제 2: 각 영화의 제목과 해당 영화가 속한 카테고리의 이름을 조회
SELECT f.title, c.name AS category_name
FROM film AS f
INNER JOIN film_category AS fc ON f.film_id = fc.film_id
INNER JOIN category AS c ON fc.category_id = c.category_id
ORDER BY f.title, c.name;

-- 문제 3: 각 영화에 대해 출연한 배우의 수를 영화 제목과 함께 조회
SELECT f.title, COUNT(fa.actor_id) AS actor_count
FROM film AS f
INNER JOIN film_actor AS fa ON f.film_id = fa.film_id
GROUP BY f.title
ORDER BY f.title;

-- 문제 4: 모든 대여 정보에 대해 해당 대여가 이루어진 스토어의 ID와 직원의 이름을 조회
SELECT r.rental_id, s.store_id, st.first_name, st.last_name
FROM rental AS r
INNER JOIN staff AS st ON r.staff_id = st.staff_id
INNER JOIN store AS s ON st.store_id = s.store_id
ORDER BY r.rental_id, s.store_id, st.first_name, st.last_name;

-- 문제 5: 가장 많이 대여된 영화 5개의 제목과 대여 횟수를 조회
SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film AS f
INNER JOIN inventory AS i ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;

-- 문제 6: 각 고객별로 지불한 총 금액을 조회
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_amount
FROM customer AS c
INNER JOIN payment AS p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_amount DESC;

-- 문제 7: 각 카테고리별로 대여된 영화의 총 수를 조회
SELECT c.name AS category_name, COUNT(r.rental_id) AS total_rentals
FROM category AS c
INNER JOIN film_category AS fc ON c.category_id = fc.category_id
INNER JOIN film AS f ON fc.film_id = f.film_id
INNER JOIN inventory AS i ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY c.category_id, c.name
ORDER BY total_rentals DESC;

-- 문제 8: 2005년 7월에 대여된 모든 영화의 제목과 대여 날짜를 조회
SELECT f.title, r.rental_date
FROM rental AS r
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
INNER JOIN film AS f ON i.film_id = f.film_id
WHERE r.rental_date BETWEEN '2005-07-01' AND '2005-07-31'
ORDER BY r.rental_date, f.title;

-- 문제 9: 'Comedy' 카테고리에 속하는 영화들의 평균 대여 기간을 조회
SELECT c.name AS category_name, AVG(f.rental_duration) AS avg_rental_duration
FROM category AS c
INNER JOIN film_category AS fc ON c.category_id = fc.category_id
INNER JOIN film AS f ON fc.film_id = f.film_id
WHERE c.name = 'Comedy'
GROUP BY c.name;

-- 문제 10: 모든 배우의 이름과 그들이 출연한 영화의 수를 조회 (LEFT JOIN 사용)
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
FROM actor AS a
LEFT JOIN film_actor AS fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY a.last_name, a.first_name;
