  /* SQL Constraints.
  SQL Constraints are use to specify any rules for the records in a table 
  Constraints can be used to limit the type of data that can go into a table 
  it ensures the accuracy and reliability of the records the table and
  if there is any violation between the Constraint and the record action,
  the action is aborted. Constraints can be column level or table level.
  Column level constraints apply to a column and table level constraints apply 
   to the whole table.
   
1. Not Null
2. Unique 
3. Primary Key
4. Foreign Key
5. Check 
6. Default
7. Index

*/
show databases;
use customer;
drop table student;
create table student(
id int not null,
first_name varchar(25) not null,
Last_name varchar(25) not null,
age int
);
select * from student;
desc student;
alter table student modify age int not null;
alter table student modify Last_name varchar(25) null;
alter table student modify Last_name varchar(25) not null;

drop table person;
create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(35) not null,
iq_level int not null,
unique(id)
);
select * from person;
insert into person values
(1,'Chetan','Salunke',100),
(2,'chetan','Salunke',100);

#as we mention id is unique  and if we try to insert values for same id then will get error.
insert into person values(1,'Kanchan','Mahajan',100);
delete from person where id=2;
alter table person
add unique(first_name );
desc person;

#____________________________________________________________________________
/*
A primary key is a column or a set of columns that uniquely identifies each row in a table.
A primary key must contain Unique and Not Null values.
a composite primary key can have multiple columns whose comnination must always be unique.
To add a primary key to an existing column use:
alter table <table name> add constraint <constraint name> primary key (<column name>)
To drop a primary key use :
alter table <table_name> drop primary key
*/
#Primary Key
show databases;
use customer;
drop table person1;
create table person1(
id int not null,
first_name varchar(35) not null,
last_name varchar(35) not null,
age int,
constraint PK_ primary key(first_name,last_name)

# add primary key for two columns at one time.
);

select * from person1;
desc person1;
insert into person1 values
(1,'Chetan','Salunke',22),
(2,'Nikita','Patil',21),
(3,'Pradip','Fulpagare',22);
insert into person1 values(4,'Chetu','Salunke',23);  # As a first_name and last_name are primary it not possible to insert duplicate (non unique) information in the table.



#Drop Primary keys .
alter table person1
drop primary key;
desc person1;
#Adding Single primary key.
alter table person1 
add primary key(id);

#Composite Primary Key:
# A table have only one Primary Key.
#(Two tables have primary key means the table have one primary key with combination of two columns.)
# i.e one of the columns have unique values out of two primary key columns.

alter table person1 
add primary key(id,first_name);



describe information_schema.key_column_usage;
select column_name,constraint_name,table_name,table_schema from information_schema.key_column_usage;









