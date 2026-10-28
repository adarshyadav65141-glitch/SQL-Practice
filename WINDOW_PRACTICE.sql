-- Window Function Practice Table

CREATE DATABASE WINDOW_PRACTICE;

USE WINDOW_PRACTICE;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    gender VARCHAR(10),
    department VARCHAR(50),
    city VARCHAR(50),
    experience INT,
    salary INT,
    joining_date DATE
);

INSERT INTO employees VALUES
(1, 'Rahul', 'Male', 'IT', 'Delhi', 2, 50000, '2022-01-10'),
(2, 'Amit', 'Male', 'HR', 'Mumbai', 5, 70000, '2019-03-15'),
(3, 'Neha', 'Female', 'IT', 'Delhi', 3, 60000, '2021-06-20'),
(4, 'Priya', 'Female', 'Finance', 'Pune', 6, 70000, '2018-02-12'),
(5, 'Rohan', 'Male', 'IT', 'Noida', 4, 65000, '2020-08-18'),
(6, 'Sneha', 'Female', 'Finance', 'Mumbai', 7, 75000, '2017-05-25'),
(7, 'Vikas', 'Male', 'IT', 'Noida', 8, 80000, '2016-09-10'),
(8, 'Pooja', 'Female', 'HR', 'Delhi', 2, 55000, '2022-11-05'),
(9, 'Ankit', 'Male', 'Sales', 'Lucknow', 5, 62000, '2019-07-14'),
(10, 'Kiran', 'Female', 'Sales', 'Lucknow', 3, 58000, '2021-04-22'),
(11, 'Deepak', 'Male', 'Finance', 'Delhi', 9, 90000, '2015-01-18'),
(12, 'Meena', 'Female', 'IT', 'Mumbai', 4, 68000, '2020-03-30'),
(13, 'Arjun', 'Male', 'HR', 'Pune', 1, 45000, '2023-01-12'),
(14, 'Komal', 'Female', 'Sales', 'Delhi', 6, 72000, '2018-06-19'),
(15, 'Sanjay', 'Male', 'Finance', 'Lucknow', 10, 95000, '2014-02-10'),
(16, 'Nisha', 'Female', 'IT', 'Delhi', 5, 71000, '2019-10-15'),
(17, 'Manoj', 'Male', 'HR', 'Noida', 7, 76000, '2017-08-21'),
(18, 'Asha', 'Female', 'Sales', 'Mumbai', 8, 81000, '2016-04-11'),
(19, 'Rakesh', 'Male', 'IT', 'Lucknow', 2, 53000, '2022-07-09'),
(20, 'Simran', 'Female', 'Finance', 'Delhi', 4, 69000, '2020-12-01');

SELECT * FROM employees;

-- Q1. Display each employee's name and salary along with the company's overall average salary.
SELECT emp_name,
       salary,
	ROUND(AVG(salary) OVER (),1) AS Avg_salary
FROM employees;

-- Q2. Display each employee's salary along with the average salary of their department.
   SELECT emp_name,
   salary,
   department,
   ROUND(
   AVG(salary) OVER(PARTITION BY department),2)
   AS dep_avg_salary
   FROM employees;
   
-- Q3. Display each employee's salary and their salary rank within their department.
   SELECT emp_name,
   salary,
   department,
   RANK() OVER(PARTITION BY department
   ORDER BY salary DESC) AS Salary_rank
   FROM employees;
   
-- Q4. Find the highest-paid employee in each department.
SELECT emp_name,salary,department
FROM (SELECT emp_name,
salary,
department,
RANK() OVER(PARTITION BY department
ORDER BY salary DESC)
 AS salary_rank
FROM employees 
)AS t
WHERE salary_rank=1;

-- Q5. Find the lowest-paid employee in each department.
SELECT emp_name,salary,department
FROM( SELECT 
     emp_name,
     salary,
     department,
     RANK() OVER(PARTITION BY department
     ORDER BY salary ASC) 
     AS rank_salary
     FROM employees
) AS x
WHERE rank_salary=1;

-- Q6. Find the top 2 highest-paid employees in each department.
SELECT emp_name,salary,department
FROM(
     SELECT emp_name,
            salary,
            department,
            ROW_NUMBER() OVER(PARTITION BY department 
            ORDER BY salary DESC)
            AS second_high
		FROM employees) AS w
WHERE second_high<=2;

-- Q7. Find the bottom 2 lowest-paid employees in each department.
 SELECT emp_name,salary,department
 FROM(
 SELECT emp_name,
        salary,
        department,
        ROW_NUMBER() OVER(PARTITION BY department
        ORDER BY salary ASC)
        AS second_h_salary
	   FROM employees) AS z
 WHERE second_h_salary<=2;
 
-- Q8. Rank employees within each department based on salary using RANK().
SELECT emp_name,
       salary,
       department,
       RANK() OVER(PARTITION BY department
	  ORDER BY salary DESC)
      AS Provide_Rank
FROM employees;

-- Q9. Rank employees within each department based on salary using DENSE_RANK().
SELECT emp_name,
       salary,
       department,
      DENSE_RANK() OVER(PARTITION BY department
       ORDER BY salary DESC)
       AS DenseRank
FROM employees;
       
-- Q10. Find each employee's salary and their overall rank in the company.
SELECT emp_name,
       salary,
       department,
       RANK() OVER(
       ORDER BY salary DESC)
       AS Rank_overall
FROM employees;

-- Q11. Find the difference between each employee's salary and the highest salary in their department.
SELECT emp_name,
      salary,
      department AS Current_Salary,
      MAX(salary) OVER(PARTITION BY department
      ) - salary AS salary_difference
