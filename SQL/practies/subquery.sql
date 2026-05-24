-- Table creation for practice
create database if not exists sub_db;
create database subquery;
use subquery;

DROP TABLE IF EXISTS DEPARTMENTS;

CREATE TABLE DEPARTMENTS (
    DEPT_ID    INT          NOT NULL AUTO_INCREMENT,
    DEPT_NAME  VARCHAR(50)  NOT NULL,
    LOCATION   VARCHAR(100) NOT NULL,
    PRIMARY KEY (DEPT_ID)
);


INSERT INTO DEPARTMENTS (DEPT_NAME, LOCATION) VALUES
    ('HR',      'Mumbai'),
    ('IT',      'Bangalore'),
    ('Finance', 'Delhi');


DROP TABLE IF EXISTS EMPLOYEES;

CREATE TABLE EMPLOYEES (
    EMP_ID      INT          NOT NULL,
    NAME        VARCHAR(100) NOT NULL,
    DEPARTMENT  VARCHAR(50)  NOT NULL,
    SALARY      DECIMAL(10,2) NOT NULL,
    MANAGER_ID  INT          NULL,
    PRIMARY KEY (EMP_ID),
    FOREIGN KEY (MANAGER_ID) REFERENCES EMPLOYEES(EMP_ID)
);


INSERT INTO EMPLOYEES (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
    (101, 'Alice',   'HR',      50000.00, NULL),
    (104, 'Diana',   'Finance', 90000.00, NULL);

-- Employees who report to Alice (101) or Diana (104)
INSERT INTO EMPLOYEES (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID)
VALUES
    (102, 'Bob',     'IT',      80000.00, 101),
    (103, 'Charlie', 'IT',      75000.00, 101),
    (105, 'Eve',     'HR',      48000.00, 101),
    (106, 'Frank',   'Finance', 95000.00, 104),
    (107, 'Grace',   'IT',      82000.00, 101);


SELECT * FROM DEPARTMENTS;
SELECT * FROM EMPLOYEES;
SELECT * FROM EMPLOYEES ORDER BY EMP_ID;


-- ex.1 find the employee with the highest salary. 
select name,salary from employees where salary =(select max(salary) from employees);
-- ex.2 find employess who eran more than alice. 
select name,salary from employees where salary >(select salary from employees where emp_id=101);






-- => practice Question on subqueries
-- Table 2: CUSTOMERS
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID VARCHAR(10) PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(50),
    CITY VARCHAR(50),
    CREDIT_LIMIT INT
);

INSERT INTO CUSTOMERS (CUSTOMER_ID, CUSTOMER_NAME, CITY, CREDIT_LIMIT) VALUES
('C01', 'Ravi Kumar', 'Delhi', 100000),
('C02', 'Priya Singh', 'Mumbai', 80000),
('C03', 'Amit Sharma', 'Bangalore', 60000),
('C04', 'Neha Joshi', 'Chennai', 50000);


-- Table 3: PRODUCTS
CREATE TABLE PRODUCTS (
    PRODUCT_ID VARCHAR(10) PRIMARY KEY,
    PRODUCT_NAME VARCHAR(50),
    CATEGORY VARCHAR(50),
    PRICE INT
);

INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, CATEGORY, PRICE) VALUES
('P01', 'Laptop', 'Electronics', 55000),
('P02', 'Headphones', 'Electronics', 3000),
('P03', 'Desk Chair', 'Furniture', 12000),
('P04', 'Notebook', 'Stationery', 150);


-- Table 1: ORDERS
CREATE TABLE ORDERS (
    ORDER_ID INT PRIMARY KEY,
    CUSTOMER_ID VARCHAR(10),
    PRODUCT_ID VARCHAR(10),
    QUANTITY INT,
    ORDER_DATE DATE,
    STATUS VARCHAR(20),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
);

