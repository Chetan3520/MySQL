show databases;  #show all the database
use mysql;      
create database practice;  #Create the database
use  practice;             #Take in use to that database
show tables;    
create table my_db(id int, first_name varchar(12),
last_name varchar(15),
constraint pk_ primary key(id));

select * from my_db; 
insert into my_db values 
(1,"Chetan", "Salunke"),
(2,"Kanchan", "Mahajan"),
(3,"Anuj","Singh");

select *  from my_db;
#Adding the rows into the table
update my_db set last_name='Salunke' where id=2;
select *  from my_db;

 
 #Edditing the values in the table  (Note we can only use primary key in where condition)
update my_db set
last_name="Salunke" where id=2;
select * from my_db;
drop table my_db;
 
 
 
 
 #Adding the columns in the table
create table Emp(id int, first_name varchar(20) not null 
 ,last_name varchar(20) not null,
 salary int,
 primary key(id));

insert into Emp values
(1,"Chetan","Salunke",300000),
(2,"Pradip" ,"Fulpagare",500000)
;
 select * from Emp;

alter table Emp add age int;
select * from Emp;

#find the column names where null values are present
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Emp'
AND IS_NULLABLE = 'YES';

#How to fill the null values
update Emp set age=coalesce(age,24)
where id>0 ;
select * from Emp;

create table table1(id int);
create table table2(order_id int);
insert into table1 values(1);
insert into table2 values(1),(1);
select * from table1;
select * from table2;
drop table table1;
drop table table2;
select table1.id, table2.order_id from table1
inner join table2 on table1.id=table2.order_id;
show tables;

insert into table1 values(1);

