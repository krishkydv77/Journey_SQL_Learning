--  inplicit cursor:-
create table emp_test as 
select employee_id,first_name,last_name 
from hr.employees where employee_id between 101 and 104;

select * from emp_test;

begin 
    update emp_test set last_name='yadav';
    DBMS_OUTPUT.put_line(SQL%rowcount);
end;


begin 
    update emp_test set last_name='tusar' where employee_id=101;
    DBMS_OUTPUT.put_line(SQL%rowcount);
end;



-- explicit cursor:-

DECLARE
     cursor data_cursor is SELECT first_name from emp_test;
     v_name varchar(30);
begin 
    dbms_output.put_line('starting with cursor');
    open data_cursor;  -- open the cursor
    FETCH data_cursor into v_name;
       if(data_cursor%isopen) THEN      --%found =not true bcoz data nhi ha abhi
          dbms_output.put_line('cursor found');
        end if;
        if(data_cursor%found) THEN    -- cursor me data hoga tabi print hogas
            dbms_output.put_line('cursor found');
        end if;

end;