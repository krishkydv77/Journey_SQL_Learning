-- explicit cursor
declare
    cursor sql_c is   select salary from hr.EMPLOYEES;
    v_salary int;
begin
    -- to start the cursor we need to open it
    open sql_c;
    fetch sql_c into v_salary; -- detching the first row using the cursor and stroing it to variable
    dbms_output.put_line(v_salary);
    close sql_c;

end;




declare
    cursor sql_c is   select salary from hr.EMPLOYEES;
    v_salary int;
begin
    -- to start the cursor we need to open it
    open sql_c;
    fetch sql_c into v_salary; -- detching the first row using the cursor and stroing it to variable
    while(sql_c%found) loop  -- at first time it found any row
        dbms_output.put_line(v_salary); -- print the first row then second third
        fetch sql_c into v_salary;          -- fetch the next row and store it to the variable
    end loop;
    close sql_c;

end; 










-- multicolumn
declare
    cursor sql_c is   select * from hr.EMPLOYEES;
    detail_rec hr.employees%rowtype;
begin
    -- to start the cursor we need to open it
    open sql_c;
    fetch sql_c into detail_rec; -- detching the first row using the cursor and stroing it to variable
    while(sql_c%found) loop  -- at first time it found any row
        dbms_output.put_line(detail_rec.first_name || ' ' || detail_rec.salary); -- print the first row then second third
        fetch sql_c into detail_rec;          -- fetch the next row and store it to the variable
    end loop;
    close sql_c;

end;


-- procedure


/*
create [or replece] procedure 

(in|out|inout)
is|as 
begin 
    ligic

end;
*/


create or REPLACE PROCEDURE test_p
is
begin 

    dbms_output.put_line('hey procedure');

end;

-- --------call method  procedure------------

exec test_p;

 -- 2th method
BEGIN
    test_p;

end;