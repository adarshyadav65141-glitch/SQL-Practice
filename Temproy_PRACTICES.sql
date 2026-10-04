CREATE DATABASE tempory;
DROP DATABASE tempory;
USE tempory;

CREATE TABLE employees(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
gender VARCHAR(10),
department VARCHAR(50),
city VARCHAR(50),
experience INT,
salary INT,
joining_date DATE
);

INSERT INTO employees
(name,gender,department,city,experience,salary,joining_date)
VALUES
('Rahul','Male','IT','Delhi',2,50000,'2023-01-15'),
('Amit','Male','HR','Mumbai',5,70000,'2020-05-20'),
('Neha','Female','IT','Delhi',3,60000,'2022-03-10'),
('Priya','Female','Finance','Pune',6,70000,'2019-08-12'),
('Rohan','Male','IT','Noida',4,65000,'2021-09-25'),
('Sneha','Female','Finance','Mumbai',7,75000,'2018-04-11'),
('Vikas','Male','IT','Noida',8,80000,'2017-02-18'),
('Pooja','Female','HR','Delhi',2,55000,'2023-07-14'),
('Ankit','Male','Sales','Lucknow',5,62000,'2020-10-21'),
('Kiran','Female','Sales','Lucknow',3,58000,'2022-01-05'),
('Deepak','Male','Finance','Delhi',9,90000,'2016-11-30'),
('Meena','Female','IT','Mumbai',4,68000,'2021-06-15'),
('Arjun','Male','HR','Pune',1,45000,'2024-02-10'),
('Komal','Female','Sales','Delhi',6,72000,'2019-09-18'),
('Sanjay','Male','Finance','Lucknow',10,95000,'2015-03-27'),
('Nisha','Female','IT','Delhi',5,71000,'2020-12-12'),
('Manoj','Male','HR','Noida',7,76000,'2018-07-09'),
('Asha','Female','Sales','Mumbai',8,81000,'2017-01-19'),
('Rakesh','Male','IT','Lucknow',2,53000,'2023-05-22'),
('Simran','Female','Finance','Delhi',4,69000,'2021-11-08');
/* Q1. Find the total number of employees.*/
SELECT COUNT(*) FROM employees;

/* Q2. Find the total number of male employees.*/
SELECT gender ,count(*)  AS Male_employee
FROM employees
WHERE gender='Male';

/* Q3. Find the total number of female employees.*/
SELECT gender ,count(*) as Female_employee
FROM employees
WHERE gender='Female';

/* Q4. Find the average salary of all employees.*/
SELECT AVG(salary) AS avg_salary
FROM employees;

/*Q5. Find the highest salary among all employees.*/
SELECT MAX(salary) as highest_salary
FROM employees;

/* Q6. Find the lowest salary among all employees.*/
SELECT MIN(salary) as lowest_salary
FROM employees;

/* Q7. Find the total salary paid to all employees.*/
SELECT SUM(salary) as total_salary
FROM employees;

/* Q8. Find all employees who work in the IT department.*/
SELECT *
FROM employees
WHERE department='IT';

/* Q9. Find employees whose salary is greater than 60,000.*/
SELECT  * FROM employees
WHERE salary>60000;

/* Q10. Find employees who have more than 5 years of experience.*/
SELECT * FROM employees
WHERE experience >5;

/* Q11. Find employees who work in IT and earn more than 60,000.*/
SELECT   * FROM employees
WHERE department='IT' AND salary >60000;

/*Q12. Find employees who are from Delhi.*/
SELECT * FROM employees
WHERE city='Delhi';

/* Q13. Find employees whose salary is between 50,000 and 70,000.*/
SELECT * FROM employees
WHERE salary BETWEEN 50000 AND 70000;

/* Q14. Find employees whose name starts with 'A'.*/
SELECT * FROM employees
WHERE name like 'A%';

/* Q15. Find employees who joined the company after 2020.*/
SELECT * FROM employees
WHERE joining_date>'2020-12-31';

/*Q16. Find the number of employees in each department.*/
SELECT  department,COUNT(*)
FROM employees
GROUP BY department;

/* Q17. Find the number of employees in each city.*/
SELECT city ,count(*)
FROM employees
GROUP BY city;

/* Q18. Find the average salary of each department.*/
SELECT department,ROUND(AVG(salary),2)
FROM employees
GROUP BY department;

/* Q19. Find the total salary paid by each department.*/
SELECT department,SUM(salary)
FROM employees
GROUP BY department;

/*Q20. Find the highest salary in each department.*/
SELECT department,MAX(salary)
FROM employees
GROUP BY department;

/*Q21. Find the lowest salary in each department.*/
SELECT department,MIN(salary)
FROM employees
GROUP BY department;

