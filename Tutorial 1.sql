show databases;              # To show the databases present in the directory.
use world;					 # To use the database 
show tables;				 # to show the tables in the database which we selected for use.
select * from country ;		 # to select the table from the database.


#CREATE THE DATABASE.
drop database Practice;
create database Practice;
use practice;
 
#CREATE THE TABLE IN THE DATABASE.
create table Student(id int,first_name varchar(25),last_name varchar(25));

#INSERT VALUES IN THE TABLE.

insert into Student values
(1,'Chetan','Salunke'),
(2,'Pradip','Fulpagare'),
(3,'Sachin','Ghogare'),
(4,'Nikita','Patil');

select * from Student;



