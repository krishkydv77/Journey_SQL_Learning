 -- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  --               Subquery
 --                all type subquery
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




-- subquery:- query with a query (Question ke andar Quesrion)
--  sub query is aslo called as nested query and inner query

use world;
select * from city;
-- i have to find the name of only those cities whose country code is equal 'afghanistan'
select name,countrycode from city where countrycode='afg';

-- q; find out me those city ,countrycode of silang 
select name, countrycode from city where countrycode=(select countrycode from city where name='silang');

select name, countrycode from city where countrycode=(select countrycode from city where name='oran');

-- Q; i have to get information about those cities whose population is more than the population of oran. 
select * from city where population >(select population from city where name ='oran');

-- q; get me the city information those whose district is same as of tafuna city;
select * from city where district=(select district from city where name='tafuna');


--  q; get me the district and its population for all the city where the countrycode  is same as of  city namiba. 
select * from city;
select district,population from city where countrycode=(select countrycode from city where name='namibe');

-- Q; i had get information about those  cities whose countrycode kabhul ke equal ho. 
select * from city where countrycode=(select countrycode from city where name='kabul' );


-- q: get me city name and the district where the district is same as of americana city. 
select name,district from city where district=(select district from city where name='americana');

select * from city where district=(select district from city where name='americana');

-- Q; get me all the city info. where the population ofn city is lass than the popoulation of barueri. 
select * from city where population < (select  population from city where name ='barueri');

select * from country;
-- Q; get me the countrycode, name where the continent is same as of country albnia. 
select code,name from country where continent=(select continent from country where name='albania');

-- Q; get me those country info. where the indepyear should be after the indepyear of afghanistan. 
select * from country where indepyear >(select indepyear from country where name='afghanistan');

-- q; get the name,continent,region and the population all the country where the region is same as of belgium and have indepyear after 1800.
 select * from country where region=(select region from country where name='belgium') and indepyear>1800 ; 
 
 -- q; select the city name and country code where countrycode should be as of EDE city. 
 select * from city;
 select * from city where countrycode=any(select countrycode from city where name='EDE');  -- jab country code 2 aa rhe inke liye =all/any use karte hai
 
 
 -- ----------------------------------------------------------------------------------------------------------
 -- 20/2/2025
 
 use sakila;
 select * from payment;
 
 -- sare column with the lowest payment_id? 
 select min(payment_id) from payment; 
 select * from payment where payment_id=(select min(payment_id) from payment); 
 
 -- Q; get all the payment info with the highest rental_id;
 select * from payment where rental_id=(select max(rental_id) from payment);
 
 -- Q; get me all the paymet info for the earliest(min) payment date;
 select * from payment where payment_date =(select min(payment_date) from payment);
 
 -- Q; collect all the payment info where the amount is same as of payment id of 5.
 select * from payment  where amount =(select amount from payment where payment_id=5); 
 -- q; get the payment info on the payment table where the amount is greater then avg amount of payment table . 
 select * from payment where amount >all (select avg(amount) from payment);
 
 -- Q; get all the payment info where the amount is greater then the maximun amount of customer _id =1;
 select * from payment where amount >(select max(amount) from payment where customer_id=1);
 
 
 -- Q; you need to find the payment id ,staf id and amount only for the payment where the months is equal 
 -- to months of payment id =4;
 select payment_id,staff_id,amount from payment where month(payment_date)=(select month(payment_date) from payment where payment_id=1);
 
 
 -- Q; get the highest payment id from the payment table where the amount is same of payment id =1,customerid =1;
 select * from payment;
 select * from payment where payment_id =any (select max(payment_id) from payment where payment_id=1 and customer_id=1);
 
 
 -- note: in multi row subquery we con't use any comparsion operator.
 
 -- IN :- 
 select * from payment where amount in (select amount from payment where payment_id=3 or payment_id=6);
 
 -- q: get all the payment info where the customer_id is same as the customerId of paymentId 3 or 250;
 select * from payment where customer_id in (select customer_id from payment where payment_id=3 or payment_id=250);











    

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
use world;
select * from country;
-- co
select * from country where region=(select region from country where continent='Europe');

