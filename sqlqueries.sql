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

-- AND, OR, NOT Operators.

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

SELECT * FROM employees
WHERE salary BETWEEN 500000 AND 700000
ORDER BY salary DESC;

-- CONCAT two column values

SELECT CONCAT_WS(' ', fname, lname) AS 'FULL NAME' , salary
FROM employees
WHERE salary BETWEEN 600000 AND 800000
ORDER BY salary DESC;

-- HAVING | GROUP BY

SELECT COUNT(emp_id) AS 'Total Employees' , city FROM locations
GROUP BY city
HAVING COUNT(emp_id) >= 5
ORDER BY COUNT(emp_id) DESC;

-- EXISTS | ANY | ALL

SELECT emp_id, CONCAT_WS(' ', fname, lname) AS 'FULL NAME', salary
FROM employees
WHERE EXISTS
(SELECT emp_id FROM locations WHERE locations.emp_id = employees.emp_id);

SELECT emp_id, CONCAT_WS(' ', fname, lname) AS 'FULL NAME', salary
FROM employees
WHERE emp_id = ANY
(SELECT emp_id FROM locations WHERE locations.emp_id = employees.emp_id);


-- JOINS  | INNER JOIN | LEFT JOIN | RIGHT JOIN | CROSS JOIN | SELF JOIN

-- INNER JOIN
SELECT * FROM employees AS Emp
INNER JOIN contactdetails AS cd ON Emp.Emp_ID = cd.Emp_ID;

SELECT emp.fname, emp.lname, emp.salary, cd.email
FROM employees AS emp
INNER JOIN contactdetails AS cd 
ON emp.emp_id = cd.emp_id;

-- INNER JOIN ON employees and contactdetails table
SELECT emp.emp_id, CONCAT_WS(' ', emp.fname, emp.lname) AS 'full name', emp.salary, cd.email
FROM employees AS emp
INNER JOIN contactdetails AS cd 
ON emp.emp_id = cd.emp_id
ORDER BY emp_id;

-- INNER JOI ON (employees, contactdetails, locations, departments) table

SELECT 
emp.emp_id, CONCAT_WS(' ', emp.fname, emp.lname) AS 'Full Name', emp.salary,
cd.email,
dept.dept_name AS Department,
CONCAT_WS(', ', loc.city, loc.state, loc.country, loc.postal_code) AS Address
FROM (((employees AS emp
INNER JOIN contactdetails AS cd ON emp.emp_id = cd.emp_id)
INNER JOIN departments AS dept ON emp.emp_id = dept.emp_id)
INNER JOIN locations AS loc ON emp.emp_id = loc.emp_id)
ORDER BY emp.emp_id;

-- LEFT JOIN

SELECT 
emp.emp_id, CONCAT_WS(' ', emp.fname, emp.lname) AS 'Full Name', emp.salary,
cd.email,
dept.dept_name AS Department,
CONCAT_WS(', ', loc.city, loc.state, loc.country, loc.postal_code) AS Address
FROM (((employees AS emp
LEFT JOIN contactdetails AS cd ON emp.emp_id = cd.emp_id)
LEFT JOIN departments AS dept ON emp.emp_id = dept.emp_id)
LEFT JOIN locations AS loc ON emp.emp_id = loc.emp_id)
ORDER BY emp.emp_id;
SELECT * FROM employees;


-- RIGHT JOIN 

SELECT
emp.emp_id, CONCAT_WS(' ', emp.fname, emp.lname) AS 'Full Name',
CONCAT_WS(', ', loc.city, loc.state, loc.country, loc.postal_code) AS Address
FROM employees AS emp
RIGHT JOIN locations AS loc ON emp.emp_id = loc.emp_id;


-- CROSS JOIN

SELECT
emp.emp_id, CONCAT_WS(' ', emp.fname, emp.lname) AS 'Full Name',
CONCAT_WS(', ', loc.city, loc.state, loc.country, loc.postal_code) AS Address
FROM employees AS emp
CROSS JOIN locations AS loc;



