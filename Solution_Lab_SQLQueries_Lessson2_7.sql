-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
USE sakila;
SELECT * FROM sakila.category;
SELECT * FROM sakila.film_category;
SELECT c.category_id , COUNT(f.film_id)
FROM sakila.category c
LEFT JOIN sakila.film_category f
ON c.category_id = f.category_id
GROUP BY c.category_id;


-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT * FROM sakila.staff;
SELECT * FROM sakila.payment;

SELECT s.staff_id , COUNT(p.amount)
FROM sakila.staff s
LEFT JOIN sakila.payment p
ON s.staff_id = p.staff_id
WHERE p.payment_date LIKE '2005-08-%'
GROUP BY s.staff_id;


-- 3. Which actor has appeared in the most films?
SELECT * FROM sakila.film_actor;
SELECT * FROM sakila.actor;

SELECT a.actor_id, first_name, last_name, count(film_id) AS actor_film
FROM sakila.actor a
LEFT JOIN sakila.film_actor f
ON a.actor_id = f.actor_id
GROUP BY a.actor_id
ORDER BY actor_film DESC
LIMIT 1;

-- 4. Most active customer (the customer that has rented the most number of films)
select * from sakila.rental;
select * from sakila.customer;

SELECT c.customer_id, first_name, last_name, count(rental_id) AS customer_rental
FROM sakila.customer c
LEFT JOIN sakila.rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY customer_rental DESC
LIMIT 1;


-- 5. Display the first and last names, as well as the address, of each staff member.
select * from sakila.rental;
select * from sakila.customer;
SELECT s.staff_id, first_name, last_name, address, address2, district, postal_code
FROM sakila.staff s
LEFT JOIN sakila.address a
ON s.address_id = a.address_id;


-- 6. List each film and the number of actors who are listed for that film.
SELECT * FROM sakila.film;
SELECT * FROM sakila.film_category;

SELECT f.film_id, title, COUNT(distinct(actor_id))
FROM sakila.film f
LEFT JOIN sakila.film_actor fa
ON f.film_id = fa.film_id
GROUP BY f.film_id;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select * from sakila.payment;
select * from sakila.customer;

SELECT c.customer_id, first_name, last_name, sum(amount) AS total_amount
FROM sakila.customer c
JOIN sakila.payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY last_name ASC;


-- 8. List number of films per category.
SELECT * FROM sakila.category;
SELECT * FROM sakila.film_category;
SELECT c.category_id , name, COUNT(f.film_id)
FROM sakila.category c
JOIN sakila.film_category f
ON c.category_id = f.category_id
GROUP BY c.category_id;