INSERT INTO ORDERS (ORDER_ID, CUSTOMER_ID, PRODUCT_ID, QUANTITY, ORDER_DATE, STATUS) VALUES
(1001, 'C01', 'P01', 2, '2024-01-05', 'Delivered'),
(1002, 'C02', 'P02', 1, '2024-01-10', 'Pending'),
(1003, 'C01', 'P03', 5, '2024-01-12', 'Delivered'),
(1004, 'C03', 'P01', 3, '2024-01-15', 'Cancelled'),
(1005, 'C02', 'P04', 2, '2024-02-01', 'Delivered'),
(1006, 'C04', 'P02', 1, '2024-02-05', 'Pending'),
(1007, 'C03', 'P03', 4, '2024-02-10', 'Delivered');

-- Q; find the names of customers who have placed at least one order. 
select customer_name from customers where customer_id in (select customer_id from orders);

-- Q2 find product that have never been ordered. 
select product_name from products where product_id not in (select product_id from orders);

-- Q3. find customers whose credit limit is above the average credit limit of all customers. 
select customer_name from customers where credit_limit >( select avg(credit_limit) from customers);

-- Q4; find the most expensive product. 
select product_name,price from products where price=(select max(price) from products);

-- Q5; find orders where the products price is above 10000. 
select order_id from orders where product_id in (select product_id from products where price>10000);

-- Q6. find customers who have placed more than 2 orders. 
select customer_id,count(customer_id) as placed_order from orders group by customer_id having placed_order>=2;
select customer_name from customers
 where customer_id in (select customer_id  from orders group by customer_id having count(customer_id)>=2); -- more then 2 =0 but equal hai

-- Q7. find all 'delivered' order where the product belongs to the 'Electronics category'
 select order_id from orders  where status='delivered' and product_id in (select product_id from products where category='electronics');


-- Q8. find the customer who placed the maximum number of orders.   -- sir se samjhna hai
select count(customer_id) as orderc from orders group by customer_id;
select customer_id  from orders group by customer_id order by count(customer_id) desc limit 1;
select customer_name from customers where customer_id=(select customer_id  from orders group by customer_id order by count(customer_id) desc limit 1); 

-- Q9; find products whose price is greater than all products in the statinery category. 
select product_name from products where price >any (select max(price) from products where category='stationery');

-- 10; find customers who have not placed any orders with status'cancelled'.
select customer_name from customers where customer_id in (select customer_id from 	orders where status='cancelled') ;
-- 11; find orders placed by customers from 'delhi'.
select order_id,customer_id from orders where customer_id in( select customer_id from customers where city='delhi');
-- Q12; find products that have been  ordered with a quantity greater than 3 at least once.
select product_name from products where product_id in (select distinct product_id from orders where quantity>3);
 
-- Q13; find all customers whose credit limit is less than the credit limit of 'ravi kumar'. 
select customer_name from customers where credit_limit <(select credit_limit from customers where customer_name ='ravi kumar');

-- Q 14; find customers who have placed orderes for products in the 'furniture' category. 

-- Q15; find the second most expensive product. 
select product_name from products where price=(select price from products order by price desc limit 1,1);
-- Q16; find customers who exits in the customers table but have no record in the orders table. 
select customer_name from customers as c where not exists (select 1 from orders as o where o.customer_id=c.customer_id);
-- Q17. find products that were ordered more total quantity than the average total quantity ordered per product.
select product_id,sum(quantity)as sum_qty from orders group by product_id; 
 
select product_name from products where product_id in 
(select product_id from orders group by product_id having sum(quantity)>
(select avg(sum_qty) from (select product_id,sum(quantity)as sum_qty from orders group by product_id) as k ));


-- Q18; find orders where the ordered quantity is greater than the average quantity of orders for that same product. 
select o.order_id,o.product_id,o.quantity from orders as o
where o.quantity >(select avg(ord.quantity) from orders as ord where ord.product_id=o.product_id);
-- Q19; find customers who have placed orders for every product that costs more than 10000.
select 1 from products as p where p.price>10000;

select customer_name from customers as c where not exists(select 1 from products as p where p.price>10000
and not exists (select 1 from orders as o where o.customer_id=c.customer_id and o.product_id=p.product_id)) ;

-- q20; find products that have been ordered by least 2 different customers.
select product_name from products where product_id =any
(select product_id from orders group by product_id having count(distinct customer_id)>=2);




