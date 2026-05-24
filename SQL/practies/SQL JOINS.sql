use practies;
create table employees(emp_id int primary key,emp_name varchar(10),dept_id int);
insert into employees values(1,'Alice',10),(2,'Bob',20),(3,'Charlie',30),(4,'Diana',10),(5,'Edward',null);
select* from employees;

create table departments(dept_id int,dept_name varchar(10));
insert into departments values(10,'HR'),(20,'IT'),(40,'Finance');
select * from departments;


create table manager(emp_id int primary key ,emp_name varchar(10),manager_id int);
insert into manager values(1,'Alice',3),(2,'Bob',3),(3,'charlie',null),(4,'Diana',1),(5,'Edwar',1);
select * from manager;


-- Q1: List the names of all employees along with their department names. Show only employees who belong to department.
select e.emp_name, d.dept_name from employees as e
join departments as d
on e.dept_id=d.dept_id;

-- Q2;  List ALL employees with their department names. If an employee has no department, show NULL for department name.
select e.emp_name,d.dept_name from employees as e
left join departments as d
on e.dept_id=d.dept_id;


-- Q3;  Show all departments and the number of employees in each. Include departments with Zero employees. 
select d.dept_name,count(e.dept_id) as employee_count from departments as d
left join employees as e
on d.dept_id=e.dept_id
group by d.dept_name order by d.dept_name asc;



-- Q4: Display each employee's name along with their manager's name. Employees with no manager should show 'No Manager'.
select e.emp_name,coalesce(m.emp_name,'no manager') as manager from manager as m  -- coalesce ka use null ko replace karne ke liye kiya jata hai
 right join manager as e
on m.emp_id=e.manager_id;

