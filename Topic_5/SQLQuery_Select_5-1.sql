-- JKTVR16 Konstantinov Rudolf
-- Excercise 5.1

-- query 1
SELECT * FROM works_on;
-- query 2
SELECT emp_no FROM works_on WHERE job='Clerk';
-- query 3
SELECT emp_no FROM works_on WHERE project_no='p2' AND emp_no<10000;
-- query 4
SELECT emp_no FROM works_on WHERE Year(enter_date) NOT LIKE '2007';
SELECT emp_no FROM works_on WHERE enter_date NOT BETWEEN '01-01-2007' AND '12-31-2007';
-- query 5
SELECT emp_no FROM works_on WHERE project_no='p1' AND job IN ('Analyst', 'Manager');
-- query 6
SELECT emp_no FROM works_on WHERE project_no='p2' AND job IS NULL;
-- query 7
SELECT emp_no, emp_lname FROM employee WHERE emp_fname Like '%tt%';
-- query 8
SELECT emp_no, emp_fname FROM employee WHERE emp_lname Like '_[ao]%es';
-- query 9
SELECT project_name FROM project WHERE budget NOT BETWEEN 100000 AND 300000;
SELECT project_name FROM project WHERE budget<100000 OR budget>300000;
-- query 10
SELECT emp_lname, emp_fname FROM employee WHERE emp_fname Not Like '%[xy]%' AND emp_lname Not Like '%[xy]%';
--Doesn't work properly by some reason
--SELECT emp_lname, emp_fname FROM employee WHERE emp_fname Like '%[^xy]%' AND emp_lname Like '%[^xy]%';