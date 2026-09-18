CREATE DATABASE Assignment;
USE Assignment;

CREATE TABLE employees(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(20),
emp_age NUMERIC NOT NULL,
emp_department VARCHAR(20),
emp_salary INT,
emp_city VARCHAR(30));

INSERT INTO employees
(emp_id,emp_name,emp_age,emp_department,emp_salary,emp_city)
VALUES
(1,'Adarsh',22,'IT',80000,'Azamgrah'),
(2,'Chandan',24,'IT',70000,'KushiNagar'),
(3,'Manish',21,'ME',85000,'Azamgrah'),
(4,'Sachin',23,'CSE',81000,'Azamgrah'),
(5,'Ravi',24,'CSE',70000,'Gorakhpur'),
(6,'Shivam',20,'CSE',25000,'Prayagraj'),
(7,'Vinod',19,'EC',30000,'AmbedkarNager'),
(8,'Shivam',23,'Bio.tech',40000,'Akbarpur'),
(9,'Vishal',25,'EE',45000,'Ballia'),
(10,'Aman',26,'CSE',32000,'Mau'),
(11,'Shurabha',21,'Non tech',30000,'Ghazipur');

/*2. Display all employees. */
SELECT * FROM employees;

/*3. Update the salary of one employee. */
UPDATE employees
SET emp_salary=50000
WHERE emp_id=6;

/* 4. Change one employee's city. */
UPDATE employees
SET emp_city='AmbedkarNager'
WHERE emp_id=11;

/* 5. Delete one employee.*/
DELETE FROM employees
WHERE emp_id=11;

/*  Find employees earning more than 50,000.*/
SELECT * FROM employees
WHERE emp_salary>50000;

/*Find employees from IT*/
SELECT COUNT(*)  FROM employees
WHERE emp_department='IT';

/* Find employees from Azamgrah*/
SELECT emp_name FROM employees
WHERE emp_city='Azamgrah';

/*Find employees earning between 40,000 and 60,000.*/
SELECT emp_name  FROM employees
WHERE emp_salary  BETWEEN 40000 AND 60000;

/*Find employees whose name starts with A.*/
SELECT emp_name FROM employees
WHERE emp_name LIKE 'A%';

/*Find employees whose name ends with a.*/
SELECT emp_name FROM employees
WHERE emp_name LIKE '%A';

/*Find employees belonging to IT or HR.*/
SELECT emp_name, emp_department FROM employees
WHERE emp_department='IT' OR emp_department='HR';

/*Find employees older than 23 and earning more than 50,000.*/
SELECT emp_name,emp_age,emp_salary
 FROM employees
WHERE emp_age>23 AND emp_salary>50000;

/*Find employees whose salary is NULL.*/
SELECT emp_name, emp_salary FROM employees
WHERE emp_salary IS NULL;

/*Find employees whose salary is not NULL.*/
SELECT emp_name,emp_salary FROM employees
WHERE emp_salary IS NOT NULL;

/* Sort employees by salary.*/
SELECT emp_salary FROM employees
Order by emp_salary  ASC;

/*Sort employees from highest salary to lowest.*/
SELECT emp_salary FROM employees
order by emp_salary desc;

/*Count employees in every department.*/
SELECT emp_department ,count(*) AS employee_count
FROM employees
GROUP BY emp_department;

/*Find average salary per department.*/
SELECT emp_department, avg(emp_salary)
FROM employees
GROUP BY emp_department;

/* Find maximum salary per department*/
SELECT emp_department, max(emp_salary)
FROM employees
GROUP BY emp_department;

/*Find departments having more than 3 employees.*/
SELECT emp_department ,COUNT(*)
FROM employees
GROUP BY emp_department
HAVING COUNT(*)>3;

/*Find departments whose average salary is greater than 60,000.*/
SELECT emp_department,
ROUND( AVG(emp_salary),2)
FROM employees
GROUP BY emp_department
HAVING AVG(emp_salary)>60000;

/*Sort departments by average salary.*/
SELECT emp_department,ROUND( AVG(emp_salary),2) AS AVG_SALARY
FROM employees
GROUP BY emp_department
ORDER BY AVG_SALARY;

/*Find the number of employees in every city*/
SELECT  emp_city, COUNT(*) 
FROM employees
GROUP BY emp_city;

/*Find cities having more than 2 employees.*/
SELECT emp_city, COUNT(*)
FROM employees
GROUP BY emp_city
HAVING COUNT(*)>=2;

/*Find total employees.*/
SELECT COUNT(*)FROM employees;

/*Find total salary.*/
SELECT SUM(emp_salary) FROM employees;

/*Find average salary.*/
SELECT AVG(emp_salary) FROM employees;

/*Find maximum salary.*/
SELECT MAX(emp_salary) AS MAX_SALARY FROM employees;

/*Find maximum salary.*/
SELECT MAX(emp_salary) AS MAX_SALARY FROM employees;

/*Find minimum salary.*/
 SELECT MIN(emp_salary) AS MIN_SALARY
 FROM employees;
 
/*Find average salary of IT employees.*/
SELECT AVG(emp_salary) FROM employees
WHERE emp_department='IT';

/*Find highest salary in Bio tech.*/
SELECT max(emp_salary)
FROM employees
WHERE emp_department='Bio.tech';

/*Find total salary paid to Non tech employees.*/
 SELECT SUM(emp_salary)
 FROM employees
 WHERE emp_department='Non tech' ;
 
/* Find number of employees in Azamgrah.*/
SELECT emp_city, count(*)
FROM employees
WHERE emp_city='Azamgrah';

/*Find department-wise total salary*/
SELECT emp_department, SUM(emp_salary)
FROM employees
GROUP BY emp_department;

/*Find average salary of employees earning  more than 50,000.*/
SELECT AVG(emp_salary) AS avg_salary
FROM employees
WHERE emp_salary>50000;

/*Find department with the highest average salary*/
SELECT emp_department, AVG(emp_salary) AS avg_salary
FROM employees
GROUP BY emp_department
ORDER BY avg_salary desc;
