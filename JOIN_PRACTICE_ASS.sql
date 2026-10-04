CREATE DATABASE JOINS_PRACTICES_ASS;

USE JOINS_PRACTICES_ASS;

CREATE TABLE departments(
department_id INT PRIMARY KEY,
department_name VARCHAR(50),
location VARCHAR(50),
manager_id INT
);

INSERT INTO departments VALUES
(1, 'IT', 'Delhi', 101),
(2, 'HR', 'Mumbai', 102),
(3, 'Finance', 'Pune', 103),
(4, 'Sales', 'Delhi', 104),
(5, 'Bio-Tech', 'Mumbai', 105),
(6, 'Marketing', 'Lucknow', NULL);

CREATE TABLE managers(
manager_id INT PRIMARY KEY,
manager_name VARCHAR(50)
);

INSERT INTO managers VALUES
(101, 'Rajesh Sharma'),
(102, 'Amit Verma'),
(103, 'Neha Singh'),
(104, 'Pankaj Gupta'),
(105, 'Sanjay Yadav');

CREATE TABLE employees(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
gender VARCHAR(10),
city VARCHAR(50),
experience INT,
salary INT,
department_id INT,
manager_id INT
);

INSERT INTO employees VALUES
(1, 'Rahul', 'Male', 'Delhi', 2, 50000, 1, 101),
(2, 'Amit', 'Male', 'Mumbai', 5, 70000, 2, 102),
(3, 'Neha', 'Female', 'Delhi', 3, 60000, 1, 101),
(4, 'Priya', 'Female', 'Pune', 6, 70000, 3, 103),
(5, 'Rohan', 'Male', 'Noida', 4, 65000, 1, 101),
(6, 'Sneha', 'Female', 'Mumbai', 7, 75000, 3, 103),
(7, 'Vikas', 'Male', 'Noida', 8, 80000, 1, 101),
(8, 'Pooja', 'Female', 'Delhi', 2, 55000, 2, 102),
(9, 'Ankit', 'Male', 'Lucknow', 5, 62000, 4, 104),
(10, 'Kiran', 'Female', 'Lucknow', 3, 58000, 4, 104),
(11, 'Deepak', 'Male', 'Delhi', 9, 90000, 3, 103),
(12, 'Meena', 'Female', 'Mumbai', 4, 68000, 1, 101),
(13, 'Arjun', 'Male', 'Pune', 1, 45000, 2, 102),
(14, 'Komal', 'Female', 'Delhi', 6, 72000, 4, 104),
(15, 'Sanjay', 'Male', 'Lucknow', 10, 95000, 3, 103),
(16, 'Nisha', 'Female', 'Delhi', 5, 71000, 1, 101),
(17, 'Manoj', 'Male', 'Noida', 7, 76000, 2, 102),
(18, 'Asha', 'Female', 'Mumbai', 8, 81000, 4, 104),
(19, 'Rakesh', 'Male', 'Lucknow', 2, 53000, 1, 101),
(20, 'Simran', 'Female', 'Delhi', 4, 69000, 3, 103);
INSERT INTO employees
VALUES
(21, 'Chandan', 'Male', 'Delhi', 2, 55000, 99, NULL);

SELECT * FROM employees;
SELECT * FROM managers;
SELECT * FROM departments;

-- Q1. Display employee name and their department name using INNER JOIN.
SELECT c.emp_name,p.department_name
FROM employees AS c
INNER JOIN departments AS p
ON c.department_id=p.department_id;

-- Q2. Display employee name, salary, and department location.
SELECT e.emp_name,e.salary,e2.location
FROM employees AS e
INNER JOIN departments AS e2
ON e.department_id=e2.department_id;

-- Q3. Display all employees along with their department details.
SELECT  d.emp_name,f.*
FROM employees AS d
LEFT JOIN departments AS f
ON d.department_id=f.department_id;

