create database  sql_pro_p2;
use sql_pro_p2;

create table retail_sale (
transactions_id	int primary key,
sale_date	date ,
sale_time	time ,
customer_id	int ,
gender	varchar(15),
age	int,
category varchar(20),	
quantiy	int,
price_per_unit	float,
cogs	float,
total_sale float
)
select * from retail_sale;
select count(*) from retail_sale;

select * from retail_sale
where transactions_id is null
or sale_date is null 
or sale_time is null
or customer_id is null
or gender is null 
or age is null
or category is null
or quantiy is null
or price_per_unit is null
or cogs is null 
or total_sale is null;

-- No. of sales we have ?
select count(*) as total_no_sales from retail_sale;

-- How many unique customer we have ?
select count(distinct customer_id) as total_uni_cust from retail_sale;

-- Write a SQL query to retrieve all columns for sales made on 2022-11-05

select * from retail_sale
where sale_date = '2022-11-05';

-- Write a SQL query to retrieve all transactions where the category is 'Clothing' and gender is Female

select * from retail_sale
where category ="Clothing"
and gender = 'Female';

-- Write a SQL query to calculate the total sales (total_sale) for each category

SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retail_sale
GROUP BY category;

-- Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category

select 
round(avg(age),2) as ave_age from retail_sale
where category = "Beauty";

-- Write a SQL query to find all transactions where the total_sale is greater than 1000

SELECT * FROM retail_sale
WHERE total_sale > 1000;

-- Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category

select 
      category,
      gender,
      count(*) as total_trans
from retail_sale
group by
      category,
      gender
order by category;

-- Write a SQL query to find the top 5 customers based on the highest total sales

SELECT customer_id,
       sum(total_sale) as total_sales
from retail_sale
group by customer_id
order by total_sales desc
limit 5;

-- Write a SQL query to find the number of unique customers who purchased items from each category

SELECT 
    category,    
    COUNT(DISTINCT customer_id) as uniq_cus
FROM retail_sale
GROUP BY category;


