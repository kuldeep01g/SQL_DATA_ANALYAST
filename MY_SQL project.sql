create table retail_store(
transactions_id int,
sale_date date,
sale_time time,
customer_id int,
gender varchar(25),
age int,
category varchar(20),
quantiy int,
price_per_unit float,
cogs float,
total_sale float);

desc retail_store;

select *from retail_store;

select count(*) from retail_store;

select count(distinct customer_id)	as total_sale from retail_store;

select count(distinct category)	as total_sale from retail_store;

select distinct category from retail_store;


select *from retail_store where transactions_id is null;
 
 select *from retail_store where cogs is null;
 
 -- data Analysisi and Bussiness problems
 select *from retail_store where sale_date='2022-11-05';

select category,sum(total_sale) as net_sale ,count(*) as tota_sale from 	retail_store group by 1;

select round(avg(age),2) as avg from retail_store where category='Beauty';

select *from retail_store where total_sale>1000;

select  category,gender ,count(*) as Total_sale from 	retail_store group by gender,category order by Total_sale desc;

select *from retail_store;

select category,gender,count(*) from retail_store group by category,gender;

select sale_date,gender ,count(*) from retail_store group by sale_date,gender;

select age,gender,count(*) from retail_store group by  age,gender;

select count(distinct(age)) from retail_store ;

select category,gender,count(*) from retail_store group by  category,gender order by 1;

-- caluclate sale by month and year wise
select *from retail_store;

-- --------------------------------------


select
extract(year from sale_date) as year,
extract(month from sale_date) as month,
avg(total_sale) as avg_sale,
rank() over (partition by extract(year from sale_date) order by avg(total_sale) desc) as rank_of_Sales
from retail_store
group by 1,2

-- --- it gives the rank one avilable data and above one give the all data with rank
select *from
(
select
extract(year from sale_date) as year,
extract(month from sale_date) as month,
avg(total_sale) as avg_sale,
rank() over (partition by extract(year from sale_date) order by avg(total_sale) desc) as rank_of_Sales
from retail_store
group by 1,2) as t2
where rank_of_Sales=1

-- ----------------------------------------

select *from retail_store;

	select customer_id , sum(total_sale) as total_Sales
	from retail_store
	group by 1
	order by 2 desc
	limit 5
    
    -- find the number of unique cutomers who purchased  items 	 each category
    
    select *from retail_store
    
    select category,count(distinct customer_id) as cnt_Unique_Customers
    from retail_store
    group by category
    
    --  find the sale time if <12-> morning and 12 and 17 is afternoon and else evening
    
    select *,
    case 
    when extract (hour from sale_time) < 12 then 'Morning'
    when extract (hour from sale_time)  between 12 and 17 then 'Afternoon'
    else 'Evening'
    end  as Shift
     from retail_store
     
     SELECT *,
    CASE 
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Shift
FROM retail_store;

    