show databases;
Use  world;
show tables;
select * from countrylanguage;
select language from countrylanguage;
select distinct language from countrylanguage; # To access the unique values in the column.
select distinct IsOfficial from countrylanguage;
use sakila;
#Where Clause Where Operator.

show tables;
select * from country;
select count(*) from country; # count the no of rows.
select * from city;
select * from city where country_id=44; #as per country 44 code access the the city of india.

select * from city where last_update='2006-02-15 04:45:25';#for date we consider as string and solve query





