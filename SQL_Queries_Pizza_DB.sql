select * from pizza_sales;

--KPI--

--TotalRevenue. 
select sum(total_price) as Total_Revenue from pizza_sales

--AverageOrderValue. 
Select sum(total_price) / Count(distinct order_id) as Avg_Order_Value from pizza_sales

--TotalPizzaSold
Select sum(quantity) as Total_Pizza_sold from pizza_sales

--Total_orders
select (count (distinct order_id)) as Total_Orders from pizza_sales

--Average_Pizza_sold_per_order
select Cast(cast(sum(quantity) as decimal(10,2)) / cast(Count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Average_Pizza_sold_per_order from pizza_sales


--CHART--

--Daily Trend-- 
select datename(DW, order_date) as Order_day , count(distinct order_id) as Total_orders from pizza_sales
group by datename(DW, order_date)

--Hourly Trend-- 
select datepart(hour , order_time) as Order_hour,  count(distinct order_id) as Total_orders from pizza_sales
group by datepart(hour , order_time)
order by datepart(hour , order_time)

--Percentage Of sales by category--
select pizza_category ,sum(total_price) as Total_sales_Price_category, sum(total_price)*100 / (select sum(total_price) from pizza_sales) as Total_Percentage_sales
from pizza_sales
group by pizza_category

--Percentage Of sales by category--
select pizza_size ,cast(sum(total_price)as decimal(10,2)) as Total_sales_Price_category, cast(sum(total_price)*100 as decimal(10,2)) / (select cast(sum(total_price)as decimal(10,2)) from pizza_sales) as Total_Percentage_sales
from pizza_sales
group by pizza_size
order by Total_Percentage_sales asc

--Total Pizza Sold-- 
select pizza_category, sum(quantity) as Total_pizzas_sold from pizza_sales
group by pizza_category

--Top 5 best sellers WRT pizza sold -- 
select top 5 pizza_name, sum(quantity) as Total_pizzas_sold from pizza_sales
group by pizza_name
order by sum(quantity) desc



