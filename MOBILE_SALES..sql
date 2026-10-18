CREATE DATABASE MOBILE_SALES;
USE MOBILE_SALES;

SELECT * FROM mobile_sales;

# Q21. find each Brand and its total Units Sold.

SELECT Brand, SUM(`Units Sold`)
FROM MOBILE_SALES
WHERE Brand='Apple';

SELECT Brand, SUM(`Units Sold`)
FROM MOBILE_SALES
WHERE Brand='Xiaomi';

SELECT Brand,SUM(`Units Sold`)
FROM MOBILE_SALES
WHERE Brand='Oneplus';

SELECT Brand, 
SUM(`Units Sold`) AS total_units
FROM MOBILE_SALES
GROUP BY Brand;

SELECT 
SUM(`Units Sold`) AS Grand_total
FROM MOBILE_SALES;

# Q22. find the total Sales Amount for each City.

SELECT City, ROUND(SUM(`Units Sold` * `Price Per Unit`) ,2)AS total_Sales
FROM mobile_sales
GROUP BY City;

# Q23. find the Brand with the highest average Price Per Unit.
SELECT Brand,
ROUND(AVG(`Price Per Unit`),2) AS high
FROM mobile_sales
GROUP BY Brand
ORDER BY high DESC LIMIT 1;

# Q24. for each Payment Method find:
#       1. Transaction Count
#       2. Total Units Sold
#       3. Total Sales Amount
SELECT `Payment Method`,
COUNT(`Payment Method`) AS Total_Transaction,
SUM(`Units Sold`) AS Total_sold_units,
ROUND(SUM(`Sales Amount`),2)AS Total_sales_amount
FROM mobile_sales
GROUP BY `Payment Method`;

SELECT 
COUNT(`Payment Method`),
SUM(`Units Sold`)
FROM mobile_sales
WHERE `Payment Method`='UPI';

# Q25. calculate the total Sales Amount for each Year.
# Find the Year with the highest total Sales Amount.
SELECT `Year`,
ROUND(SUM(`Sales Amount`) ,2)AS total_Sales_Amount
FROM MOBILE_SALES
GROUP BY `Year` 
ORDER BY total_Sales_Amount  DESC LIMIT 1;