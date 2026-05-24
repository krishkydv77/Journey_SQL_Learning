 -- ++++++++++++++++++++++++++++++++++++
 -- windown function 
 -- +++++++++++++++++++++++++++++++++++
 
 
show databases;
create database windowdb;
use windowdb;

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    sale_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO Sales (sale_id, customer_name, sale_date, amount) VALUES
(1, 'Alice',   '2024-01-05', 250.00),
(2, 'Bob',     '2024-01-06', 180.50),
(3, 'Charlie', '2024-01-07', 320.75),
(4, 'Alice',   '2024-01-10', 150.00),
(5, 'Bob',     '2024-01-12', 400.00),
(6, 'David',   '2024-01-15', 275.25),
(7, 'Eve',     '2024-01-18', 500.00),
(8, 'Charlie', '2024-01-20', 220.00),
(9, 'Alice',   '2024-01-22', 330.40),
(10, 'David',  '2024-01-25', 145.75),
(11, 'Eve',    '2024-02-01', 600.00),
(12, 'Bob',    '2024-02-03', 210.30),
(13, 'Charlie','2024-02-05', 390.60),
(14, 'Alice',  '2024-02-07', 120.00),
(15, 'David',  '2024-02-10', 310.00),
(16, 'Eve',    '2024-02-12', 450.00),
(17, 'Bob',    '2024-02-15', 275.00),
(18, 'Charlie','2024-02-18', 500.00),
(19, 'Alice',  '2024-02-20', 200.00),
(20, 'David',  '2024-02-22', 350.00),
(21, 'Eve',    '2024-02-25', 700.00),
(22, 'Bob',    '2024-02-27', 150.00),
(23, 'Charlie','2024-03-01', 425.50),
(24, 'Alice',  '2024-03-03', 275.75),
(25, 'David',  '2024-03-05', 500.00);


select * from sales;
select avg(amount) from sales;
select *,(select avg(amount) from sales)as avg_sales from sales; -- subquery
select *,avg(amount) over() from sales;    -- over;= every value print each row

select *,avg(amount) over(),max(amount) over(),sum(amount) over() from sales;

-- every customer ka avg ussi ke samne chahiye
select avg(amount) from sales where customer_name='Alice';
select avg(amount) from sales where customer_name='Alice';

-- with partition by 
select *, avg(amount) over(partition by customer_name) as avg_amount,avg(amount) over() from sales;


-- the maximum amd minimum amount for each customer.
select *,max(amount) over(partition by customer_name) as max_maount ,min(amount) over(partition by customer_name) as min_amount from sales;
-- get all the columns and get total amount and avg.  amount for each month.
select *,sum(amount) over(partition by month(sale_date)),avg(amount) over(partition by customer_name) from sales; 


-- i have a find out what is the total amount of alice in each month. 
select *,sum(amount) over(partition by customer_name, month(sale_date)) from sales;

-- Q get all column and also get the avg.amount for each user. only if the user amount is greater than its avg.amount



-- 5/2/2026
select *,row_number() over(partition by customer_name) from sales;
select *,rank() over(order by amount) from sales;
select *,rank() over(order by amount),dense_rank() over(order by amount) from sales;

-- Q second highest amount 
select* from (select *,dense_rank() over(order by amount) as ranking from sales) as temp where ranking=3; -- min
select* from (select *,dense_rank() over(order by amount desc) as ranking from sales) as temp where ranking=3; -- max

select *, lag(amount,2) over() from sales;
select *, lag(amount,2,0) over() from sales; -- null=0

-- only customer ke hissab se chahiye to
select *, lag(amount,1) over(partition by customer_name) from sales;

    -- 1 hi din ke diff . wala data chahiye to
select *, lag(sale_date,1) over(),sale_date-lag(sale_date,1) over() from sales ;
select * from (select *, lag(sale_date,1) over(),datediff(sale_date,lag(sale_date,1) over()) as onday from sales) as temp where onday=1;




-- row between:- the rows b/w  clause in sql is used within a window function to difine a  window frame and use to perfome  the calculation like moving avg. running sum. 

select *,sum(amount) over(order by amount) from sales;
select *,sum(amount) over(order by amount rows between unbounded preceding and current row) as sum from sales;
select *,sum(amount) over(partition by customer_name order by amount rows between unbounded preceding and current row) as sum from sales;

-- moving avg
select *,avg(amount) over(order by amount rows between unbounded preceding and current row) as sum from sales;

select *,avg(amount) over(partition by customer_name order by amount rows between unbounded preceding and current row) as moving_avg from sales;


-- 2 two row ka avg 
select *,avg(amount) over(order by amount rows between 2 preceding and current row) as sum from sales;



