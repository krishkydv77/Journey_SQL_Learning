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
 
 