drop database parcties;
create database practies;
use practies;
create table sales_data(OrderID int primary key,
CustomerID varchar(20),
Category varchar(20),
OrderDate date,
OrderValue decimal(10,2));
INSERT INTO sales_data VALUES
(1001, 'C201', 'Electronics', '2024-01-05', 12500),
(1002, 'C203', 'Apparel', '2024-01-07', 3200),
(1003, 'C205', 'Home', '2024-01-10', 5800),
(1004, 'C201', 'Electronics', '2024-01-15', 8900),
(1005, 'C207', 'Apparel', '2024-01-18', 2100),
(1006, 'C210', 'Home', '2024-01-22', 4700),
(1007, 'C203', 'Electronics', '2024-02-01', 15300),
(1008, 'C212', 'Apparel', '2024-02-05', 1800),
(1009, 'C205', 'Home', '2024-02-08', 6200),
(1010, 'C214', 'Electronics', '2024-02-12', 9400),
(1011, 'C207', 'Apparel', '2024-02-17', 2900),
(1012, 'C210', 'Electronics', '2024-02-20', 11000),
(1013, 'C212', 'Home', '2024-03-01', 3500),
(1014, 'C201', 'Apparel', '2024-03-05', 4100),
(1015, 'C214', 'Home', '2024-03-10', 7800);


select * from sales_data;

-- Q:- Calculate the total revenue(sum of ordervalue) for each product Category.
select category,sum(ordervalue) as revenue from sales_data group by category  order by revenue desc;
-- Q; Count the total number of orders placed in each Category.
select category,count(orderid) as Total_orders from sales_data group by category;
-- Q; find the highest single ordervalue within each Category. 
select category,max(ordervalue) as highest from sales_data group by category order by highest desc;
-- Q; List all unique product Categories the appear in the sales_data table.
select distinct category from sales_data  group by category order by category asc;
-- Q; list all unique customerIDs who have placed at least one order. 
select distinct customerid from sales_data group by customerid;
-- Q; find all unique combination of customerId and categroy.
select distinct customerId,category from sales_data group by customerid,category order by customerid,category desc;

-- level 3
-- Q1;
select customerId,category,sum(ordervalue) as total_revenue from sales_data group by customerid,category order by customerId,category desc;

-- Q2;
select * from sales_data;
select customerid,category,count(customerid) as order_count from sales_data  group by customerid,category order by customerid,category desc;

-- Q3;
select  category,month(orderdate),sum(ordervalue) as total_revenues from sales_data group by category,month(orderdate) order by category desc,month(orderdate) ;


-- level 4
-- Q1:
select * from sales_data;
select category, sum(ordervalue) as total_revenue from sales_data  group by category having total_revenue>20000;

-- Q2;
select customerid,count(customerid) from sales_data group by customerid having count(customerid)>1;

-- Q3;
select customerid,category,sum(ordervalue) as total_spent from sales_data group by customerid,category order by total_spent desc;

-- level 5
-- Q;
select category, count(customerid) as total_order,sum(ordervalue) as total_revenue,avg(ordervalue) as avg_ordervalue from sales_data
group by category having avg_ordervalue>5000 ; 

-- Q;
select customerid,count(customerid) as order_count,avg(ordervalue) as avg_ordervalue from sales_data
group by customerid having order_count>1 and avg_ordervalue>=6000;


-- Q;
select * from sales_data;
select category,month(orderdate) as Month,count(customerid) as orders ,sum(ordervalue) as total_revenue,avg(ordervalue) as avg_ordervalue from sales_data
group by category,month having orders>=2 order by month,total_revenue desc;