--  we can create a window nearby the current row
select *,sum(amount) over(order by amount rows between 1 preceding and 1 following) as sum from sales;

select *,sum(amount) over(partition by customer_name order by sale_date rows between unbounded preceding and 1 preceding) as sum from sales;


-- 6/3/2025
use windowdb;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    category VARCHAR(50),
    order_date DATE,
    amount DECIMAL(10,2),
    city VARCHAR(50)
);


INSERT INTO orders VALUES
(1,101,201,'Electronics','2024-01-01',500,'Delhi'),
(2,102,202,'Clothing','2024-01-02',200,'Mumbai'),
(3,103,203,'Electronics','2024-01-03',800,'Delhi'),
(4,101,204,'Furniture','2024-01-05',1200,'Delhi'),
(5,104,205,'Electronics','2024-01-07',600,'Bangalore'),
(6,105,206,'Clothing','2024-01-09',150,'Mumbai'),
(7,102,207,'Electronics','2024-01-11',900,'Mumbai'),
(8,106,208,'Furniture','2024-01-12',700,'Delhi'),
(9,107,209,'Clothing','2024-01-13',300,'Chennai'),
(10,108,210,'Electronics','2024-01-14',400,'Delhi'),
(11,103,211,'Furniture','2024-01-16',1000,'Delhi'),
(12,104,212,'Electronics','2024-01-17',750,'Bangalore'),
(13,105,213,'Clothing','2024-01-18',180,'Mumbai'),
(14,106,214,'Electronics','2024-01-20',650,'Delhi'),
(15,101,215,'Furniture','2024-01-21',1400,'Delhi'),
(16,102,216,'Electronics','2024-01-22',500,'Mumbai'),
(17,103,217,'Clothing','2024-01-23',220,'Delhi'),
(18,104,218,'Electronics','2024-01-24',950,'Bangalore'),
(19,105,219,'Furniture','2024-01-25',1100,'Mumbai'),
(20,106,220,'Clothing','2024-01-26',260,'Delhi'),
(21,107,221,'Electronics','2024-01-27',700,'Chennai'),
(22,108,222,'Furniture','2024-01-28',1300,'Delhi'),
(23,101,223,'Electronics','2024-01-29',850,'Delhi'),
(24,102,224,'Clothing','2024-01-30',210,'Mumbai'),
(25,103,225,'Electronics','2024-02-01',920,'Delhi'),
(26,104,226,'Furniture','2024-02-02',1150,'Bangalore'),
(27,105,227,'Clothing','2024-02-03',190,'Mumbai'),
(28,106,228,'Electronics','2024-02-04',620,'Delhi'),
(29,107,229,'Furniture','2024-02-05',980,'Chennai'),
(30,108,230,'Electronics','2024-02-06',540,'Delhi');

select * from orders;

-- Q; find top 2 higher order in each category;
select category,order_id,amount from 
(select *,dense_rank() over(partition by category order by amount desc) as ranking from orders ) as temp where ranking<=2;

-- Q; calculate running total sales for each customer.
select order_id, customer_id,amount,running_total from
(select *,sum(amount) over(partition by customer_id order by order_id) as running_total from orders) as temp;

-- Q; show previous order amount for each customer
select order_id,customer_id,amount,lag(amount,1)  over(partition by customer_id order by order_id) as previous_amount from orders;


-- Q; average order amount per category. 
select * ,avg(amount) over(partition by category) from orders;
select distinct category,order_id,customer_id,order_date ,avg(amount) over(partition by category) as avg from orders;  -- doubt hai
select  distinct category ,avg(amount) over(partition by category) from orders;

 -- Q; percentage contribution of each order to total sale
select * ,sum(amount) over(),concat((amount/sum(amount) over() )* 100,'%') as percentage from orders;

select sum(parcentag) over() from (select * ,sum(amount) over(),((amount/sum(amount) over() )* 100) as parcentag from orders) as tmp;


-- Q; find the fisrt order for every customer
select * from
(select  *,dense_rank() over(partition by customer_id order by order_date ) as ranks from orders) as temp where ranks=1;

-- Q; top spending customer in each city
select * ,sum(amount) over(partition by city),concat((amount/sum(amount) over() )* 100,'%')  as percentage from orders;


select *,row_number() over(partition by city), sum(amount) over(partition by customer_id) as total_spent from orders;

select city,customer_id,total_spent from
(select *,row_number() over(partition by customer_id ) as top, sum(amount) over(partition by customer_id) as total_spent from orders) as temp
where top=1 order by total_spent desc;

 -- saransh soni
select distinct customer_id , city , sm from (
select * , dense_rank() over (partition by city order by sm DESC) rn from
 ( select * , sum(amount) over(partition by city , customer_id) as sm from orders) t
) d  where rn=1;
