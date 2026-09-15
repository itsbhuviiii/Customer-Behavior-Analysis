SELECT * FROM cust_behavior;
use customercust_behavior
select sum(purchase_amount), gender from cust_behavior group by gender;
select customer_id, purchase_amount from cust_behavior where discount_applied = 'Yes' AND purchase_amount> (select avg(purchase_amount) from cust_behavior);
select item_purchased, round(avg(review_rating),2) as "Average Product Rating" from cust_behavior group by item_purchased order by avg(review_rating) desc limit 5;
select shipping_type, avg(purchase_amount) as "Average Purchase Amount" from cust_behavior where shipping_type in ("Standard", "Express") group by shipping_type;
select avg(purchase_amount) as "Average_Revenue", sum(purchase_amount) as "Total_Revenue", subscription_status from cust_behavior group by subscription_status order by Total_Revenue desc;
select item_purchased, (sum((case when discount_applied= "Yes" then 1 else 0 end)) / count(*) ) * 100 as 'discount_percentage' from cust_behavior group by item_purchased order by discount_percentage desc limit 5;

select (case when previous_purchases= 1 then "New" when previous_purchases >=2 AND previous_purchases <=10 then "Returning" else "Loyal" end) as customer_type , count(*) from cust_behavior
group by customer_type;

with product_ranking as (select item_purchased, category, count(*) as total_orders, row_number() over( partition by category order by count(*) desc) as product_rank from cust_behavior group by category,item_purchased)
select category, item_purchased, total_orders, product_rank from product_ranking where product_rank<=3;

select count(customer_id) as repeat_buyers, subscription_status from cust_behavior where previous_purchases > 5 group by subscription_status; 

select sum(purchase_amount) as revenue, age_group from cust_behavior group by age_group order by revenue desc;

SHOW tables;