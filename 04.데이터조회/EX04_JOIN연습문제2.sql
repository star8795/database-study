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
