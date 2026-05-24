-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                       join
-- (inner/left/right/cross/netural)
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

create database testdb;
 use testdb;
 
 CREATE TABLE customers (
    customerid INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    orderid INT PRIMARY KEY,
    productid INT,
    pname VARCHAR(50),
    price DECIMAL(10,2),
    customerid INT
);

INSERT INTO customers (customerid, name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'London'),
(3, 'Charlie', 'Mumbai'),
(4, 'Diana', 'Sydney'),
(5, 'Ethan', 'Toronto');

INSERT INTO orders (orderid, productid, pname, price, customerid) VALUES
(101, 201, 'Laptop', 800.00, 1),
(102, 202, 'Mouse', 25.00, 1),
(103, 203, 'Keyboard', 45.00, 2),
(104, 204, 'Monitor', 200.00, 2),
(105, 205, 'Printer', 150.00, 3),
(106, 206, 'Tablet', 300.00, 3),
(107, 207, 'Mobile', 500.00, 4),
(108, 208, 'Headphones', 75.00, 4),
(109, 209, 'Camera', 600.00, 5),
(110, 210, 'Speaker', 120.00, 5);

 -- orderid is primery key and customerid is foreugn key
 -- sql reletionship many to one 

select * from customers;
select * from orders;

select o.orderid,o.pname,o.customerid from orders as o;
select c.customerid,c.name from customers as c;

-- join based on the common column
select o.orderid,o.pname,o.customerid,c.name from orders as o
join customers as c
where o.customerid= c.customerid;

select o.orderid,o.pname,o.customerid,o.productid,o.price,c.name from orders as o
join customers as c
where o.customerid= c.customerid;


use world;
show tables;
select * from country;
select * from city;

-- Q; get the city id ,city name,the country code for the city

select ci.id,ci.name,ci.countrycode from city as ci;

-- Q; get the country code ,country name, continent,population for each country

select c.code,c.name,c.continent,c.population from country as c;

-- Q; get tha city id ,city name and country name for each city present in my table

select ci.id,ci.name,ci.countrycode,c.name,c.continent,c.population from city as ci
join country as c
where ci.countrycode=c.code;    -- alis use nhi karta hu error hoga bcoz name column dono me hai so alis dena jaruri hai

-- country brazil ki city chahiye
select ci.id,ci.name,ci.countrycode,c.name,c.continent,c.population from city as ci
join country as c
where ci.countrycode=c.code and c.name='Brazil';

select ci.id,ci.name,ci.countrycode,c.name,c.continent,c.population from city as ci
join country as c
where ci.countrycode=c.code and c.name in ('Brazil','Austria','india');


-- Q; you need find out country name and all the language spoken in the country;
show tables;
select * from countrylanguage;
select * from country;
select c.code,c.name,cl.language from country as c
join countrylanguage as cl
where c.code= cl.countrycode and cl.language='english';

-- join ka type batane par "inner" ke sath "on" karte ha where ki jagh.  but dono me diffrent kuch bhi nhi ha
select c.code,c.name,cl.language from country as c
inner join countrylanguage as cl
on c.code= cl.countrycode and cl.language='english';


select c.code,c.name,cl.language from country as c
inner join countrylanguage as cl
on c.code= cl.countrycode where cl.language='english';    -- doubt 


-- 12/2/2026
create database rmd;
use rmd;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2)
);


INSERT INTO customers VALUES
(1, 'John', 'New York'),
(2, 'Alice', 'Los Angeles'),
(3, 'Bob', 'Chicago'),
(4, 'Emma', 'Houston'),
(5, 'Michael', 'Phoenix'),
(6, 'Sophia', 'Dallas'),
(7, 'David', 'Seattle'),
(8, 'Olivia', 'Boston'),
(9, 'James', 'Denver'),
(10, 'Isabella', 'Miami');


INSERT INTO orders VALUES
(101, 1, 250.00),
(102, 2, 300.00),
(103, 1, 150.00),
(104, 3, 400.00),
(105, 5, 500.00),
(106, 7, 700.00),
(107, 7, 200.00),
(108, 9, 350.00),
(109, 11, 600.00),  -- No matching customer
(110, 12, 800.00);  -- No matching customer




CREATE TABLE employees (
    eid INT PRIMARY KEY,
    ename VARCHAR(100),
    salary DECIMAL(10,2),
    manager_id INT
);



INSERT INTO employees VALUES
(1, 'John', 90000, NULL),   -- Top-level manager (CEO)
(2, 'Alice', 75000, 1),
(3, 'Bob', 70000, 1),
(4, 'Emma', 65000, 2),
(5, 'Michael', 60000, 2),
(6, 'Sophia', 62000, 2),
(7, 'David', 58000, 3),
(8, 'Olivia', 55000, 3),
(9, 'James', 50000, 4),
(10, 'Isabella', 52000, 4);