-- Q4. Find employees who belong to departments located in Delhi.
SELECT r.emp_name,g.location
FROM employees AS r
INNER JOIN departments AS g
ON r.department_id=g.department_id
WHERE g.location='Delhi';

-- Q5. Find employees whose department has a specific manager.
SELECT s.emp_name,a.manager_name
FROM employees AS s
INNER JOIN managers AS a
ON s.manager_id=a.manager_id
WHERE a.manager_name='Neha Singh';

-- Q6. Display employee name, department name, and manager name.
SELECT h.emp_name,j.department_name,m.manager_name
FROM employees AS h
INNER JOIN departments AS j
ON h.department_id=j.department_id
INNER JOIN managers AS m
ON h.manager_id=m.manager_id;

-- Q7. Find the number of employees in each department using JOIN.
SELECT c.department_name,COUNT(b.emp_id) AS employee_count
FROM employees AS b
INNER JOIN departments AS c
ON b.department_id=c.department_id
GROUP BY c.department_name;

-- Q8. Find the average salary of employees in each department using JOIN.
SELECT v.department_name,ROUND(AVG(b.salary),2) AS avg_salary
FROM employees AS b
INNER JOIN departments AS v
ON b.department_id=v.department_id
GROUP BY v.department_name;

-- Q9. Find the total salary paid in each department using JOIN.
SELECT n.department_name,SUM(l.salary) AS total_salary
FROM employees AS l
INNER JOIN departments AS n
ON l.department_id=n.department_id
GROUP BY n.department_name;

-- Q10. Find departments having more than 3 employees using JOIN.
SELECT x.department_name, COUNT(*) 
FROM employees AS m
INNER JOIN departments AS x
ON m.department_id=x.department_id
GROUP BY x.department_name
HAVING COUNT(*)>3;

-- Q11. Find departments whose average employee salary is greater than 70,000.
SELECT r.department_name,AVG(k.salary) AS avg_salary
FROM employees AS k
INNER JOIN departments AS r
ON k.department_id=r.department_id
GROUP BY r.department_name
HAVING AVG(salary)>70000;

-- Q12. Find the highest-paid employee from each department using JOIN.
SELECT h.emp_name,h.salary,j.department_name
FROM employees AS h
INNER JOIN departments AS j
ON h.department_id=j.department_id
WHERE h.salary=(
SELECT MAX(h2.salary) FROM employees AS h2
WHERE h2.department_id=h.department_id);

-- Q13. Find employees who work in departments located in Mumbai.
SELECT c.emp_name,v.department_name
FROM employees AS c
INNER JOIN departments AS v
ON c.department_id = v.department_id
WHERE v.location='Mumbai';

-- Q14. Display all employees, including employees whose department information is missing.
SELECT s.emp_name,d.department_name
FROM employees AS s
LEFT JOIN departments AS d
ON s.department_id=d.department_id;

-- Q15. Display all departments, including departments that have no employees.
SELECT a.department_name,f.emp_name
FROM departments AS a
LEFT JOIN employees AS f
ON f.department_id=a.department_id;

-- Q16. Find departments that currently have no employees.
SELECT w.department_name,q.emp_name
FROM departments AS w
LEFT JOIN employees AS q
ON q.department_id=w.department_id
WHERE q.emp_id IS NULL;

-- Q17. Find employees whose salary is greater than the average salary of their department.
SELECT m.emp_name,m.salary,n.department_name
FROM employees AS m
INNER JOIN departments AS n
ON m.department_id=n.department_id
WHERE m.salary >(
SELECT AVG(m2.salary) FROM employees AS m2
WHERE m2.department_id=m.department_id);

-- Q18. Find the employee with the highest salary in the company along with their department details.
SELECT z.emp_name,z.salary,y.department_name
FROM employees AS z
INNER JOIN departments AS y
ON z.department_id=y.department_id
WHERE z.salary=(
SELECT MAX(z2.salary) 
FROM employees  AS z2);

