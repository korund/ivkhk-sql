-- JKTVR16 Konstantinov Rudolf
-- Topic 8.1

-- query 1
select * from project cross join works_on;
select * from project inner join works_on on project.project_no=works_on.project_no;
-- query 2
-- Для соединения N таблиц необходимо N-1 условий соединения
-- query 3
select emp_no,job from works_on inner join project on project.project_no=works_on.project_no where project_name='Gemini';
-- query 4
select emp_fname,emp_lname from employee inner join department on employee.dept_no=department.dept_no where dept_name in ('Research', 'Accounting');
-- query 5
select enter_date from works_on inner join employee on works_on.emp_no=employee.emp_no where dept_no='d1';
-- query 6
-- select projects with more than 1 clerk
select * from project where project_no in (
	select project.project_no from project 
		inner join works_on on project.project_no=works_on.project_no 
		where job='clerk'
		group by project.project_no
		having count(job)>1);
-- query 7
select emp_fname,emp_lname from employee 
	inner join works_on on employee.emp_no=works_on.emp_no
	inner join project on works_on.project_no=project.project_no
	where job='manager' and project_name='mercury';
-- query 8
/*
-- employees who have same enter_date:
1. count all enter_date's
2. get emp_no's of all, who has such enter_date's
3. get first+last names
*/
select emp_fname,emp_lname from employee where emp_no in (
	select emp_no from works_on where enter_date in (
		select enter_date from works_on group by enter_date having count(enter_date)>1
		));
-- query 9
select emp_no from employee_enh
	inner join department on employee_enh.domicile=department.location;
-- query 10
select employee.* from employee
	inner join works_on on employee.emp_no=works_on.emp_no
	inner join project on works_on.project_no=project.project_no
	inner join department on employee.dept_no=department.dept_no
	where project_name='Apollo' and dept_name='marketing';
select * from employee
	where dept_no=(
		select dept_no from department where dept_name='marketing')
	and emp_no in (
		select emp_no from works_on where project_no=(
			select project_no from project where project_name='apollo'));