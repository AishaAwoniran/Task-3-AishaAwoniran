create database Internship_Project

use internship_project

--Retrieving all records
select * 
from Ecommercedata;

--data cleaning

select *
from Ecommercedata
where CouponCode is null;
--309 null

update Ecommercedata
set CouponCode = 'None'
where CouponCode is null;

--Orders above average 
select * 
from Ecommercedata
where TotalPrice >
(
select AVG(TotalPrice)
from Ecommercedata
);
-- 491 orders are above average

--Delivered Orders Only

select *
from Ecommercedata
where OrderStatus = 'delivered';

--231 out of 1200 orders have been delivered

--Orders paid with debit card

select *
from Ecommercedata
where PaymentMethod = 'credit card';
--234 orders paid with credit card

					--Order by sorting

	--Highest value orders
select top 10 OrderID, TotalPrice
from Ecommercedata
order by TotalPrice desc;

	--Lowest value orders
select top 10 OrderID, TotalPrice
from Ecommercedata
order by TotalPrice asc;

					-- Group by (business insight)

	--Revenue by products
select Product,
	SUM(totalprice) as Revenue
from Ecommercedata
group by Product
order by Revenue desc;

	--Orders by payment method
select PaymentMethod,
	COUNT(orderid) as countoforder
from Ecommercedata
group by PaymentMethod
order by countoforder desc;

	--Orders by referral source
select ReferralSource,
	COUNT(orderid) countofref
from Ecommercedata
group by ReferralSource
order by countofref desc;

				-- AGGREGATIONS

	--Total Revenue
select 
	SUM(totalprice) as Total_Revenue
from Ecommercedata;
-- Total revenue is 1,264,761.96

	--Average order value
select
	AVG(totalprice) as Avg_order_value
from Ecommercedata;
--Average order value is 1053.97

	--Maximum order value
select 
	MAX(totalprice) as Max_order_value
from Ecommercedata;
--Maximum order value is 3456.40

	--Minimum order value
select
	MIN(totalprice) as Min_order
from Ecommercedata;
-- minimum order is 11.39

	--No of customers
select
	COUNT(distinct CustomerID) as Customers
from Ecommercedata;
--Number of customers is 1189
