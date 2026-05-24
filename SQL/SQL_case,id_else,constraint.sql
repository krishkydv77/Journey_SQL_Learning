-- ++++++++++++++++++++++++++++
-- case,if-else/constraint
-- ++++++++++++++++++++++++++++

use world;
select * from country;
select count(indepyear),count(ifnull(indepyear,0)) from country;
select name,LifeExpectancy,gnp,gnpold , coalesce(LifeExpectancy,gnp,gnpold) from country;  -- coalesce() -- not null value,jis column ki value pahle aayegi whi return karega.


-- general function
--  if -else
select name, population, if(population>10000,'large p','small p') from country;

select name, population,if(population>10000,'large p',if(population>5000,'medium p','small p')) as type_p from country;

-- -- in case if the population >20000 & name start with 'a' then print verey large country otherwise if population>25000 then print small country
select name,population,if(population> 20000,'large population',if(population>25000,'small p')) as type_p from country where name like 'A%';
select name,population,if(population> 20000 and name like 'A%','large population',if(population>25000 and name like 'A%','small p')) as type_p from country;

/*
select column,
case 
    when condition then expression
    when condition then expression
    else
end from table

*/

select name,population,
case
 when population >25000 then 'V L P'
 when population >20000 then 'L P'
else 'normal P'

end as type_p from country;
select * from country;
-- select name,continent,population , if IndepYear is from 1600 to 1850 till print erliy IndepYear,if my IndepYear 1800 to 1900 print normal IndepYear.. if my indep year even print even IndepYear baki late /early indep

select name,continent,population,
case 
  when IndepYear>1600 and IndepYear<1800 then 'Early IndepYear'
  when IndepYear>1800 and IndepYear<1900 then 'Normal IndepYear'
  when IndepYear%2=0 then 'even IndepYear'
else 'late IndepYear'
end as typt_IndepYear from country;

-- -----------------------------------------------------------------------------------------
-- 17/3/2026
use world;
select * from country;
--  find the continent name total number countries and print the message large continent if the total number of country >5 ,print medium size continent if the total countries >3,print small continent

select continent, count(name), 
case 
 when count(name)>5 then 'Large continent'
 when count(name)>3 then 'medium continent'
 else 'small continent'
 end as type_cont from country group by continent;
