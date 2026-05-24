-- select * from hr.employees;

DECLARE
  var varchar(20);
begin
    dbms_output.put_line('first linr');
    select first_name into var from hr.employees where employee_id=118;
    dbms_output.put_line(var);
end;


-- 1 to 56 find the all prime number useing for loop
-- chack aromestrong 
-- what is record in pl sql =>Record ek data structure hota hai jo multiple fields (columns)
  -- ko ek saath store karta hai — bilkul ek row (table ki ek line) ki tarah.
-- cursor in plsql => ek tool jo multiple rows ko ek-ek karke read karta hai.



DECLARE
  name hr.employees.first_name%type;
begin
    
    select first_name into name from hr.employees where employee_id=118;
    dbms_output.put_line(name);
end;


-- record banna table ka
DECLARE
  employee_rec hr.employees%rowtype;
begin
    select * into employee_rec  from hr.employees where employee_id=118;
    dbms_output.put_line(employee_rec.first_name);
    dbms_output.put_line(employee_rec.salary);
end;



DECLARE
  TYPE employee_rec is record(first_name hr.employees.first_name%type, last_name hr.employees.last_name%type );
   tusar employee_rec;  -- record ka alias
begin
    select FIRST_NAME,LAST_NAME into tusar  from hr.employees where employee_id=118;
    dbms_output.put_line(tusar.first_name);
    dbms_output.put_line(tusar.last_name);
end;