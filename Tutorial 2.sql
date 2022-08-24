/* Tutorial 2
1.Null values        syntax(select * from tablename where colname is null)
2.Update Statemet    syntax(update tablename set colname=which you want assign id=for which row you want to assign)
3.Delete Statement   syntax(delete from tablename where id=row which you want to delete)
4.Alter Table
--- Add column in Existing column   syntax(alter table tablename add colname varchar(25))
----Modify/alter Column             syntax(alter table tablename modify dob year)
----drop column              syntax(alter table tablename drop column colname)
*/
#Create Database
 create database customer;
 show databases;
 use customer;

 # Create Table into database.
 create table customer_info(
 id integer auto_increment,
 first_name varchar(25),
 last_name varchar(25),
 salary integer,
 primary key(id)
 );
 show tables;
 select * from customer_info;
 #Insert Records into table.
 insert into customer_info(first_name,last_name,salary)
 values
 ('Chetan','Salunke',100000),
 ('Sachin','Ghogare',75000),
 ('Pradip','Fulpagare',100000),
 ('Nikita','Patil',90000),
 ('Komal','Nikam',null);
  #to Check Null values in the table
select * from customer_info;
select * from customer_info where last_name is null;
select * from customer_info where salary is null;
select * from customer_info where salary is not null;
select * from customer_info where last_name is not null;

#Update Statement to replace null values.\
update customer_info set salary=50000 where id=5;

update customer_info set salary=60000 where id=5;
#select * from customer_info where customer_info is null;
select * from customer_info;  

#DELETE STATEMENT.  : Delete the perticular row .
delete from customer_info where id=5;

##SQL Alter table.
select * from customer_info;
alter table customer_info add email varchar(30);    #Adding the column in the table.
alter table customer_info drop column email;        #Drop the column in the table.
alter table customer_info add dob date;              

## alter table modify column
alter table customer_info modify dob year;
 
# Describe
desc customer_info;












