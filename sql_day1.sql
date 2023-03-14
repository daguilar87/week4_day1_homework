-- Hello world!
-- this is a comment

SELECT -- what? are we trying to gran
FROM actor; -- from where?

SELECT *
FROM actor;

--- let's grab the first and last name
SELECT first_name, last_name
FROM actor;

--- WHERE clause
-- this is how we filter out the results of our conditionals 
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

-- Single quotes for Strings, literals vs Double quotes for Database identifiers


-- We can use LIKE instead of just = for strings
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

--wildcards for use with like:  _ and %
-- % is a true wildcare - any character AND  number of characters
-- _ is one character wildcard

-- 3 underscores means starts with j and 3 letters..
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'N%';

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J___%hy';

-- comparison operators:
-- = and like examples above
-- Greater/less >    <=   >= all valid as usual
-- NOT equal is <>


SELECT * from address;

SELECT *
FROM address
WHERE district like 'Texas';

SELECT * FROM payment;

-- let's find customers who paid more than $2
SELECT customer_id, amount
from payment
where amount > 2;

-- query customers who paid less then 7.99

SELECT customer_id, amount
from payment
where amount < 7.99;

SELECT customer_id, amount
from payment
where amount <= 7.99;

-- we can use OR AND with the WHERE clause

SELECT customer_id, amount
from payment
where amount <= 7.99 and amount > 0;

SELECT customer_id, amount
from payment
WHERE amount > 2 or amount > 7.99;

--We can also use BETWEEN, works the same as <= >=

SELECT customer_id, amount
from payment
where amount BETWEEN 0 and 7.99;

-- ORDER BY 


SELECT customer_id, amount
from payment
where amount BETWEEN 0 and 7.99
ORDER BY amount ASC; -- switch back and forth with ASC, DESC, DESC is default


--not equal
SELECT customer_id, amount
from payment
where amount <> 0.00
ORDER BY amount ASC;


SELECT customer_id, amount
from payment
where amount > 10;


SELECT * from customer; --- checking out customer table

SELECT first_name, last_name
from customer
where customer_id = 341;

-- Peter Menard is our big baller!

-- SQL aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()

-- query to show the sum of amounts greater then 5.99

SELECT SUM(amount)
from payment
WHERE amount > 5.99;


--- same but average

SELECT AVG(amount)
from payment
WHERE amount > 5.99;

-- count
select COUNT(amount)
from payment;

SELECT * from payment;


--what about indivdual amounts? unique..

SELECT COUNT(DISTINCT amount)
from payment
WHERE amount > 5.99;

-- QUERY to display min amount greater than 6.99

SELECT Min(amount)
FROM payment
WHERE amount > 6.99

-- QUERY to display max amount greater than 6.99

SELECT MAX(amount) AS biggest_over_7
FROM payment
WHERE amount > 6.99

-- Group by
-- any column not in aggregate must be in a group by used in conjuction
-- with aggregates to modify behavior or aggregate groups rows

-- example of note from above
select amount, count(amount), sum(amount)
from payment
GROUP BY amount
ORDER BY sum(amount) DESC;

--bring it back to more straight-forward examples
select amount
from payment
where amount = 6.99

SELECT amount, count(amount)
from payment
GROUP BY amount
order by amount;

-- lets look at customer ids with summed amounts for those ids
select customer_id, SUM(amount)
from payment
group by customer_id
order by customer_id desc;

SELECT customer_id, amount
from payment
GROUP BY amount, customer_id
order BY customer_id desc;

select customer_id, sum(amount)
from payment
GROUP BY customer_id
order BY customer_id;


-- query display cus_ids that show up more than 5 times

select count(customer_id), email
from customer
where email like 'j__.w%'
GROUP BY email
Having count(customer_id) > 0;

-- general rules ... 

select customer_id SUM(amount) -- select is what you want to see
from payment -- from where?
                -- these are our basic building blocks!
where customer_id BETWEEN 70 and 80 --how or filter
GROUP BY customer_id            -- using aggregates
Having sum(amount) > 150           --- this is how for aggregates
ORDER BY customer_id 
LIMIT 3      -- always at/towards end
offset 1;

select * 
from payment
where amount < -427.01
LIMIT 25;
offset 8    --- offset will make the list start after 8 items


--clasuses we've talked about so far
--select <columns> <aggregates>
--from <table>
-- where <conditional>
-- group by <columns>
--having <conditionals>
-- order by <column>