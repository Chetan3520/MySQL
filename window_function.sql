show databases;
#_________________________________________________________________
#GGREGATE WINDOOW FUNCTION
#_________________________________________________________________

#Dataset Link : https://drive.google.com/drive/folder...
use practice;
CREATE TABLE marks (
 student_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    branch VARCHAR(255),
    marks INTEGER
);
select * from marks;
#drop table marks;

INSERT INTO marks (name,branch,marks)VALUES 
('Nitish','EEE',82),
('Rishabh','EEE',91),
('Anukant','EEE',69),
('Rupesh','EEE',55),
('Shubham','CSE',78),
('Ved','CSE',43),
('Deepak','CSE',98),
('Arpan','CSE',95),
('Vinay','ECE',95),
('Ankit','ECE',88),
('Anand','ECE',81),
('Rohit','ECE',95),
('Prashant','MECH',75),
('Amit','MECH',69),
('Sunny','MECH',39),
('Gautam','MECH',51)
;
select * from marks;
#drop table marks;
 
# Note: marks a table name as well as column inside that table
# Write the Query for the departmentwise avg marks
SELECT *,
       AVG(marks) OVER (PARTITION BY branch) AS avg_marks
FROM marks;


SELECT*,
min(marks) OVER(partition by branch ) as lower_branch_marks,
AVG(marks) OVER(PARTITION BY branch) AS AVG_branch_marks
from marks;
#_________________________________________________________________
#RANK() DENSE_RANK()
#_________________________________________________________________

SELECT * from (SELECT*,
			rank() over(partition by branch order by marks desc) as rank_
			from marks) t
	where t.rank_=1;
	



#find out the students who have marks greater than a average marks of the braches

select * from 
(select *, avg(marks) over(partition by branch) as branch_avg from marks) t	
where t.marks>t.branch_avg;


#min and maximum marks for branch
select *, min(marks) over(),
max(marks) over()
from marks;

select branch,min(marks),max(marks) from marks 
group by branch ;  #here we can not take with regarding student.


#In the zomato data top 2 most paying customers of each month
use practice;
select * from orders;
SELECT monthname(date)AS MONTH_,sum(amount) from orders
group by monthname(date);

 
SELECT * from(SELECT  monthname(date) AS 'MONTH_', user_id, sum(amount) as 'total',
			rank() over(partition by monthname(date) order by sum(amount) desc) Rank_
			from orders
			group by MONTH_,user_id
			order by MONTH_ desc) t
where t.Rank_<3;
#_________________________________________________________________________________
#FIRST_VALUE LAST_VALUE NTH_VALUE  WINDOW FUNCTION & FRAME
#___________________________________________________________________________________
SELECT * FROM ORDERS;

 SELECT MONTHNAME(DATE),USER_ID, SUM(AMOUNT),
				first_value(SUM(AMOUNT)) OVER(partition by MONTHNAME(DATE) ORDER BY SUM(AMOUNT) desc) AS TOP 
				FROM ORDERS
				group by MONTHNAME(DATE),USER_id
				ORDER BY MONTHNAME(DATE) desc;
                
		
SELECT *,
first_value(marks) over(order by marks desc)
FROM marks
;

/*ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
 defines the window frame. It includes
 all rows from the beginning of the partition up to and including the current row.
 
 RANGE BETWEEN x PRECEDING AND y FOLLOWING: 
 Similar to ROWS BETWEEN, but instead of specifying a number 
 of rows, it specifies a range of values based on the values of the ordering column.
 This is particularly useful when dealing with time-based dat
 
 */

SELECT *, last_value(marks) OVER(ORDER BY marks desc
								ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) # THE CRITERIA TO SELECT THE LAST ROW
from marks;  

#SELECT THE NAME OF THE STUDENT WHO GOT LEAST MARK IN BRANCH

SELECT *, last_value(name) OVER(PARTITION BY branch ORDER BY marks desc
								ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as low_stu_name # THE CRITERIA TO SELECT THE LAST ROW
from marks;  
#SELECT THE NAME OF THE STUDENT WHO GOT most MARKs IN BRANCH

SELECT *, first_value(name) OVER(PARTITION BY branch ORDER BY marks desc
								ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as low_stu_name # THE CRITERIA TO SELECT THE LAST ROW
from marks;  

#find the second 2nd topper in all the branches
select * from marks
order by marks;
SELECT * FROM  (SELECT *,nth_value(name,2) over(partition by branch order by marks desc
						ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as 
                        second_topper,
                        nth_value(marks,2) over(partition by branch order by marks desc
						ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as 
                        second_topper_marks
                        from marks)t 
	WHERE t.name=t.second_topper and t.marks=t.second_topper_marks;
    
#find the monthly highest purches customers in zomato data 
select * from 
	(select monthname(date) as 'month',user_id, sum(amount) as 'total',
	nth_value(user_id,1) over(partition by monthname(date)  order by sum(amount) desc) as high_purchasor
	from orders
	group by monthname(date),user_id) t
    where t.user_id=t.high_purchasor;
    
    
    
#second most purchased amount


select max(amount) as second_max
from orders 
where amount<(select max(total) as max from(select user_id, sum(amount) as 'total' from orders
				group by  user_id
				order by sum(amount) desc) t);
                




			

