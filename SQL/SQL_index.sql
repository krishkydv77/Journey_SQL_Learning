-- indexes:-
--  this indexes are the database objects.  objects=> view,
--  indesx expl. as like phone book libary
-- STEP 1: Create practice database
show databases;
drop database index_demo1;
CREATE DATABASE index_demo;
USE index_demo;

-- STEP 2: Create the employees table (NO indexes yet, except Primary Key)
CREATE TABLE employees (
    emp_id     INT PRIMARY KEY AUTO_INCREMENT,
    emp_name   VARCHAR(100) NOT NULL,
    email      VARCHAR(150),
    department VARCHAR(50),
    salary     DECIMAL(10,2),
    city       VARCHAR(50),
    hire_date  DATE
);

-- STEP 3: Insert 100,000 sample rows using a stored procedure
DELIMITER $$
CREATE PROCEDURE fill_employees()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 100000 DO
    INSERT INTO employees (emp_name, email, department, salary, city, hire_date)
    VALUES (
      CONCAT('Employee_', i),
      CONCAT('emp', i, '@company.com'),
      ELT(1 + MOD(i, 5), 'IT','HR','Finance','Marketing','Operations'),
      40000 + (MOD(i, 60000)),
      ELT(1 + MOD(i, 4), 'Mumbai','Delhi','Bangalore','Chennai'),
      DATE_ADD('2015-01-01', INTERVAL MOD(i, 3650) DAY)
    
    );
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;

-- STEP 4: Run the procedure (this may take 30-60 seconds)
CALL fill_employees();

-- STEP 5: Verify data
SELECT COUNT(*) FROM employees;
-- Expected result: 100000 


  -- culaster index
 drop table test100;
 create table test100(id int,name varchar(20));
 insert into test100 values(5,'yesh'),(4,'rohan'),(3,'krishan'),(2,'tusar'),(1,'kesav');
 alter table test100 add primary key(name);
 describe test100;
 explain format=tree select * from test100 where id=2;
 explain select * from test100 where name ='tusar';
 
 
 -- non culester
 
  create table test200(id int,name varchar(20));
 insert into test200 values(5,'yesh'),(4,'rohan'),(3,'krishan'),(2,'tusar'),(1,'kesav');
 insert into test200 values(2,'riya');
 --  table test100 add primary key(name);
 select* from test200;
 describe test200;
 
 create index id_index_tusar on test200(id);
show indexes from test200;
 explain format=tree select * from test200 where id=2;
 explain select * from test200 where name ='tusar';
 
 
--  hw.
--  
--  composit index:-
--  1.apply where condition frist column ()
--  2. create a partial index 
 
 drop table tusar;
 CREATE TABLE tusar (
    id INT ,
    name VARCHAR(50),
    age INT,
    email VARCHAR(100),
    role VARCHAR(50)
);

INSERT INTO tusar (id, name, age, email, role) VALUES
(1, 'Amit Sharma', 28, 'amit.sharma@example.com', 'Software Engineer'),
(2, 'Priya Verma', 32, 'priya.verma@example.com', 'HR Manager'),
(9, 'Rohit Singh', 26, 'rohit.singh@example.com', 'Data Analyst'),
(4, 'Neha Gupta', 29, 'neha.gupta@example.com', 'UI/UX Designer'),
(5, 'Vikas Mehta', 35, 'vikas.mehta@example.com', 'Project Manager'),
(3, 'Sneha Kapoor', 24, 'sneha.kapoor@example.com', 'Intern'),
(7, 'Arjun Yadav', 31, 'arjun.yadav@example.com', 'Team Lead'),
(6, 'Meera Joshi', 27, 'meera.joshi@example.com', 'QA Engineer'),
(9, 'Karan Malhotra', 30, 'karan.malhotra@example.com', 'DevOps Engineer'),
(5, 'Ritu Saxena', 33, 'ritu.saxena@example.com', 'Business Analyst'),
(11, 'Sandeep Rao', 40, 'sandeep.rao@example.com', 'Director'),
(12, 'Anjali Desai', 25, 'anjali.desai@example.com', 'Content Writer'),
(10, 'Manish Bhatia', 29, 'manish.bhatia@example.com', 'Database Admin'),
(11, 'Pooja Nair', 34, 'pooja.nair@example.com', 'Finance Manager'),
(8, 'Deepak Kumar', 28, 'deepak.kumar@example.com', 'Network Engineer');

describe tusar;
select * from tusar;

create index idx_role_age ON tusar (role, age);
select * from  tusar where role = 'Software Engineer' AND age > 25;
EXPLAIN SELECT * FROM tusar WHERE role = 'Software Engineer' AND age > 25;



-- partial index

CREATE TABLE Projects (
    project_id INT,
    project_name VARCHAR(100),
    manager VARCHAR(50),
    status VARCHAR(20),
    budget INT
);

INSERT INTO Projects (project_id, project_name, manager, status, budget) VALUES
(1, 'Website Redesign', 'Amit Sharma', 'Active', 50000),
(2, 'Mobile App Development', 'Priya Verma', 'Completed', 120000),
(3, 'Cloud Migration', 'Rohit Singh', 'Active', 200000),
(4, 'Data Warehouse Setup', 'Neha Gupta', 'On Hold', 150000),
(5, 'Cybersecurity Audit', 'Vikas Mehta', 'Completed', 80000),
(6, 'AI Chatbot', 'Sneha Kapoor', 'Active', 60000),
(7, 'ERP Implementation', 'Arjun Yadav', 'On Hold', 250000),
(8, 'Digital Marketing Campaign', 'Meera Joshi', 'Completed', 70000),
(9, 'Network Upgrade', 'Karan Malhotra', 'Active', 90000),
(10, 'HR Portal', 'Ritu Saxena', 'Completed', 40000);


select * from projects;


CREATE INDEX idx_act_proj ON Projects (manager, budget) where status = 'Active';
