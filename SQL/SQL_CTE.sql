-- CTE=> (Common Table Expression)
         --  this is a temperory result which can be use with inside one sql statement
         -- it is meanly use to code readebility 
         -- it a make your complex query is easy
         -- cte can be use N number of time
         --  cte can be use till the query excutiion  but after query excution  therewill be no use of it.
         
         
use regex2;
show tables;
select * from employee;
 with test as
 ( select dept, avg(salary)as avgsalary from employee group by dept) 
 
 select e.name,e.dept,e.salary,test.avgsalary from employee as e join test 
 where e.dept=test.dept and e.salary>test.avgsalary;
 
 select * from (select *,dense_rank() over(order by salary desc) as ranks from employee) as tusar where ranks=2;
 
 
 with cte as 
 (select *,dense_rank() over(order by salary desc) as ranks from employee) 
 select * from cte where ranks=2;
 
 
 -- -----------------------------------------------------------------------------------------------------------;
 -- 19/3/2025 
 use world;
 select code,name,continent from country where continent='Europe'
 union
 select code ,name ,population from country where continent='asia';
 
 
 select code,name,continent from country where code in ('ALB','AND')
 union all
 select code ,name ,population from country where code in ('ALB','BIH');
 
 select code,name,continent from country where code in ('ALB','AND')
 except, intersect(common)
 select code ,name ,continent from country where code in ('ALB','BIH');
 
 
 
 
 -- h.w 
 -- recusive cpe 
 
 -- ----------------------------------------------------------------------------------------------------------------------------------------
 -- 20/3/2026
 use world;
 select * from country;
 
 use windowdb ;


CREATE TABLE customers1 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE orders1 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items1 (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE customer_monthly_summarys (
    summary_month DATE,
    customer_id INT,
    customer_name VARCHAR(100),
    total_orders INT,
    total_spent DECIMAL(12,2),
    customer_category VARCHAR(20)
);



INSERT INTO customers1 (customer_id, customer_name, city) VALUES
(101, 'Amit Sharma', 'Mumbai'),
(102, 'Priya Verma', 'Delhi'),
(103, 'Raj Mehta', 'Pune'),
(104, 'Sneha Iyer', 'Chennai');


INSERT INTO orders1 (order_id, customer_id, order_date, status) VALUES
(1001, 101, '2026-02-05', 'Completed'),
(1002, 101, '2026-02-12', 'Completed'),
(1003, 102, '2026-02-08', 'Completed'),
(1004, 102, '2026-02-18', 'Pending'),
(1005, 103, '2026-02-10', 'Completed'),
(1006, 103, '2026-02-22', 'Completed'),
(1007, 104, '2026-02-15', 'Cancelled'),
(1008, 101, '2026-02-25', 'Completed');


INSERT INTO order_items1 (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1001, 201, 2, 5000.00),
(2, 1001, 202, 1, 7000.00),

(3, 1002, 203, 3, 4000.00),
(4, 1002, 204, 2, 3000.00),

(5, 1003, 205, 5, 2500.00),
(6, 1003, 206, 2, 3500.00),

(7, 1004, 207, 1, 10000.00),

(8, 1005, 208, 2, 2000.00),
(9, 1005, 209, 1, 1500.00),

(10, 1006, 210, 4, 1000.00),
(11, 1006, 211, 2, 1250.00),

(12, 1007, 212, 3, 5000.00),

(13, 1008, 213, 5, 6000.00),
(14, 1008, 214, 1, 8000.00);
 
show tables; 
select * from order_items;

select * from orders1;


create database cteclass;
use cteclass ;


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE customer_monthly_summary (
    summary_month DATE,
    customer_id INT,
    customer_name VARCHAR(100),
    total_orders INT,
    total_spent DECIMAL(12,2),
    customer_category VARCHAR(20)
);



INSERT INTO customers (customer_id, customer_name, city) VALUES
(101, 'Amit Sharma', 'Mumbai'),
(102, 'Priya Verma', 'Delhi'),
(103, 'Raj Mehta', 'Pune'),
(104, 'Sneha Iyer', 'Chennai');


INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(1001, 101, '2026-02-05', 'Completed'),
(1002, 101, '2026-02-12', 'Completed'),
(1003, 102, '2026-02-08', 'Completed'),
(1004, 102, '2026-02-18', 'Pending'),
(1005, 103, '2026-02-10', 'Completed'),
(1006, 103, '2026-02-22', 'Completed'),
(1007, 104, '2026-02-15', 'Cancelled'),
(1008, 101, '2026-02-25', 'Completed');


INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1001, 201, 2, 5000.00),
(2, 1001, 202, 1, 7000.00),

