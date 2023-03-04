select 
Employees.Emp_no as "Employee Number", 
Employees.last_name as "Last Name",
Employees.first_name as "First Name",
Employees.sex as Sex,
(Select salary from Salaries where Salaries.emp_no = Employees.Emp_no) as Salary
from Employees
limit 10

select
first_name,
last_name,
hire_date
from Employees
where extract(year from hire_date)   = '1986'


select 
dept_no as "Department Number",
(Select department_name from Departments where Dept_Mgr.dept_no=Departments.dept_no) as "Department Name",
emp_no as "Employee Number",
(select first_name from Employees where Dept_Mgr.emp_no = Employees.Emp_no) as "First Name",
(select last_name from Employees where Dept_Mgr.emp_no = Employees.Emp_no) as "Last Name"
from Dept_Mgr


select 
first_name as "First Name",
last_name as "Last Name",
sex as Sex
from 
Employees
where first_name = 'Hercules'
and last_name like 'B%'


select 
emp_no as "Employee Number",
(select first_name from Employees where Dept_emp.emp_no = Employees.Emp_no) as "First Name",
(select last_name from Employees where Dept_emp.emp_no = Employees.Emp_no) as "Last Name"
from Dept_emp
where dept_no = (select dept_no from Departments 
				 where deparment_name = 'Sales'
				 and Dept_emp.dept_no =Departments.dept_no )
				 
select 
emp_no as "Employee Number",
(select first_name from Employees where Dept_emp.emp_no = Employees.Emp_no) as "First Name",
(select last_name from Employees where Dept_emp.emp_no = Employees.Emp_no) as "Last Name",
(Select deparment_name from Departments where Dept_emp.dept_no=Departments.dept_no) as "Department Name"
from Dept_emp
where dept_no = (select dept_no from Departments 
				 where deparment_name in ('Sales','Development')
				 and Dept_emp.dept_no =Departments.dept_no )
				 
select 
last_name as "Last Name",
Count(last_name) as "Frequency counts"
from Employees
Group by last_name
order by Count(last_name) desc