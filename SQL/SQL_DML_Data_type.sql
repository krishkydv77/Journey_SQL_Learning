-- +++++++++++++++++++++++++++++++++++++
-- DML+data type
-- ++++++++++++++++++++++++++++++


use windowdb;
show tables;
-- create statement
create table test(Sno int);

-- insert statement (DML)
insert into test values(1000); -- only 1 values
insert into test values(89),(90); -- 2 row insert


-- data type
--  tinyint(1byte)   2^8=256(-128 to 127)
create table test1(Sno tinyint);
insert into test1 values(128); -- error
insert into test1 values(true);


create table test2(Sno tinyint unsigned);   -- 0 to 255
insert into test2 values(255); -- allow me



-- small int => 2 byte 2^16=32768
-- mediumint => 3 byte
-- int => 4 byte
-- big int => 8 byte  2^64

-- float -- 4 byte(decimal ke 4 digit)
-- double == decimal ke kitni bhi sabhi

-- M,D ==M total digit ,D= decimal digit
      -- double(5,2)
-- char =string (ye only string count karta space nhi but memory occuped rhti hai)
-- varchar= string 


-- what is diffirence of char vs varchar?
-- Simple rule (exam / interview)
-- CHAR → fixed size data
-- Example: PIN code, gender, country code
-- VARCHAR → variable size text
-- Example: name, address, email

-- Short definition (exam ready)
-- CHAR: Fixed-length character data type.
-- VARCHAR: Variable-length character data type


-- constraint rule



describe test;   -- will tell the structure /column name and datatypes
select * from test1;   -- access all the column of test table

-- 9/3/2026

-- date datatpye
-- 9/March/2026
-- ddl , datatypes

use windowdb;
show tables;
create table test_date( dob date);
insert into test_date values('2026-08-22'); -- yyyy-mm-dd otherwise give an error

select * from test_date;

-- save an image in sql database
-- which data type, how it will be stored
-- make foreign key (should have reffered table whith primary key)
   
   
   
-- constraints:- are set of  rules to apply on the table column to avoid invalid data entry
-- not null
create table test10(salary int , age int not null );
insert into test10 values(1000,18), (2000,30), (null,50000);
select * from test10;

-- default
create table test101(salary int default 2000, age int not null default 21);
insert into test101(salary) values(50000);
insert into test101(age) values(50);
select * from test101;

-- unique:- it can have multiple null value but not use default for another time
create table test1001(salary int unique default 2000, age int);
insert into test1001 values(null,23);
insert into test1001 values(30000,50);
insert into test1001 values(30500,null);

select * from test1001;

-- check
drop table test20;
create table test20(salary int, age int 
                      constraint windowd_test20_age_21 check (age>21));
insert into test20 values(40000,13);
select * from test20;


-- primary key: can't be dublicate and null
drop table test201;
create table test201(a int primary key, b int); 
insert into test201 values(1,100);
insert into test201 values(2,500);

select * from test201;

drop table test202;
create table test202(a int, b int,
                     primary key(a,b)); -- single values can be same in this but pair cannot be same
insert into test202 values(1,100);
insert into test202 values(1,10);
insert into test202 values(3,100);
insert into test202 values(2,100);

select * from test202;


-- 14/March/2026


-- constraint
-- foreign key:- constraints which is used to make the relationship
-- 1 table can have multiple foreign key
-- foreign key refers to primary key of another table
-- Data integrity => Data integrity ensures that data remains accurate, consistent, and reliable throughout its entire lifecycle.
use testdb;
drop table cust;
drop table ord;
create table cust( id int unique key, name varchar(20));
insert into cust values(1, 'Tiger'), (2,'Yash');

delete from cust where id=2; -- step 2

select * from cust;

create table ord( id int, cid int, price int,
foreign key (cid) references cust(id) on delete cascade) ;

insert into ord values(100, 1, 2000), (101, 2 , 3999);
insert into ord values(100, 6, 5000) ;-- error

delete from ord where cid=2;  -- step 1

select * from ord;


drop table order1;
create table cu( id int unique key, name varchar(20));
insert into cu values(1, 'Lion'), (2,'Yashika');
select * from cu;

create table order1( id int, cid int, price int,
foreign key (cid) references cu(id) on delete set null); -- on delete cascade:- use to delete id and cid in both tables at once
 -- on delete set null:- helps to delete a single row from cu table while in order1 will show null at position on that foreign key
insert into order1 values(100, 1, 3000), (101, 2 , 4999);

delete from cu where id=2;
select * from order1;


-- data manupulation : create, insert, delete, update
drop table cust2;
create table cust2( id int primary key, name varchar(20));
insert into cust2 values(1, 'Tiger'), (2,'Yash');
insert into cust2 values(3, 'naina');
select * from cust2;
delete from cust2 where id=1;


create table cust3( id int, name varchar(20));
insert into cust3 values(1, 'Tiger'), (2,'Yash'), (3, 'Tiger');

select * from cust3;

select c1.id, c1.name, c2.id, c2.name from cust3 as c1 
join cust3 as c2 where c1.name=c2.name and c1.id < c2.id;

delete c2 from cust3 as c1 inner join cust3 as c2 
on c1.name=c2.name where c1.id < c2.id;
select * from cust3;

update cust3 set name= 'Heena', id=100 where name = 'yash';
select * from cust3;

