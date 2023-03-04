select 
employees.Emp_no as "Employee Number", 
employees.last_name as "Last Name",
employees.first_name as "First Name",
employees.sex as Sex,
(Select salary from salaries where salaries.emp_no = employees.Emp_no) as Salary
from employees
limit 10

select
first_name,
last_name,
hire_date
from employees
where extract(year from hire_date)   = '1986'


select 
dept_no as "Department Number",
(Select department_name from departments where dept_Mgr.dept_no=departments.dept_no) as "Department Name",
emp_no as "Employee Number",
(select first_name from employees where dept_Mgr.emp_no = employees.Emp_no) as "First Name",
(select last_name from employees where dept_Mgr.emp_no = employees.Emp_no) as "Last Name"
from dept_Mgr


select 
first_name as "First Name",
last_name as "Last Name",
sex as Sex
from 
employees
where first_name = 'Hercules'
and last_name like 'B%'


select 
emp_no as "Employee Number",
(select first_name from employees where dept_emp.emp_no = employees.Emp_no) as "First Name",
(select last_name from employees where dept_emp.emp_no = employees.Emp_no) as "Last Name"
from dept_emp
where dept_no = (select dept_no from departments 
				 where deparment_name = 'Sales'
				 and dept_emp.dept_no =departments.dept_no )
				 
select 
emp_no as "Employee Number",
(select first_name from employees where dept_emp.emp_no = employees.Emp_no) as "First Name",
(select last_name from employees where dept_emp.emp_no = employees.Emp_no) as "Last Name",
(Select deparment_name from departments where dept_emp.dept_no=departments.dept_no) as "Department Name"
from dept_emp
where dept_no = (select dept_no from departments 
				 where deparment_name in ('Sales','Development')
				 and dept_emp.dept_no =departments.dept_no )
				 
select 
last_name as "Last Name",
Count(last_name) as "Frequency counts"
from employees
Group by last_name
order by Count(last_name) desc