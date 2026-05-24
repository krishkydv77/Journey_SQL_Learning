declare
    num int;
    x int:=10;

BEGIN
    p_name(x,num);
    dbms_output.put_line('value x '|| ' ' || x);

    dbms_output.put_line('value inside other logic'|| ' ' || num);
end;