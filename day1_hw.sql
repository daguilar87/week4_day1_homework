-- 1. How many actors are there with the last name ‘Wahlberg’?

SELECT last_name  -- i am choosing the last_name column
FROM actor  -- searching through actor list
WHERE last_name = 'Wahlberg'; -- returning last_name's that have Wahlberg

--2 actors

-- 2. How many payments were made between $3.99 and $5.99?

select customer_id, amount -- selecting customer_id then selecting amount
FROM payment  --searching through payments
where amount between 3.99 and 5.99; -- looking for amounts betweeb 3.99 and 5
99

-- 0 payments

select COUNT(*) -- counting everything
FROM payment  --searching through payments
where amount between 3.99 and 5.99;

-- 3. What film does the store have the most of? (search in inventory)

select max(title)
from film



select *
from inventory

select film_id, count(film_id) -- i am selcting so look for film_id to find how many duplicates to i am using count() for that
from inventory  -- searching through inventory
GROUP BY film_id  --- putting them together in a group of film_id
ORDER BY count; -- ordering my count of film_id

--the store had the most of film_id 350 for 8, there was other similar ids with same count

SELECT film_id, count(actor_id)
from film_actor
GROUP BY film_id
order by count(actor_id) DESC;

-- 4. How many customers have the last name ‘William’?

SELECT last_name -- going to look at last_name column 
from customer  --  looking through customer data
where last_name = 'William'; -- looking for last name matching William

--0

-- 5. What store employee (get the id) sold the most rentals?

SELECT *
from rental;

SELECT staff_id, count(staff_id) -- going to be counting how many times the staff id shows up per rental
from rental -- from the rental data
GROUP BY staff_id; -- grouping staff_id together

-- staff id 1 sold the most rentals 8040

-- 6. How many different district names are there?

select *
from address;

select count(DISTINCT district) --going to look for district names once using distinct and i am using a counter
from address; -- looking in address data

--378

-- 7. What film has the most actors in it? (use film_actor table and get film_id)

select * 
from film_actor; -- searching through film_actor data to look for highest film_id

-- film Id 1000 had the most actors

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

select *
from customer;

SELECT last_name, store_id  -- going through the last names and store id
FROM customer       -- from customer data
WHERE last_name LIKE '%es' and store_id = 1;        --looking for last name ending in es with store id 1

--13

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

SELECT *
from payment;

SELECT count(customer_id), amount --- counting customer-id and going through amounts
from payment -- going through payments data
WHERE amount > 4.99 and customer_id = 380-430   -- conditions where amount needs to be higher then 4.99 and customer id must be 380 -430
GROUP BY amount;  --grouping amount together

--0

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?

select *
from film

select count(DISTINCT rating), max(rating) -- going throgh ratings to count how many different ones there is, max repeated rating
from film; -- going through film

-- 5 different type of ratings and NC-17 is the in the most movies
