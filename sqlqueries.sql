SELECT DATABASE();   -- checking currect database
SHOW DATABASES;      -- showing all databases
USE hr_database;     -- selecting hr_database for use
SELECT DATABASE();   -- for confirmation checking which database are selected

SHOW TABLES;      -- showing all tables 

-- Now we can query to existing tables

SELECT * FROM Employees;
SELECT * FROM contactdetails;
SELECT * FROM departments;
SELECT * FROM locations;


SHOW COLUMNS FROM employees;  -- showing all columns from employees table

SELECT Emp_id, FName, lname, salary FROM employees;  -- showing only specified columns from employees table

SELECT DISTINCT salary FROM employees;   -- showing only unique values from salary column
SELECT COUNT(DISTINCT salary) FROM employees;  -- showing unique salary count
SELECT COUNT(Emp_ID) AS total_employees FROM employees;
SELECT AVG(salary) AS average_salary FROM employees;    -- showing average salary 
SELECT MIN(salary) AS lowest_salary FROM employees;
SELECT MAX(salary) AS highest_salary FROM employees;
SELECT SUM(salary) FROM employees;


SELECT * FROM employees
WHERE emp_id = 4;

SELECT * FROM employees    -- IN operator is used to specify multiple values/conditions
WHERE emp_id IN (4, 6, 11);

-- AND, OR, NOT Operators

SELECT * FROM locations
WHERE city = 'mumbai' AND postal_code = 400002;

SELECT * FROM locations
WHERE state = 'maharashtra' OR postal_code = 400086;

SELECT * FROM locations
WHERE postal_code NOT IN (400001, 400002);

-- ORDER BY Statement

SELECT * FROM employees
WHERE hire_date >= '2019-01-01' AND dept_id = 'IT08'
ORDER BY salary DESC
LIMIT 5;

-- Adding one more record in employee table

INSERT INTO employees
(Dept_ID, FName, LName, Gender, Hire_Date, Salary)    -- here i mentioned column name bcoz i am not entering Emp_ID data 
VALUES
('ID08', 'pradeep', 'shetty', 'male', '2017-04-01', 550000);

SELECT * FROM employees;

-- IS NULL, IS NOT NULL

SELECT * FROM employees
WHERE salary IS NOT NULL;

-- UPDATE STATEMENT

SET sql_safe_updates = 0;     -- this statement turns off the safe update mode.

UPDATE departments
SET dept_name = 'Information Technology'
WHERE dept_name = 'IT';

-- DELETE Statement
SELECT * FROM departments;
DELETE FROM departments 
WHERE Emp_ID = 20;

SELECT fname, lname FROM employees
WHERE fname LIKE 's%';                        -- %k | d% | %eep% | d%k | _k | o_ | _e%

SELECT * FROM employees
WHERE emp_id IN (SELECT emp_id FROM departments);

-- BETWEEN | NOT BETWEEN

select * from employees
where salary between 500000 and 700000
order by salary desc;

-- CONCAT two column values

select concat_ws(' ', fname, lname) as 'FULL NAME' , salary
from employees
where salary between 600000 and 800000
order by salary desc;

-- HAVING | GROUP BY

select count(emp_id) as 'Total Employees' , city from locations
group by city
having count(emp_id) >= 5
order by count(emp_id) desc;

-- EXISTS | ANY | ALL

select emp_id, concat_ws(' ', fname, lname) as 'FULL NAME', salary
from employees
where exists
(select emp_id from locations where locations.emp_id = employees.emp_id);

select emp_id, concat_ws(' ', fname, lname) as 'FULL NAME', salary
from employees
where emp_id = any
(select emp_id from locations where locations.emp_id = employees.emp_id);


-- JOINS  | INNER JOIN | LEFT JOIN | RIGHT JOIN | CROSS JOIN | SELF JOIN

-- INNER JOIN
select * from employees as Emp
inner join contactdetails as cd on Emp.Emp_ID = cd.Emp_ID;

SELECT emp.fname, emp.lname, emp.salary, cd.email
from employees as emp
inner join contactdetails as cd 
on emp.emp_id = cd.emp_id;

-- INNER JOIN ON employees and contactdetails table
select emp.emp_id, concat_ws(' ', emp.fname, emp.lname) as 'full name', emp.salary, cd.email
from employees as emp
inner join contactdetails as cd 
on emp.emp_id = cd.emp_id
order by emp_id;

-- INNER JOI ON (employees, contactdetails, locations, departments) table

select 
emp.emp_id, concat_ws(' ', emp.fname, emp.lname) as 'Full Name', emp.salary,
cd.email,
dept.dept_name as Department,
concat_ws(', ', loc.city, loc.state, loc.country, loc.postal_code) as Address
from (((employees as emp
inner join contactdetails as cd on emp.emp_id = cd.emp_id)
inner join departments as dept on emp.emp_id = dept.emp_id)
inner join locations as loc on emp.emp_id = loc.emp_id)
order by emp.emp_id;

-- LEFT JOIN

select 
emp.emp_id, concat_ws(' ', emp.fname, emp.lname) as 'Full Name', emp.salary,
cd.email,
dept.dept_name as Department,
concat_ws(', ', loc.city, loc.state, loc.country, loc.postal_code) as Address
from (((employees as emp
left join contactdetails as cd on emp.emp_id = cd.emp_id)
left join departments as dept on emp.emp_id = dept.emp_id)
left join locations as loc on emp.emp_id = loc.emp_id)
order by emp.emp_id;
select * from employees;


-- RIGHT JOIN 

select
emp.emp_id, concat_ws(' ', emp.fname, emp.lname) as 'Full Name',
concat_ws(', ', loc.city, loc.state, loc.country, loc.postal_code) as Address
from employees as emp
right join locations as loc on emp.emp_id = loc.emp_id;


-- CROSS JOIN

select
emp.emp_id, concat_ws(' ', emp.fname, emp.lname) as 'Full Name',
concat_ws(', ', loc.city, loc.state, loc.country, loc.postal_code) as Address
from employees as emp
cross join locations as loc;



