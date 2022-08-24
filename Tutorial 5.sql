/*  SQL Indexes
Create index statement in SQL is used to create indexes in tables.
The indexes are used to retrieve data from the database more  quickly than others.
The user can not see the indexes, and they just used to speed up queries/ searches.
Note : Updating the table with indexes takes a lot time than updating a table without indexes.
It is because the indexes also need an update.
So only create indexes on those columns that will be frequently searched against.
*/

use customer;
show tables;
select * from person;
create index index_last_name
on person(last_name);
desc person;

drop table student;

create table student(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int
);
desc student;
create index index_age
on student(age);

create index index_age_first_name
on student(age,first_name);

alter table student
drop index index_age_first_name;

show databases;
use world;
show tables;
select * from country;
select Name from country where Population=8000;
explain select Name from country where Population=8000;
#we can see in the table that without indexing it scan the whole data to solve the query
#Sorting according Population in the dataset.
select Population from country order by Population;
# Let Use the Indexing 
create index index3 
on country(Population); 
select Population from country where Population=8000;
explain select Population from country where Population=8000;
# After using indexing it scan only one row instead of scaning the whole data

create index index_lifeExpectancy
on country(LifeExpectancy);
select LifeExpectancy from country where LifeExpectancy=71.6;
explain select LifeExpectancy from country where LifeExpectancy=71.6;





