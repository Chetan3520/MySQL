/* 4. Foreign Key  (Use to link the two tables together)
5. Check 
6. Default
7. Index
*/
drop database practice;
create database practice;
show databases;


use practice;
drop table friends1;
select * from friends1;
create table friends1(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
nom int not null
);
select * from friends1;

desc friends1;
 
alter table friends1
add constraint pk primary key(id ,age);

# drop primary key
alter table friends1
drop primary key;


# Foreign key
show databases;
use customer;
show tables;

show tables;
drop table friends1;
create table friends1(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
salary int,
primary key(id)
);
desc friends1;

create table department(
id int not null,
department_id int not null,
department_name varchar(25) not null,
primary key(department_id)
);
select * from department;
desc department;

alter table department
add foreign key(id) references friends1(id);
desc freinds1;

drop table friends1;
drop table department;
#_______________________________________________________________

# Check Constraint

desc friends1;

insert into friends1 values(2,'Sachin','ghogare',22,45000);
drop table friends1;
create table friends1(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
salary int,
primary key(id),
check(salary<50000)
);

select * from friends1;
insert into friends1 values(1,'Chetan','Salunke',22,40000);
select * from friends1;
 
 #_______________________________________________________________________

 #Default Constraint 
 drop table friends1;
 create table friends1(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) default 'Raje',
city_name varchar(25) default 'Jalgaon'
);
select * from friends1;
insert into friends1 values(1,'Chetan','Salunke','Chopada');
insert  into friends1 values(2,'Nikita','Patil','Parola');
insert into friends1 values(3,'Pradip','','');
desc friends1;

# drop default value
alter table friends1
alter city_name drop default;




#_______________________________________________________________________________

#Foreign Key 
#Foreign Key is use to maintain referential integrity between two tables. 
#It points  to the primary key of another table.
#Foreign Key Constraint denotes the parent-child relationship between two tables.
show databases;
use chetandb;
drop table depa;
create table depa(depid int,depname varchar(35));
insert into depa values
(10,'Statistics'),
(20,'Actuarial');

select * from depa;
drop table emp;
create table emp(emid int,empname varchar(35));
select * from emp;
insert into emp values
(20,'Chetan'),
(10,'Pradip');


#Foreign key points to the primary key of another table so foreign key is always added on the child table.
select * from emp;
select * from depa;
alter table depa add constraint fk foreign key(emid) references emp(emid); # depa:Parent and emid:Child
alter table emp add constraint pk primary key(emid);
desc emp;
desc depa;

#A child can not exist untill unless parent exist.
#Parent can not delete untill unless child present.
use practice;
create table dept(deptid int,dname varchar(25));
insert into dept values
(10,'sales'),(20,'marketing');
create table empl(eid int, ename varchar(25),deptid int );
insert into empl values
(1,'Chetan',10),(2,'Pradip',20);
drop table empl;
drop table dept;
select * from dept;
select * from empl;
desc dept;
alter table dept add primary key(deptid);
alter table empl add constraint emp_dept_deptid_fk foreign key(deptid) references dept(deptid); 
 #Foreign key add only when the tables are empty.
 #Foreign key points to the primary key of another table so foreign key is always added on the child table.
#empl child table and dept is parent table.


insert into dept values(40,'Revenue');
 delete from   dept where(deptid=40);
 