/* Q22. Find departments having more than 4 employees.*/
SELECT department,COUNT(*)
FROM employees
GROUP BY department
HAVING COUNT(*)>4;

/* Q23. Find departments whose average salary is greater than 60,000.*/
SELECT department,ROUND(AVG(salary),2)
FROM employees
GROUP BY department
HAVING AVG(salary)>60000;

/* Q24. Find cities having more than 3 employees.*/
SELECT city,COUNT(city) 
FROM employees
GROUP BY city
HAVING COUNT(city)>3;

/* Q25. Find the department with the highest average salary.*/
SELECT department, ROUND(AVG(salary) ,2)AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC
LIMIT 1;

/* Q26. Find the employee who has the highest salary in the company.*/
SELECT * 
FROM employees
order by  salary desc
limit 1;

/* Q27. Find the employee who has the lowest salary in the company.*/
SELECT *
FROM employees
ORDER BY salary ASC
LIMIT 1;

/* Q28. Find employees whose salary is greater than the overall average salary.*/
SELECT * 
FROM employees
WHERE salary >(
SELECT AVG(salary) 
FROM employees);

/*Q29. Find employees whose salary is greater than their department's average salary.*/
SELECT *
FROM employees e
WHERE e.salary >(
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department=e.department
);

/*Q30. Find the highest-paid employee from each department.*/
SELECT *
FROM employees e
WHERE e.salary =(
     SELECT MAX(e2.salary)
     FROM employees e2
     WHERE e2.department=e.department
);

/*Q31. Find the department-wise average salary and employee count.*/
SELECT department,
   AVG(salary) AS avg_salary,
   COUNT(*) AS employee_count
FROM employees
GROUP BY department;
   
/* Q32. Find the department with the highest total salary.*/
SELECT department,
 SUM(salary) AS total_salary
 FROM employees
 GROUP BY department
 ORDER BY total_salary desc
 limit 1;

/*Q33. Find employees who have more experience than the average experience of all employees.*/
SELECT * FROM employees 
WHERE experience >(
SELECT AVG(experience) FROM employees);

/* Q34. Find the second-highest salary in the company.*/
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

/* Q35. Find the second-highest salary employee in each department.*/
SELECT * FROM employees E
WHERE E.salary =(
SELECT  salary FROM employees E2
WHERE E2.department=E.department
ORDER BY E2.salary DESC
LIMIT 1 OFFSET 1);

-- Q36. Find the average experience of all employees.
SELECT AVG(experience) FROM employees;

-- Q37. Find the total number of employees in each gender.
SELECT gender,count(*) 
FROM employees
GROUP BY gender;

-- Q38. Find the average salary of male and female employees.
SELECT gender,round(AVG(salary),2)
 FROM  employees
 GROUP BY gender;

-- Q39. Find the highest salary among male employees.
SELECT gender ,MAX(salary) 
FROM employees
WHERE gender='Male'
GROUP BY gender;
-- Q40. Find the highest salary among female employees.
SELECT gender ,MAX(salary) 
FROM employees
WHERE gender='Female'
GROUP BY gender;
-- Q41. Find the employee with the most experience.
SELECT * FROM employees
WHERE experience=(
SELECT MAX(experience)
 FROM employees);
 
-- Q42. Find all employees who have the same salary.
SELECT *
FROM employees
WHERE salary IN (
SELECT salary FROM employees
GROUP BY salary
HAVING COUNT(*) > 1
);
-- Q43. Find departments where the minimum salary is greater than 50,000.
SELECT department,MIN(salary)
FROM employees
GROUP BY department
HAVING MIN(salary)>50000;

-- Q44. Find departments where the maximum salary is greater than 80,000.
SELECT department ,MAX(salary)
FROM employees
GROUP BY department
HAVING MAX(salary)>80000;

-- Q45. Find the city with the highest number of employees.
SELECT city,count(*)
FROM employees
GROUP BY city
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Q46. Find the department with the lowest average salary.
SELECT  department ,AVG(salary)
FROM employees
GROUP BY department
ORDER BY AVG(salary) ASC
LIMIT 1;

-- Q47. Find employees who earn more than 70,000 and have more than 5 years of experience.
SELECT * FROM employees
WHERE salary>70000 AND experience >5;
-- Q48. Find employees who work in IT or Finance department.
SELECT * FROM employees
WHERE  department='IT' OR department='Finance';

-- Q49. Find employees who are from Delhi or Mumbai.
SELECT * FROM employees
WHERE city='Delhi' OR city='Mumbai';

-- Q50. Find employees whose salary is not between 60,000 and 80,000.
SELECT * FROM employees
WHERE salary NOT BETWEEN 60000 AND 80000;


