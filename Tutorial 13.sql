#Solving Queries.
show databases;
use world;
show tables;
#select * from country;
select * from city;
select * from countrylanguage;
select * from city join countrylanguage cl;
select c.population,cl.language, c.district from city c join countrylanguage cl;

#Query 1: To find population with respect to district.
select c.population,cl.language,c.countrycode,cl.countrycode,c.district from city c cross join countrylanguage cl;
select c.district,c.population,cl.language from city c cross join countrylanguage cl
where(c.countrycode=cl.countrycode) group by district;

#Query 2l


