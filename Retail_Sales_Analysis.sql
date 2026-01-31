-- SQL Retail Sales Analysis
CREATE DATABASE Sql_Project;
USE Sql_Project;


-- CREATE TABLE
CREATE TABLE retail_sales(
transactions_id INT PRIMARY KEY,
sale_date DATE,
sale_time TIME,
customer_id INT,
gender VARCHAR(15),
age	INT,
category VARCHAR(20),
quantiy INT,
price_per_unit INT,
cogs FLOAT,
total_sale INT
);

SELECT * FROM retail_sales;

SELECT COUNT(*) FROM retail_sales
WHERE transactions_id IS NULL;

SELECT * FROM retail_sales
WHERE 
	  transactions_id IS NULL
	  OR
      sale_date IS NULL
      OR
      sale_time IS NULL
      OR
      customer_id IS NULL
      OR
      gender IS NULL
      OR
      age IS NULL
      OR
      category IS NULL
      OR
	  quantity IS NULL
      OR
      price_per_unit IS NULL
      OR
      cogs IS NULL
      OR
      total_sale IS NULL;
      
SELECT * FROM retail_sales;   

-- Deleting NULL values

DELETE FROM retail_sales 
WHERE transactions_id IS NULL
	or
      sale_date IS NULL
      or
      sale_time IS NULL
      or
      customer_id IS NULL
      or
      gender IS NULL
      or
      age IS NULL
      or
      category IS NULL
      or
	  quantity IS NULL
      or
      price_per_unit IS NULL
      or
      cogs IS NULL
      or
      total_sale IS NULL;

SELECT * FROM retail_sales;

-- My Analysis & Findings

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 2 in the month of Nov-2022
SELECT * FROM retail_sales
WHERE category = 'Clothing'
AND quantity >= 2
AND month(sale_date) = 11
AND year(sale_date) = 2022;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT category, SUM(total_sale) as total_sales
FROM retail_sales
group by category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT AVG(age) as average_age
FROM retail_sales
where category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT transactions_id, customer_id, category
FROM retail_sales
where total_sale > 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transactions_id) made by each gender in each category.
SELECT gender, category, COUNT(transactions_id) as total_transactions
FROM retail_sales
GROUP BY gender, category;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.
SELECT 
YEAR(sale_date) as Year,
MONTH(sale_date) as Month,
AVG(total_sale) as avg_sale
FROM retail_sales
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY Year,Month;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales.
SELECT customer_id, SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY customer_id
limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT category,COUNT(DISTINCT(customer_id)) as Unique_customers
FROM retail_sales
GROUP BY category;

-- End of Project



