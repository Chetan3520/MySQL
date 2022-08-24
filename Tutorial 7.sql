## SQL Joins
/* 
1. Inner Join : Return records that existing in both tables, excluding unmatched records
2. Left Join : Return all record from left table, and any matching records from right table.
3. Right Join : Return all record from right table, and any matching record from left table.
4. Full Join : Return all record from both tables, including non matching records.
5. Natural Join
6. Cross join
7. Union: Return all records from table, with all data from another table appended to the end.
*/

use customer;
drop table student;
create table student(
studentid int,
first_name varchar(25),
last_name varchar(25),
age int
);
select * from student;
insert into student values
(1,'Sachin','Ghogare',22),
(2,'Chetan','Salunke',22),
(3,'Pradip','Fulpagare',22),
(4,'Nikita','Patil',22),
(5,'Komal','Nikam',22);
drop table department;
select * from department;
create table department(
studentid int,
department_name varchar(25)
);
insert into department values
(1,'Statistics'),
(2,'Mathematics'),
(3,'Actuarial');

## Inner join
select * from student inner join department 
on student.studentid=department.studentid;
select student.first_name,student.last_name,student.age,department.department_name 
from student inner join department 
on student.studentid=department.studentid; 

#_________________________________________________________________________________________________________________________________

## Left Join
select student.first_name,student.last_name,student.age,department.department_name
from student left join department 
on student.studentid=department.studentid;
#_________________________________________________________________________________________________________________________________

## Right join
select student.first_name,student.last_name,student.age,department.department_name
from student right join department 
on student.studentid=department.studentid;

#________________________________________________________________________________________________________________________________
## Full outer join
select student.first_name,student.last_name,student.age,department.department_name
from student left join department 
on student.studentid=department.studentid

union

select student.first_name,student.last_name,student.age,department.department_name
from student right join department 
on student.studentid=department.studentid;

#_____________________________________________________________________________________________________________________________________________
## Cross join
select student.first_name,student.last_name,student.age,department.department_name
from student cross join department;


show databases;
use world;
show tables;
#select * from country;
select * from city;
select * from countrylanguage;
select * from country c join countrylanguage cl;
select * from country c join countrylanguage cl
on c.Code=cl.Countrycode;
select c.Code,c.Region,cl.IsOfficial,cl.percentage from country c join countrylanguage cl on c.Code=cl.Countrycode; 
select count(*) from country; #counts the no of rows of table.
select count(*) from countrylanguage; 
select * from country,countrylanguage;
select * from country c join countrylanguage cl;


use world;
show tables;
#select * from country;
select * from city;
select * from countrylanguage;
 #join two tables 
select * from city c,countrylanguage cl;  

#Join specific column of the two tables in the database
select c.name,c.countrycode,c.population,cl.percentage from city c join countrylanguage cl; 
#To count no of rows in the tables after using the cross join.
select count(c.countrycode),c.name,c.countrycode,c.population,cl.percentage from city c join countrylanguage cl; 
 
 #Cross join for the same country code.
select c.name,cl.language,c.countrycode,cl.countrycode from city c cross join countrylanguage cl
where c.countrycode=cl.countrycode;
#Calculating no of entries in the tables for same matching countrycode for cross join.
select count(c.countrycode),c.name,cl.language,c.countrycode,cl.countrycode from city c cross join countrylanguage cl
where c.countrycode=cl.countrycode;

#Above Query we can solve using the Inner Join.
select c.name,cl.language,c.countrycode,cl.countrycode from city c inner join countrylanguage cl
on c.countrycode=cl.countrycode;



