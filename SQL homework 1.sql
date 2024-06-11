--1. How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(last_name) AS wahlberg_count
FROM actor
WHERE last_name = 'Wahlberg';
-- There are two actors with the last name 'Wahlberg'.

--2.How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount) AS chosen_amount_range
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
-- There were 5,602 payments made $3.99 to $5.99.

--3. What film does the store have the most of? (search in inventory)
SELECT COUNT(film_id) AS film_most
FROM inventory
GROUP BY film_id
ORDER BY film_id;
--The store has the most copies of film 1, which had 8 copies

--4. How many customers have the last name ‘William’?
SELECT COUNT(last_name) AS william_count
FROM customer
WHERE last_name = 'William';
--There are 0 customers in the customer database with the last name 'William'.

--5. What store employee (get the id) sold the most rentals?
SELECT COUNT(staff_id) AS sold_most_rentals
FROM rental
GROUP BY staff_id
ORDER BY COUNT(staff_id) DESC;
-- Employee 2 sold the most rentals, renting 8040 items.

--6. How many different district names are there?
SELECT COUNT(DISTINCT district) AS different_districts
FROM address;
--There are 378 different district names.

--7. What film has the most actors in it? 
--(use film_actor table and get film_id)
SELECT film_id, COUNT(film_id) AS number_of_actors
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;
--Film 508 has 15 actors in it.

--8. From store_id 1, how many customers have a last name ending with ‘es’? 
--(use customer table)
SELECT COUNT(last_name) AS last_name_ending_in_es
FROM customer
WHERE last_name LIKE '%es'
--There are 21 last names ending in 'es' from customer table

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above
--250 for customers with ids between 380 and 430? 
--(use group by and having > 250)

SELECT amount, COUNT(amount) AS payment_amount_frequency
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250;
--There are 3 amounts over 250 for customer ids in the range 380 to 430

--10. Within the film table, how many rating categories are there? 
--And what rating has the most movies total? 

--part1: Within the film table, how many rating categories are there? 
SELECT COUNT(DISTINCT rating) AS rating_catagorties
FROM film
--part2:And what rating has the most movies total? 
SELECT rating, COUNT(rating) AS rating_count
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;
--Total answer: There are 5 ratings catagories, PG13 has the most movies within the ratings