-- Q19. Find the second-highest salary employee along with their department and manager.
SELECT q.emp_name,
q.salary,
p.department_name,
m.manager_name
FROM employees AS q
INNER JOIN departments AS P
ON q.department_id=p.department_id
INNER JOIN managers AS m
ON m.manager_id=p.manager_id
WHERE q.salary=(
SELECT q2.salary FROM employees AS q2
ORDER BY q2.salary DESC LIMIT 1 OFFSET 1);

-- Q20. Find the department having the highest average salary.
SELECT e.department_name, AVG(i.salary) AS avg_salary
FROM employees AS i
INNER JOIN departments AS e
    ON i.department_id = e.department_id
GROUP BY e.department_name
ORDER BY avg_salary DESC
LIMIT 1;
-- Q21. Find the department having the highest total salary.
SELECT t.department_name, SUM(i.salary) AS total_salary
FROM employees AS i
INNER JOIN departments AS t
    ON i.department_id=t.department_id
    GROUP BY t.department_name
    ORDER BY total_salary DESC
    LIMIT 1;
    
-- Q22. Find employees who have more experience than their department's average experience.
SELECT w.experience,e.department_name
FROM employees AS w
INNER JOIN departments AS e
ON w.department_id=e.department_id
WHERE w.experience>(
         SELECT AVG(experience) AS avg_experience
         FROM employees AS w2
         WHERE w2.department_id=w.department_id);

-- Q23. Find the number of male and female employees in each department.
SELECT b.gender,f.department_name,COUNT(b.gender)
FROM employees AS b
INNER JOIN departments AS f
ON f.department_id=b.department_id
GROUP BY f.department_name,b.gender;

-- Q24. Find the average salary by department and gender.
SELECT c.gender,b.department_name,ROUND(Avg(c.salary) ,2)As Avg_salary
FROM employees AS c
INNER JOIN departments AS b
ON c.department_id=b.department_id
GROUP BY b.department_name,c.gender;

-- Q25. Find departments where the number of employees is greater than 
-- the overall average number of employees per department.
SELECT u.department_name,count(x.emp_id)
FROM departments AS u
INNER JOIN employees AS x
ON x.department_id=u.department_id
GROUP BY u.department_name
HAVING COUNT(emp_id)>(
     SELECT AVG(emp_count) 
     FROM (SELECT COUNT(emp_id) AS emp_count
           FROM employees
           GROUP BY department_id)
           AS t);

-- Q26. Display employee name, city, department name, and department location.
SELECT d.emp_name,
d.city,
c.department_name,
c.location
 FROM employees AS d
 INNER JOIN departments AS c
 ON d.department_id=c.department_id;
 
-- Q27. Find employees whose city is different from their department's location.
SELECT e.emp_id,
e.city,
v.department_name,
v.location
FROM employees AS e
INNER JOIN departments AS v
ON e.department_id = v.department_id
WHERE e.city <> v.location;

-- Q28. Find the highest-paid employee in each department and display their manager's name.
SELECT e.emp_name,e.salary,
d.department_name,
m.manager_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id= d.department_id
INNER JOIN managers AS m
ON e.manager_id=m.manager_id
WHERE e.salary=(
SELECT MAX(c.salary)
FROM employees AS c
WHERE c.department_id=e.department_id);

-- Q29. Find departments where at least one employee earns more than 80,000.
SELECT s.department_name
FROM employees AS v
INNER JOIN departments AS s
ON v.department_id=s.department_id
GROUP BY s.department_name
HAVING MAX(v.salary)>80000;

-- Q30. Find the top 2 highest-paid employees from each department.
SELECT department_name, emp_name, salary
FROM (
    SELECT d.department_name,
           e.emp_name,
           e.salary,
           ROW_NUMBER() OVER (
               PARTITION BY e.department_id
               ORDER BY e.salary DESC
           ) AS rn
    FROM employees AS e
    INNER JOIN departments AS d
    ON e.department_id = d.department_id
) AS t
WHERE rn <= 2;
