-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- -- SQL(Basic/function/string/maths/aggregate/groupby+having)
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
show databases;
create database rohanregx;
use sakila;
show tables;
use rohanregx;
show tables;
create table students(s_id int,name char(10));
-- to use database
use sakila; 
show tables;

-- explain table structure
describe actor;
-- select column   from  table_name
select * from actor;
select actor_id, last_name from actor;
select last_name, actor_id*10,first_name from actor;

-- select ka koi impect original par nhi padega
select * from actor;

-- select only column par kam karta ha row ke liye where use karege

-- select * from table where condition
select * from actor where actor_id=3;
select * from actor where actor_id>3;
select * from actor where actor_id!=3;
select * from actor where actor_id<>5;
-- use srting only ' ' ,not " "

select * from actor where last_name="chase";
select * from actor where first_name='nick';
select * from actor where first_name>'a';

-- Opreator
-- Logical opreator 
select * from actor where actor_id>3 and actor_id<7;
select * from actor where actor_id=3 or actor_id=7;
select * from actor where actor_id>3 and actor_id=7;
select * from actor where actor_id>3 or actor_id=5;
select * from actor where actor_id=2 or actor_id>3 and actor_id=1;
--  first and condition apply hogi
select * from actor where actor_id>2 and actor_id>4 or actor_id=7;



-- function:-
-- block of code => code reusable
-- pre defined and user user defined
-- pre defined => scaler function
-- scaler => applied for each row and result will be given for each row
-- string(character),number,date related function
-- string related function (today at 3rd feb)

use sakila;
select first_name, lower(first_name),last_name,upper(last_name) from actor;

-- concat "hey" + "hello" concat("hey","hello")
-- var="regex"            var+"software"
select first_name,last_name, concat("Mr", first_name,last_name) from actor;
select first_name,last_name, concat("Mr.",'-', first_name,' ',last_name,' ','Regex student') from actor;


-- extract me all the data frist_name+ last_name='EDCHASE"
select * from actor;
-- combine where concat(cal1+col2)='EDCHASSE'
select * from actor where concat(first_name,last_name)='EDCHASE';
select * , concat(first_name,last_name) from actor where concat(first_name,last_name) like '%A';

-- concat_ws (erey word ke baa - de dega)
select first_name,last_name, concat('Mr.',first_name,last_name),concat_ws('-','Mr.',first_name,last_name) from actor;
select first_name,last_name, concat('Mr.',first_name,last_name),concat_ws('-','Mr.',first_name) from actor;

-- subsrting /substr=> extract kuch partion ko(extract data basic of position)
select first_name,last_name, substr(last_name,2) from actor; 
-- -2 means last ke 2 char.
select first_name,last_name, substr(last_name,-2) from actor;
-- 1 se start or start ke 4 char chahiye
select first_name,last_name, substr(last_name,2,4) from actor;
-- last 2nd char // last 3rd se start and 2 char
select first_name,last_name, substr(last_name,-2,1) from actor;
select first_name,last_name, substr(last_name,-3,2) from actor;


-- A start and e se end ho
select * from actor where first_name like 'A%' and first_name like '%E';
select * from actor where first_name like 'A%' or first_name like 'E%';
select * from actor where first_name like 'A%' or first_name like 'E%';



-- replace function
select first_name ,replace(first_name,'A',' ') from actor;

use sakila;

select first_name from actor;

-- trim (select value) => only for testing purposr // left and right space remove
select char_length('krishan  ');
select ('   krishan   ');
select char_length('   krishan   ');
select char_length(trim('   krishan   '));

select char_length(trim('krishan  '));


-- aaaaanaman => naman   extra a ko trime se hata sakte hai 
select trim(both 'a' from 'aaaaanaman');

-- only last char remove
select first_name, trim(both 'E' from first_name) from actor;


-- lpad/rpad/(left padding/right padding)
select lpad('1234',6,'@');

-- concat,substr,trim,char_length,lpad 



-- Number function => round = complit round value
select 14.678, round(14.678);
-- decimal round karna ha to 
select 14.678, round(14.678), round(14.678,1);
select 14.678, round(14.678), round(14.647,2);
select 14.678, round(14.678), round(14.6666,3);

select 14.678, round(1419.678,-1);
select 14.678, round(14.678), round(14.500,1);

-- truncate decimal ke baad kitne digit lene hai
select 14.678, round(14.678), truncate(14.678,2);

-- floor5.777=5 and  ceil 6,7777=7

-- date function
select curdate(),current_time(), current_timestamp(), now();
select now(),adddate(now(),2); -- currant time 

select payment_date, adddate(payment_date,2) from payment; -- already date uspe apply karega

select now(),adddate(now(),interval 2 year);
select now(),adddate(now(),interval -5 year);
select now(),adddate(now(),interval 2 year);
select now(),adddate(now(),interval 2 year);
select now(),adddate(now(),interval 2 quarter);
select now(),adddate(now(),interval 2 week);

