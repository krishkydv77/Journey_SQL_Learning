
select @@autocommit;
-- create table as select (CTAS)
use ctedb;
create table ctedb.test100 as 
select actor_id,first_name from  sakila.actor where actor_id between 1 and 4; 

update test100 set first_name='tusar' where actor_id=2;

select * from test100;

start transaction; -- premanetly chage rokne ke liye
update test100 set first_name='yash' where actor_id=1;
commit; -- premanetly change karne ke liye
rollback; -- ja tak commit nhi wha tak waps chala jayega (pending sab ke liye hoga.)

savepoint tusar_chackpoint; -- jha lage galti ho sakti ha wha chack point lagayeg
rollback to tusar_chackpoint; -- bas lagaye gye chack point tak rollback karna
release savepoint tusar_chackpoint; -- chack point ko hata diya ha ab rollback camplit hoga or commit bhi

select * from test100;


