DECLARE
 var int :=10;
begin

  dbms_output.PUT_LINE('hii krishan' || '' || var);

  var:=20;
  dbms_output.put_line('hii tusar' || ' '|| var);

  if(var>15) then
    dbms_output.put_line('hii tusar regex' || ' '|| var);
  elsif(var>25) then 
     dbms_output.put_line('hii tusar regex jaipur' || ' '|| var);
  end if;


end;

-- q1; declear variable and get the sum all the number?
declare
     n int:=10;
     sum int:=0;
BEGIN
    for i in 1..n loop
      sum:= sum+i; 
    end loop;
    dbms_output.put_line(sum);

end;


declare
    n int:=10;
    sum int:=0;
begin
    sum:=n*(n+1)/2;
    dbms_output.put_line(sum);
end;
-- Q2. take variable and find the sum of all the add numbers?
declare
     n int :=20;
     sum int:=0;
BEGIN
    for i in 1..n loop
        if mod(i,2)<>0 then
             sum:=sum+i;
        end if;
    end loop;
    dbms_output.put_line(sum);
end;
-- q3. using while loop find weather a string cantins the latter 'L'. 
declare
    var varchar(50):='Bal krishan';
    i int := 1;
    yes int:=1;
begin 
    while i<= length(var) loop
      if substr(var,i,1)='l' then
        yes:=0;
        exit; -- barck ki jagh
      end if;
      i :=i+1;
    end loop;
    if yes=0 then
     dbms_output.put_line('L present');
    else
     dbms_output.put_line('l not present');
    end if;
end;
-- Q4. take a variable name=a and print its table using while loop. 
declare
   a int:=3;
   i int:=1;

begin 
    while i<=10 LOOP
        dbms_output.put_line(a || ' x ' || i || ' = ' || a*i);
        i:=i+1;
    end loop;
end;