-- subdate kam karta hai 
select now(), subdate(now(),2);

select now(), month(now()),year(now());

-- extract function
select now(), extract( month from now());
select now(), extract( year from now());

--
select payment_date, month(payment_date), date_format(payment_date,' currant month %b') from payment;

select * from payment;
select *, month(payment_date) from payment where month(payment_date)=5;
select * from payment where year(payment_date)=2006;





-- milti row finction aggregate function => which will be used for calculation

select * from payment;
select distinct(customer_id), amount from payment;
select distinct customer_id, amount from payment;
-- combination of amount and staff_id should be unique
select distinct amount, staff_id,customer_id from payment;

-- distinct se pahle aap dairectly koi column use nhi kar sakte
select customer_id, amount from payment;
-- combination of distinct => comnination of 2 column did not any mistak.




-- aggregate function=> sum()
-- kisi bhi aggregate function ke sath koi dairectly column  select nhi kar sakte
select * from payment;
select sum(amount), count(amount),max(amount), avg(amount) from payment;

select count(amount),count(payment_id) from payment;
select * from payment where month(payment_date)=5 or month(payment_date)=5;
select count(*) from payment where month(payment_date) in(5,6);


-- i need to find the total amount and the number of transctions done  for the amount greater then 5$ and after march month.
select sum(amount), count(amount) from payment where amount> 5 and month(payment_date)>3;


-- find total customer and total number of unique customer ,month last day of month where the amount is greater then 0.5$

select count(customer_id),count(distinct customer_id) from payment where date(payment_date)=last_Day(payment_date) and amount>0.5;



-- function:-
-- block of code => code reusable
-- pre defined and user user defined
-- pre defined => scaler function
-- scaler => applied for each row and result will be given for each row
-- string(character),number,date related function
-- string related function (today at 3rd feb)

use sakila;
select first_name, lower(first_name),last_name,upper(last_name) from actor;

-- concat "hey" + "hello" concat("hey","hello")
-- var="regex"            var+"software"
select first_name,last_name, concat("Mr", first_name,last_name) from actor;
select first_name,last_name, concat("Mr.",'-', first_name,' ',last_name,' ','Regex student') from actor;


-- extract me all the data frist_name+ last_name='EDCHASE"
select * from actor;
-- combine where concat(cal1+col2)='EDCHASSE'
select * from actor where concat(first_name,last_name)='EDCHASE';
select * , concat(first_name,last_name) from actor where concat(first_name,last_name) like '%A';

-- concat_ws (erey word ke baa - de dega)
select first_name,last_name, concat('Mr.',first_name,last_name),concat_ws('-','Mr.',first_name,last_name) from actor;
select first_name,last_name, concat('Mr.',first_name,last_name),concat_ws('-','Mr.',first_name) from actor;

-- subsrting /substr=> extract kuch partion ko(extract data basic of position)
select first_name,last_name, substr(last_name,2) from actor; 
-- -2 means last ke 2 char.
select first_name,last_name, substr(last_name,-2) from actor;
-- 1 se start or start ke 4 char chahiye
select first_name,last_name, substr(last_name,2,4) from actor;
-- last 2nd char // last 3rd se start and 2 char
select first_name,last_name, substr(last_name,-2,1) from actor;
select first_name,last_name, substr(last_name,-3,2) from actor;


-- A start and e se end ho
select * from actor where first_name like 'A%' and first_name like '%E';
select * from actor where first_name like 'A%' or first_name like 'E%';
select * from actor where first_name like 'A%' or first_name like 'E%';



-- replace function
select first_name ,replace(first_name,'A',' ') from actor;

use sakila;

select first_name from actor;

-- trim (select value) => only for testing purposr // left and right space remove
select char_length('krishan  ');
select ('   krishan   ');
select char_length('   krishan   ');
select char_length(trim('   krishan   '));

select char_length(trim('krishan  '));


-- aaaaanaman => naman   extra a ko trime se hata sakte hai 
select trim(both 'a' from 'aaaaanaman');

-- only last char remove
select first_name, trim(both 'E' from first_name) from actor;


-- lpad/rpad/(left padding/right padding)
select lpad('1234',6,'@');

-- concat,substr,trim,char_length,lpad 



-- Number function => round = complit round value
select 14.678, round(14.678);
-- decimal round karna ha to 
select 14.678, round(14.678), round(14.678,1);
select 14.678, round(14.678), round(14.647,2);
select 14.678, round(14.678), round(14.6666,3);

select 14.678, round(1419.678,-1);
select 14.678, round(14.678), round(14.500,1);

-- truncate decimal ke baad kitne digit lene hai
select 14.678, round(14.678), truncate(14.678,2);

-- floor5.777=5 and  ceil 6,7777=7

