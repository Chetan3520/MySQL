/* 
- Pivoting the data is similar to excel pivot table but excel makes it easy into rows and columns.
- In mysql we can do the same by using 'Group by' combined with 'CASE' & 'count'.
*/
  
show databases;
use sakila;
show tables;
select * from inventory;

select
      inventory_id,
      -- film_id,
count(case WHEN store_id=1 THEN inventory_id else NULL END) AS store_1_inventory,
count(case WHEN store_id=2 THEN inventory_id else NULL END) AS store_2_inventory
    
from inventory
group by inventory_id
   order by inventory_id;


select
      film_id,
count(case WHEN store_id=1 THEN inventory_id else NULL END) AS store_1_inventory,
count(case WHEN store_id=2 THEN inventory_id else NULL END) AS store_2_inventory
    
from inventory
group by 
         film_id
   order by film_id;