FROM employees;
      
-- Q12. Display each employee's salary along with the previous employee's salary.
SELECT emp_name,
      salary,
      department AS current_salary,
	LAG(salary) OVER(ORDER BY emp_id) AS privous_salary
FROM employees;

-- Q13. Display each employee's salary along with the next employee's salary.
SELECT emp_name,
	salary,
	department AS current_salary,
	LEAD(salary) OVER(ORDER BY emp_name) 
	AS next_salary
FROM employees;

-- Q14. Find the difference between each employee's salary and the previous employee's salary within their department.
SELECT emp_name,
	department,
    salary AS current_salary,
    salary-
	LAG(salary) OVER(PARTITION BY department
           ORDER BY emp_id) AS difference
FROM employees;
-- Q15. Compare each employee's salary with the first employee's salary in their department.
SELECT emp_name,
       department,
       salary AS current_salary,
       FIRST_VALUE(salary) OVER(PARTITION BY department
        ORDER BY emp_id) AS dispaly_first_salary
	FROM employees;
    
-- Q16. Compare each employee's salary with the last employee's salary in their department.
SELECT emp_name,
       department,
       salary AS current_salary,
       LAST_VALUE(salary) OVER(PARTITION BY department
       ORDER BY emp_id
       ROWS BETWEEN UNBOUNDED PRECEDING 
       AND UNBOUNDED FOLLOWING) AS dispaly_last_salary
	FROM employees;
    
-- Q17. Calculate the cumulative salary (running total) within each department.
SELECT emp_name,
	   department,
       salary,
       SUM(salary) OVER(PARTITION BY department
        ORDER BY emp_id) AS running_total
FROM employees;

-- Q18. Calculate the cumulative employee count within each department.
SELECT emp_name,
       department,
       salary,
        COUNT(*) 
       OVER(PARTITION BY department
       ORDER BY emp_id) AS Cumulative_count
FROM employees;
       
-- Q19. Calculate the running average salary within each department.
SELECT emp_name,
      department,
      salary,
      ROUND(
      AVG(salary)
      OVER(PARTITION BY department
      ORDER BY emp_id)
      ,2) AS running_average
FROM employees;

-- Q20. Display each employee's salary along with their department's total salary.
SELECT emp_name,
	  department,
      salary,
      SUM(salary) OVER(PARTITION BY department)
      AS total_salary
  FROM employees;
      
-- Q21. Calculate each employee's salary as a percentage of their department's total salary.
SELECT emp_name,
		department,
        salary,
		ROUND(
        salary*100.0/
        SUM(salary)OVER(PARTITION BY department),
        2
        )AS percentage_salary
FROM employees;

-- Q22. Find the top 3 employees by salary in each department.
SELECT emp_name,department,salary
FROM(
	SELECT emp_name,
		department,
        salary,
        RANK() OVER(PARTITION BY department
        ORDER BY salary DESC)
        AS salary_rank
	FROM employees
    ) AS st
WHERE salary_rank<=3;

-- Q23. Find the employee(s) with the second-highest salary in each department.
SELECT emp_name,salary,department
FROM(
    SELECT emp_name,
			department,
			salary,
            DENSE_RANK() OVER(PARTITION BY department
               ORDER BY salary DESC
               ) AS salary_rank
	 FROM employees
     ) AS sr
WHERE salary_rank<=2;
    
-- Q24. Find the employee(s) with the third-highest salary in each department.
SELECT emp_name,salary,department
FROM( SELECT emp_name,
			salary,
            department,
            DENSE_RANK() OVER(PARTITION BY department
            ORDER BY salary DESC
            ) AS third_high
	FROM employees
    )AS ht
WHERE third_high =3;

-- Q25. Rank employees within each department based on experience.
SELECT emp_name,
		experience,
        department,
        RANK() OVER(PARTITION BY department
        ORDER BY experience DESC
        )AS experience_rank
FROM employees;

-- Q26. Display each employee's experience along with their department's average experience for comparison.
SELECT emp_name,
		experience,
        department,
       ROUND(
          avg(experience) 
          OVER(PARTITION BY department
        ),2)AS Avg_experience
FROM employees;
        
-- Q27. Find the top 2 most experienced employees in each department.
SELECT emp_name,experience,department
FROM (
SELECT emp_name,
       experience,
       department,
        ROW_NUMBER() OVER(PARTITION BY department
         ORDER BY experience DESC
         ) AS high
	FROM employees) AS st
WHERE high<=2;

-- Q28. Rank employees within each department by salary using ROW_NUMBER(), RANK(), and DENSE_RANK().
SELECT emp_name,
       salary,
       department,
       ROW_NUMBER() OVER(PARTITION BY department
       ORDER BY salary DESC
       ) AS Display_row_number,
       RANK() OVER(PARTITION BY department
       ORDER BY salary DESC
       ) AS Display_rank,
       DENSE_RANK() OVER(PARTITION BY department
       ORDER BY salary DESC
       ) AS display_dense_rank
FROM employees;

-- Q29. Find the earliest-joined employee in each department and display their name, department, and joining date.
SELECT emp_name,department,joining_date
FROM(
SELECT emp_name,
	   department,
       joining_date,
       RANK() OVER(PARTITION BY department
       ORDER BY joining_date ASC
       )AS joining_rank
FROM employees) AS st
WHERE joining_rank=1;

-- Q30. Find the top 2 highest-paid employees in each department and display their salary rank, previous salary, and department's average salary.
SELECT emp_name,
		department,
        joining_date
FROM employees
WHERE YEAR(joining_date)=(
SELECT MAX(YEAR(joining_date))
FROM employees
);