-- date function
use sakila;
select curdate(),current_time(), current_timestamp(), now();
select now(),adddate(now(),-2); -- currant time 

select payment_date, adddate(payment_date,2) from payment; -- already date uspe apply karega

select now(),adddate(now(),interval 2 year);
select now(),adddate(now(),interval -5 year);
select now(),adddate(now(),interval 2 year);
select now(),adddate(now(),interval 2 year);
select now(),adddate(now(),interval 2 quarter);
select now(),adddate(now(),interval 2 week);

-- subdate kam karta hai 
select now(), subdate(now(),2);

select now(), month(now()),year(now());

-- extract function
select now(), extract( month from now());
select now(), extract( year from now());

--
select payment_date, month(payment_date), date_format(payment_date,' currant month %b') from payment;

select * from payment;
select *, month(payment_date) from payment where month(payment_date)=5;
select * from payment where year(payment_date)=2006;





-- milti row finction aggregate function => which will be used for calculation

select * from payment;
select distinct(customer_id), amount from payment;
select distinct customer_id, amount from payment;
-- combination of amount and staff_id should be unique
select distinct amount, staff_id,customer_id from payment;

-- distinct se pahle aap dairectly koi column use nhi kar sakte
select customer_id, amount from payment;
-- combination of distinct => comnination of 2 column did not any mistak.




-- aggregate function=> sum()
-- kisi bhi aggregate function ke sath koi dairectly column  select nhi kar sakte
select * from payment;
select sum(amount), count(amount),max(amount), avg(amount) from payment;

select count(amount),count(payment_id) from payment;
select * from payment where month(payment_date)=5 or month(payment_date)=5;
select count(*) from payment where month(payment_date) in(5,6);


-- i need to find the total amount and the number of transctions done  for the amount greater then 5$ and after march month.
select sum(amount), count(amount) from payment where amount> 5 and month(payment_date)>3;


-- find total customer and total number of unique customer ,month last day of month where the amount is greater then 0.5$

select count(customer_id),count(distinct customer_id) from payment where date(payment_date)=last_Day(payment_date) and amount>0.5;



-- group by
use sakila;
select * from payment;
select customer_id from payment group by customer_id;
select staff_id from payment group by staff_id;

select customer_id,sum(amount) from payment group by customer_id;
select staff_id, sum(amount) from payment group by staff_id; -- pahle wo select karo jis par grop by laga rhe ho
select customer_id ,sum(amount),count(customer_id) from payment group by customer_id;
select staff_id,sum(amount),count(staff_id) from payment group by staff_id;

-- Q;- how many time each amount value is visible?
 select amount, count(amount) from payment group by amount;
 -- Q; try to get toatl amount ,the maximum amount value and the total transaction done by each customer?
 select customer_id,sum(amount),max(amount) from payment group by customer_id;
 -- Q;- total amount,maximun amount,taotal number of customer served by staff? payment_id>9;
 select staff_id, sum(amount), max(amount), count(customer_id) from payment where payment_id>9 group by staff_id;
 -- Q;- you have find the total amount spent ,the average amount spent and the total transction done each month.
 select monthname(payment_date), sum(amount),avg(amount), count(payment_id) from payment group by monthname(payment_date);
 -- Q;- get me total,avg,mix amount done for first week of each month may,june,july?
 select monthname(payment_date), sum(amount),avg(amount),max(amount) from payment where monthname(payment_date) in ('may','june','july') and day(payment_date)<=14 group by monthname(payment_date); -- 2 week ke liye
 select month(payment_date), sum(amount),avg(amount),max(amount) from payment where month(payment_date) in (5,6,7) and day(payment_date) between 1 and 7 group by month(payment_date);
 
 
 
 -- new database => world
 
 use world;
 show databases;
 show tables;
 desc country;
 select * from country;
 select sum(population) from country; 
 select sum(population) from country where continent='Asia';
 select continent, sum(population) from country group by continent;
select region, sum(population) from country group by region;
select continent,region, sum(population) from country group by continent,region;
-- count country
select continent, count(Name) from country group by continent;
select continent, count(Name) from country where continent='Asia';
select indepyear,continent, count(name) from country group by continent,indepyear;
-- after 1950 independent country
select count(name) from country where indepyear>1950;

-- ase continent jisme min 30 country ho. 
select continent, count(name) as TotalCountry from country  group by continent having TotalCountry>30 ;

-- Q; you need yo find the country name and need to find the continent name and avg population only for those continent for where the avg population is greater than 1/2 million. 
select continent,name, avg(population) from country group by continent,name having avg(population)>500000;


-- Q; get me avg population total number country ofcountry for each govt. form only for the countries got the independence after 1890 and have at least 4 countries. 
select * from country;
select avg(population),count(name) ,governmentForm from country where indepyear>1890 group by governmentForm having count(name)>=4;