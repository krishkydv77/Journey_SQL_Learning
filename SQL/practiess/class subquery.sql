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