-- 1. How many actors are there with the last name of 'Wahlberg'?
select last_name, count(last_name) 
from actor
where last_name = 'Wahlberg'
group by last_name  
order by last_name;

-- 2. How many payments were made between $3.99 and $5.99
select amount, count(amount)
from payment
where amount >= 3.99 and amount <= 5.99
group by amount 
order by amount;

-- 3. What film does the store have the most of (search in inventory)
select max(film_id) as max_film from inventory;

-- 4. How many customers have the last name ‘William’?
select last_name, count(last_name) 
from customer
where last_name = 'William'
group by last_name  
order by last_name;

-- 5. What store employee (get the id) sold the most rentals?
select max(total_cost), salesperson_id 
from purchase
group by invoice_number 
order by invoice_number desc;

-- 6. How many different district names are there?
select district, count(distinct district)
from address
where district is not null and district <> ''
group by district 
order by district;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
select film_id, count(actor_id)
from film_actor
group by film_id 
order by count(actor_id) desc

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select store_id, last_name
from customer
where last_name like '%es'
group by store_id, last_name  
order by store_id, last_name 

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250
-- for customers with ids between 380 and 430? (use group by and having > 250)
select amount 
from payment
where customer_id >= 380 and customer_id <= 430
group by amount 
having sum(rental_id) > 250
order by amount

-- 10. Within the film table, how many rating categories are there? And what rating 
-- has the most movies total?
select rating, count(rating)
from film
group by rating
order by count(rating) desc
