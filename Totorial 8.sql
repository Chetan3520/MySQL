#  The 6  Elements of SQL
#Select: Identifies the column you want your query to select from your results.
# From: Identifies the tables your query will pull data from.
# where: Specifies the record filtering criteria for filtering your results. (Optionals)
# goup by: Specifies how to group the data in your results.(Optional)
#having: Specifies group filtering criteria for filtering your results. (Optional)
#Order by: Specifies the order in which your query results are display (Optional)





show databases;
Use  world;
show tables;
select * from countrylanguage;
select language from countrylanguage;
select distinct language from countrylanguage; # To access the unique/distinct values in the column.
select distinct IsOfficial from countrylanguage;
use sakila;
#Where Clause Where Operator.

show tables;
select * from country;
select count(*) from country; # count the no of rows.
select * from city;
select * from city where country_id=44; #as per country 44 code access the the city of india.

select * from city where last_update='2006-02-15 04:45:25';#for date we consider as string and solve query

#_____________________________________________________________
 
 # WHERE and AND 
 
select * from city where last_update='2006-02-15 04:45:25' and country_id=44;

#_______________________________________________________________________

 #WHERE and OR
 select * from city where country_id=97 or country_id=44;
 
 #____________________________________________________________________
 # WHERE and IN 
 Select * from city where country_id in(97,44);
 select * from city where country_id in(97,44,50);
  select * from city where country_id in(97,44,50);
  #_____________________________________________________________
  #Like Operator
   #   chetan%:   record start with chetan with any number or character after.
    #  %chetan%:   records contain chetan with any number or character before or after.
    #   %chetan:   records end with chetan any number or character before.
    #  '_erry':    records end with 'erry' with one character before. 
  show databases;
  use world;
  show tables;
  select * from country;
  select governmentform,headofstate from country;
  select governmentform,headofstate from country
    where governmentform like '%Uk';
   select governmentform,headofstate from country
    where headofstate like '%Sassou%';   
    
    #_____________________________________________________
    #Group by.
    show databases;
    use sakila;
    show tables;
    select * from city;
    select country_id,count(city) from city group by country_id;
    
    use world;
    select * from country;
    select Region,count(name) from country group by region;
    
    
#-----------------------------------------------------------------
#Comment and Aliases
select Region as R1,count(name) as no_of_country_belong_to_region from country group by region;
# gave name to the count column .
# we use '#' for single line comment .
 /*------
 For multiple line comment
   */

#___________________________________________________
#Having Statement.
show databases;
use world;
show tables;
select * from country;
select region,count(name) as country_belong_to_the_region from country group by region 
having country_belong_to_the_region>=10;

#_____________________________________________________________________________
show databases;
use world;
show tables;
select * from country;


/* When we want to apply condition on the group by table then we use 'having' 
Statement otherwise we dont need to use.
*/
select name,population from country where population>=8000;

#_______________________________________________________________________________________________
#ORDER BY.
use  world;
select * from country;
select code,population,lifeexpectancy from country ;
select code,population,lifeexpectancy from country
order by population desc ;  #by using desc here the oder by the column with DECREASING ORDER otherwise by INCREASING ORDER.










    
    
    
    

  
   


 
 
 