-- get me all the country ,name whose population is equals to the highest population of europe. 
select * from country where population =any (select max(population) from country where continent="Europe");
-- get me all the country info. whose population is greater among all the population of africa.
select * from country where population >any (select max(population) from country where continent='Africa');

-- 24/2/2026
create database regex2;
use regex2;
CREATE TABLE employee (
    eid INT PRIMARY KEY,
    name VARCHAR(50),
    dept VARCHAR(50),
    salary DECIMAL(10,2)
);


INSERT INTO employee (eid, name, dept, salary) VALUES
(101, 'Amit', 'HR', 40000),
(102, 'Neha', 'HR', 45000),
(103, 'Raj', 'IT', 60000),
(104, 'Priya', 'IT', 75000),
(105, 'Suresh', 'IT', 50000),
(106, 'Anita', 'Finance', 55000),
(107, 'Vikram', 'Finance', 65000),
(108, 'Kavita', 'Finance', 48000),
(109, 'Rohit', 'Marketing', 52000),
(110, 'Sneha', 'Marketing', 58000);


select * from employee;
select avg(salary) from employee;

select * from employee as emp1 where salary >(select avg(salary) from employee where dept=emp1.dept);


-- highest paid employee in each  deparment?
select * from employee as emp1 where salary =(select max(salary) from employee where dept=emp1.dept ); 

-- lower paid employee in each  deparment?
select * from employee as emp1 where salary =(select min(salary) from employee where dept=emp1.dept );

-- Employee who earn more than at least one employee in their department?
-- (कर्मचारी जो अपने विभाग के किसी भी अन्य कर्मचारी से अधिक कमाते हैं)
select * from employee as emp1 where salary =(select max(salary) from employee where dept=emp1.dept );  -- mere hissab se
select * from employee as emp1 where salary >any (select salary from employee where dept=emp1.dept );

-- Employee who earn more than all employees in their department except themselves?
select * from employee as emp1 where salary =(select max(salary) from employee where dept=emp1.dept );        -- doubt hai yha

-- 25/2/2026
-- leetcode 

-- 26/2/2026

-- correlated expamle
use world;
show tables;
select * from country;
select * from city;

-- Q; shows the cities whose populaticon is higer than avg. city population of their own country.
select name,population,countrycode from city as c where population > (select avg(population) from city where countrycode=c.countrycode);


-- Q; i want info. about only those cities which have maximam population in the same country.
select * from city as c where population =(select max(population) from city where countrycode=c.countrycode);


-- Q; i want info. about only those cities and countryname which have maximam population in the same country.
select name.c,name.cy from city as c 
join country as cy
on c.countrycode=cy.countrycode where c.population = (select max(c.population) from city where countrycode=c.countrycode); -- doubt hai query nhi chali



-- sabquery ko as table bhi use kar sakte hai
select * from 
(select * from city as c where population =(select max(population) from city where countrycode=c.countrycode)) as subquery;


-- Q; get me the continent name who have the total number of country greater than the number of countries in sounth america?
select * from country;
select continent,count(name) from country
group by continent
having count(name)>(select count(name) from country where continent='South America');  -- name ki jagh * use kar sakte hai


-- pacties pdf question:-

-- Q1;
select sum(salary) from employees group by department;
-- Q2;
select count(emp_id) from employees group by department;
-- Q3;
select char_length(upper(emp_name),3) from employees;
select UPPER(SUBSTRING(name, 1, 3))  from employee;


-- Q4;
select emp_name from employess where length(emp_name)>6;
-- Q5;
select * from employees where month(join_date)>11 and year(join_date)>2025;

-- Q6;
select  name,(2025-year(join_date))as year from employees;
-- Q7;

-- Q8;
select city,count(emp_name) from employees group by city having count(emp_name)>2;

-- Q9;
select city,avg(salary) from employees group by city having avg(salary) between 60000 and 70000;

-- Q10;
select department,city,max(avg(salary)) from employees group by department,city having max(avg(salary));  -- do agregat sath use kar sakte haiu


-- Q11;
select department from employees group by department having count(ciyt)>1; 
