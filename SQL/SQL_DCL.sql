-- DCL=> data control language its is used to given the control or peremission on the database.
use ctedb;
create table ctedb.test100 as 
select actor_id,first_name from  sakila.actor where actor_id between 1 and 4;
select * from test100;

select current_user(); -- user ko janne ke liye/ root user


-- query to see the permission 
show grants for root@localhost;

-- to create user
create user tushar identified by '12345'; -- tushar=username, 12345= password
show grants for tushar;

-- grant syntex 
grant privilege_type [(column_list)]
on obejct_type object_name
to 'username'@'host'
[with grant option ] ;

grant select on ctedb.test100 to tushar;
grant select on ctedb.* to tushar;
grant delete,insert,update on ctedb.test100 to tushar;

grant update(actor_id) on ctedb.test100 to tushar; 
grant all privileges on ctedb.test100 to tushar; 

flush privileges;

revoke insert,update on ctedb.test100 from tushar;
revoke all privileges on ctedb.test100 from tushar;
revoke select on ctedb.* from tushar;

show grants for tushar;

grant select on ctedb.test100 to 'tushar' with grant option;

-- role=>group  
 -- create a role mysql 
 -- create to user nmysql name as namn,adarsh
 -- chack the permission 
 -- assigne the role to the user  adarsh
 -- chack the grant for adarsh then assign select privileges to the role
 -- login to adarsh varify this select permisssion
 --  chack naman user and verify 
 
 
 create role rahul;
 grant select,insert,update,delete on ctedb.test100 to rahul;
 grant  rahul to tushar;
 show grants for tushar;
 show grants for rahul;
 
 
 -- __________________________________________________27/3/2026____________________________________________
 -- topic:- viwes
 
 -- stand for - virtua; table
 -- data store nhi hota hi
 -- query ko stor karta hai
 -- view => query ko store in the database
 ----- ligic centakized 
 
 use sakila;
 select * from actor;
 select * from film_actor;
 select a.actor_id,a.first_name,a.actor_id*100 from actor as a;
 --  create view
 -- create view
 create view actor_view_3
 as select a.actor_id,a.first_name,a.actor_id*100 from actor as a;
 
 # query view => select a.actor_id,a.first_name,a.actor_id*100 from actor as a;  =>  actor table se lega 
 
 grant all privileges on sakila.* to tushar;
 
 create table actor_5 as 
 select actor_id,first_name from actor where actor_id<6;
 
 select * from actor_5 where actor_id;
 create view  actor_5_view as
 select first_name from actor_5;
 
 insert into actor_5_view values('krishan');
 select * from actor_5; -- table
 select * from actor_5_view; --- view 
 
 insert into actor_5 values(1,'tushar');
 select * from actor_5;
 select * from actor_5_view; 
 
 -- updatable view=> me agregate funcation,window,
 
 select	 * from actor;
 create table actor_data1 as 
 select actor_id,first_name,last_name from actor where actor_id >(select actor_id from actor where first_name='joe');
 
 create view actor_data1_view as 
 select * from actor_data1;
 
 select * from actor_data1_view;
 
 insert into actor_data1 values(0000,'krishan','yadav');
 select * from actor_data1_view; 
 
 
 create table t1(id int); 
 insert into t1 values(1),(2),(3),(34);
 select * from t1;
 create view v1 as select * from t1 where id<2
 with check option; 
 select * from v1;
 insert into v1 values(0);
 insert into v1 values(10),(11); --- condition failed so not insert data
