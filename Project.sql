/*
#OBJECTIVE 1. : Seperate the count of inventory items held at each of two store.  
#OBJECTIVE 2. : Count the active customers for each of stores, seperately.
#OBJECTIVE 3. : Make a list of all staff members, including (first/last name), email adderess
				and, address, and store i dentification number where they work.
#OBJECTIVE 4. : Count all of customer email address stored in database.
#OBJECTIVE 5. : Send the managers name at each store with the full address  
				of  the film's rating, rental rate and replacement cost.
#OBJECTIVE 6. : Pull a list of each inventory item you have stocked including
				store_id number, inventory_id, name of the film's rating,
                rental rate and replacement cost.
#OBJECTIVE 7. : From the list you just pulled, roll the data up and provide summary level overview ov inventory.
				items you have with each rating at each store.
#OBJECTIVE 8. : Number if films and the replacement cost sliced by store and film category.
*/
use sakila;
show tables;
select * from inventory;

-- 1. : Seperate the count of inventory items held at each of two store. 
 select store_id,count(inventory_id) from inventory 
 group by store_id;
 
 
-- 2. : Count the active customers for each of stores, seperately.
select store_id,count(customer_id) as Active_Customers from customer 
where active=1
group by store_id;

-- 3. : Make a list of all staff members, including (first/last name), email adderess and, address, and store identification number where they work.
select * from staff;
select
	first_name,
    last_name,
    email,
    store_id
from staff;

--  4. : Count all of customer email address stored in database.
select * from customer;
select count(email) as Total_Email from customer;

--  5. : Send the managers name at each store with the full address  of  the film's rating, rental rate and replacement cost.
select * from staff;
select * from store;
select
	staff.first_name as manager_first_name,
    staff.last_name as manager_last_name,
    address.address,
    address.district,
    city.city,
    country.country

    
from store
		left join staff on store.manager_staff_id=staff.staff_id
        left join address on store.address_id =address.address_id
        left join city on address.city_id= city.city_id
        left join country on city.country_id=country.country_id;
        
  -- 6. : Pull a list of each inventory item you have stocked including store_id number, inventory_id, name of the film's rating,rental rate and replacement cost. 
  select 
	   inventory.store_id,
       inventory.inventory_id,
       film.title,
       film.rating,
       film.rental_rate,
       film.replacement_cost
       from inventory
		left join film on inventory.film_id=film.film_id;
        
--  7. : From the list you just pulled, roll the data up and provide summary level overview of inventory items you have with each rating at each store.
        select 
        inventory.store_id,
        film.rating,
        count(inventory_id) as INVENTORY_ITEMS
        from inventory 
			left join film on inventory.film_id=film.film_id
            group by
            inventory.store_id,
            film.rating;
            
	-- 8. : Number of  films and the replacement cost sliced by store and film category.
    
    select 
		store_id,
        category.name as category,
        count(inventory.inventory_id) as Films,
        avg(film.replacement_cost) as AVG_REPLACEMENT_COST,
        sum(film.replacement_cost) as TOTAL_REPLACEMENT_COST
        
	from inventory
			left join film on inventory.film_id=film.film_id
            left join film_category on film.film_id=film_category.film_id
            left join category on category.category_id=film_category.category_id
	group by
		store_id,
        category.name
    
            

		
        
        
    