select * from employees;

select * from customers;
select * from orders;
show databases;
use rmd;

select cu.customer_id,cu.name,cu.city,ord.order_id,ord.order_amount from customers as cu
inner join orders as ord   # inner join= common data
on cu.customer_id=ord.customer_id;

--  all customer ka data chahiye 
select cu.customer_id,cu.name,cu.city,ord.order_id,ord.order_amount from customers as cu
left join orders as ord   # left join= left side all data with inner join ka data
on cu.customer_id=ord.customer_id;
-- orders table ka all chahiye
select cu.customer_id,cu.name,cu.city,ord.order_id,ord.order_amount from customers as cu
right join orders as ord   # right join= right side all+inner join
on cu.customer_id=ord.customer_id;


-- Q provide me the data of those customers who have never placed an order
select cu.customer_id,cu.name,cu.city,ord.order_id,ord.order_amount from customers as cu
left join orders as ord  
on cu.customer_id=ord.customer_id where ord.order_id is null;


--  i need to find out the total amount spent for the order placed by the customer. 
select sum(ord.order_amount) from customers as cu
inner join orders as ord   
on cu.customer_id=ord.customer_id;

-- Q. gte me the total number of orders that are not placed by the customers. 
select count(ord.order_id) from  customers as cu
right join orders as ord
on cu.customer_id=ord.customer_id where cu.customer_id is null;

-- Q. get me the total amount spent and avg amount spent for the orders placed by customer Id three and more than
select * from orders;
select sum(ord.order_amount),avg(ord.order_amount) from customers as cu
inner join orders as ord
on ord.customer_id=cu.customer_id where cu.customer_id>=3;    -- nhi chal rhi h 


-- self join 
select * from employees;
-- employee ke samne manager name likho
select emp.eid,emp.ename,emp.salary,emp.manager_id, mang.ename from employees as emp
 join employees as mang
on emp.manager_id=mang.eid;

select * from customers;
select * from orders;

-- cross join /cartesian join  table1 row 3,table 2 row 5= 15 row
select * from customers cross join orders;
 
 -- natural join (common column = as inner join, common column != cross join)
select * from customers
natural join orders; 

select * from world.city;
select * from world.country;

select c.name,c.population,cty.name,cty.population from world.city as c
join world.country as cty
where c.name=cty.name and c.Population=cty.Population;


select * from world.city natural join world.country;


-- ------------------------------------------
-- 18/2/2026 join + group by
use world;
select * from city;
select * from country;

select c.name, cty.district,sum(cty.population) from city as cty
inner join country as c
where cty.countrycode=c.code
 group by c.name,cty.district;
-- 8mint;


-- get the country code ,name district and the region of each disrict. 
select cty.countrycode,c.name, cty.district,c.region from city as cty
inner join country as c
where cty.countrycode=c.code;

-- find out every district name,total popu;ation
select district ,sum(population) from city group by district;

-- find out every district name,total popu;ation, country code
select* from city;
select countrycode,district,sum(population) from city group by countrycode,district;

-- find out every district name,total popu;ation, country code,county name
select cty.countrycode,c.name,cty.district,sum(cty.population) as dist_P ,sum(c.population)  as countryP from city as cty
inner join country as c
on cty.countrycode=c.code group by cty.countrycode,c.name,cty.district;

-- find out district name,country name,region, total population (district,country)
select * from country; 
select c.name,cty.district,c.region, sum(cty.population),sum(c.population) from city as cty
inner join country as c
on cty.countrycode=c.code group by c.region,c.name,cty.district;

select * from countrylanguage;
select * from country;

-- find out language name,total population each language spokan. 
select cl.language, sum(c.population) from countrylanguage as cl
inner join country as c
on cl.countrycode=c.code  group by cl.language;

-- find total population each language spoken for official and unofficial .
select language,cl.isofficial,sum(c.population) from countrylanguage as cl
inner join country as c
on cl.countrycode=c.code  group by cl.language,cl.isofficial;


use sakila;
select * from film_actor;
select * from actor;
select * from film;




-- you have to find the actor name and the total number of movies the actor has worked
select ac.first_name,count(af.film_id) as total_film from actor as ac
inner join film_actor as af
on ac.actor_id= af.actor_id group by af.actor_id,ac.first_name;

-- get the name of the actor and the rating of flim alonge with avg langth of the movie done by each actor? 
select ac.first_name,ff.rating, avg(ff.length) from actor as ac
join film_actor as fa
on ac.actor_Id=fa.actor_id
join film as ff
on fa.film_id=ff.film_id group by ac.first_name,ff.rating ;

select ac.first_name,ff.rating, avg(ff.length) as avg_length from actor as ac
join film_actor as fa
join film as ff
on ac.actor_Id=fa.actor_id and fa.film_id=ff.film_id
group by ac.first_name,ff.rating ;
