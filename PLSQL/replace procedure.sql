create or replace procedure p_name(a in int,b out int)
IS
BEGIN
    dbms_output.put_line('inside the procedure'|| ' ' || a*15);
    b:=a*15;
end;


-- inout

create or replace procedure p_name(a in out int,b out int)
IS
BEGIN
    dbms_output.put_line('inside the procedure'|| ' ' || a*15);
    a:=a*15;
end;