(3, 1002, 203, 3, 4000.00),
(4, 1002, 204, 2, 3000.00),

(5, 1003, 205, 5, 2500.00),
(6, 1003, 206, 2, 3500.00),

(7, 1004, 207, 1, 10000.00),

(8, 1005, 208, 2, 2000.00),
(9, 1005, 209, 1, 1500.00),

(10, 1006, 210, 4, 1000.00),
(11, 1006, 211, 2, 1250.00),

(12, 1007, 212, 3, 5000.00),

(13, 1008, 213, 5, 6000.00),
(14, 1008, 214, 1, 8000.00);
 
 
 select * from order_items;
 select * from orders; 
 
 select * from orders where status='completed';
 with completed_orders as (
 select * from orders where status='completed'),
 
 cte_join as (
 select co.order_id,co.customer_id,co.order_date,day(co.order_date)as days, oi.product_id,oi.quantity,oi.unit_price,(oi.));
 
 
 
 
 
 -- ------------------------------------------------- Recursive cte 
 with recursive cte as(select 10 as n 
 union all
 select n+1 from c
 te where n<13 -- base case 
 ) 
 select * from cte;
 
 
 -- --------------------------------------------------------23/3/2026-----------------------------
 
 create database ctedb;
use ctedb;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees (emp_id, emp_name, manager_id) VALUES
(1, 'CEO', NULL),
(2, 'Manager A', 1),
(3, 'Manager B', 1),
(4, 'Team Lead A1', 2),
(5, 'Team Lead A2', 2),
(6, 'Developer A1', 4),
(7, 'Developer A2', 4),
(8, 'Developer B1', 3);


select * from employees;

select * from employees where manager_id is null;

select emp.emp_id,emp.emp_name,emp.manager_id,mag.emp_name as boss  from employees as emp
left join employees as mag
on emp.manager_id=mag.emp_id;

select emp.emp_id,emp.emp_name,emp.manager_id,mag.emp_name as boss,dense_rank() over(partition by mag.emp_name) as levels  from employees as emp
 join employees as mag
on emp.manager_id=mag.emp_id;  -----works


with cte as
(select emp_id,emp_name,manager_id,emp_name as hierachy
from employees where manager_id is null)

select e1.emp_id,e1.emp_name,e1.manager_id,cte.emp_id,cte.emp_name,concat(e1.emp_name,'-->',cte.hierachy) from cte join employees as e1
where e1.manager_id=cte.emp_id and e1.emp_id=2;

with recursive cte as
(select emp_id,emp_name,manager_id,emp_name as hierachy
from employees where manager_id is null
union all

select e1.emp_id,e1.emp_name,e1.manager_id,concat(e1.emp_name,'-->',cte.hierachy) as hierachy from employees as e1 join cte
where e1.manager_id=cte.emp_id)

select * from cte; 



-- whats is TCL?
-- commite,rollback,and start tanstion?
-- drop vs delete vs truncate?
-- wats id normalization 1nf,2nf,3nf,bcnf?



with recursive cte as
(select emp_id,emp_name,manager_id,1 as level
from employees where manager_id is null
union all

select e1.emp_id,e1.emp_name,e1.manager_id,cte.level +1  from employees as e1 join cte
where e1.manager_id=cte.emp_id) 

select * from cte;

