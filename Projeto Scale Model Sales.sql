SELECT * FROM orders;
SHOW tables
DESCRIBE tables

/** Question to be answered **/
/** The number of products sold by category and by month, with comparison and rate of change compared to the same month of the previous year.**/

SELECT * FROM products;

/** By observing the available data we can classify the products by the following categories: 
1- product line (if it is a car, airplane, boat)
2- product scale (smallest to biggest, from 1:700 to 1:10)
3 -product vendor (basically the distributor) **/

/** Afterwards lets have a look at the monhtly sales figures **/

SELECT*FROM orders;

SELECT*FROM orders WHERE comments IS NOT NULL;

SELECT COUNT(*) FROM orders;

SELECT COUNT(*) FROM orders WHERE shippedDate BETWEEN '2021-01-01' AND '2021-12-31';

SELECT COUNT(*) FROM orders WHERE comments IS NOT NULL;

/** There are 283 orders in total. In 2021 there were 110, in 2022 there were 173**/

SELECT COUNT(*) FROM orders WHERE status = 'Shipped' AND shippedDate BETWEEN '2021-01-01' AND '2021-12-31';

SELECT COUNT(*) FROM orders WHERE status = 'Shipped' AND shippedDate BETWEEN '2022-01-01' AND '2022-12-31';

/**--------------------------------------------------------------------------------------------------------------**/

/** In 2021, there have been 108 shipped orders. In 2022 there have been 145 shipped orders**/

SELECT COUNT(*) FROM orders WHERE status = 'Cancelled' AND shippedDate BETWEEN '2021-01-01' AND '2021-12-31';

SELECT COUNT(*) FROM orders WHERE status = 'Cancelled' AND shippedDate BETWEEN '2022-01-01' AND '2022-12-31';

/**--------------------------------------------------------------------------------------------------------------**/

SELECT COUNT(*) FROM orders WHERE status = 'On Hold' AND shippedDate BETWEEN '2021-01-01' AND '2021-12-31';

SELECT COUNT(*) FROM orders WHERE status = 'On Hold' AND shippedDate BETWEEN '2021-01-01' AND '2021-12-31';

/**--------------------------------------------------------------------------------------------------------------**/

SELECT COUNT(*) FROM orders WHERE status = 'Resolved' AND shippedDate BETWEEN '2021-01-01' AND '2021-12-31';

SELECT COUNT(*) FROM orders WHERE status = 'Resolved' AND shippedDate BETWEEN '2021-01-01' AND '2021-12-31';

/**--------------------------------------------------------------------------------------------------------------**/

SELECT*FROM orders;

SELECT*FROM orderdetails;

/**-------------------------------------------------- EXEMPLO LOUIS ABAIXO- NÃO ACCIONAR---------------------------------------------------------------------**/
-- Finance 1 - Number of Command and the total ammount due per customerNumber
select c.country, # select the country because we want to see the amount per country
sum(od.quantityOrdered*od.priceEach) as amount_due, # calculate the amount (quantityOrdered * priceEach) to every orderLineNumber and then sum it (the idea is then to group it per country)
count(od.orderNumber) as Number_of_orders  #count the number of orders (the idea is then to group it per country)
from orderdetails as od 
inner join orders as o on o.orderNumber = od.orderNumber 
inner join customers as c on o.customerNumber = c.customerNumber
where o.orderDate >=  (NOW() - INTERVAL 2 MONTH)  # I want only the last two months
group by c.country; # I want to get the information per country 
/**-------------------------------------------------- EXEMPLO LOUIS ACIMA- NÃO ACCIONAR---------------------------------------------------------------------**/


SELECT*FROM orders; # In this table we can see the orders present in every year (2021,2022,2023)

SELECT COUNT(*) as total_orders_2021 FROM orders WHERE YEAR (orderDate) = 2021;
SELECT COUNT(*) as total_orders_2022 FROM orders WHERE YEAR (orderDate) = 2022;
SELECT COUNT(*) as total_orders_2023 FROM orders WHERE YEAR (orderDate) = 2023;

 /** In this phase we expanded the table "Order Details" so that we can see both sales numbers and sales quantities (by date) within the same table**/
SELECT month(orderDate), year(orderDate), sum(orderdetails.quantityOrdered*orderdetails.priceEach), productLine FROM orders
JOIN orderdetails ON orders.ordernumber = orderdetails.ordernumber
JOIN products ON orderdetails.productCode = products.productCode
GROUP BY year(orderDate), month(orderDate), productLine;

/** Here we will modify the table in order to include the exchange rates per category**/

with aggregated_data as (
    select month(o.orderDate)                       as month
    , year(o.orderDate)                             as year
    , sum(d.quantityOrdered * d.priceEach)           as sales
    , p.productLine                                 as productLine
    from orders o
    join orderdetails d on o.orderNumber = d.orderNumber
    join products p on d.productCode = p.productCode
    group by month(o.orderDate), year(o.orderDate), p.productLine  

)
select currentYear.month as month
, currentYear.year as year
, currentYear.sales as sales
, currentYear.productLine  as productLine
, lastYear.sales as last_year_sales
, if(lastYear.sales is null or lastYear.sales = 0 , 0, 
(((currentYear.sales - lastYear.sales) / lastYear.sales) *100) ) as exchange_Rate
from aggregated_data currentYear
left join aggregated_data lastYear on currentYear.month = lastYear.month 
                    and currentYear.year -1 = lastYear.year
                    and currentYear.productLine = lastYear.productLine
                    
/** In comparison with the year of 2021 (the previous table uses the previous year as reference year)**/

with aggregated_data as (
    select month(o.orderDate)                       as month
    , year(o.orderDate)                             as year
    , sum(d.quantityOrdered * d.priceEach)           as sales
    , p.productLine                                 as productLine
    from orders o
    join orderdetails d on o.orderNumber = d.orderNumber
    join products p on d.productCode = p.productCode
    group by month(o.orderDate), year(o.orderDate), p.productLine  

)
select currentYear.month as month
, currentYear.year as year
, currentYear.sales as sales
, currentYear.productLine  as productLine
, referenceYear.year as Reference_Year
, referenceYear.sales as reference_Year_sales
, if(referenceYear.sales is null or referenceYear.sales = 0 , 0, 
(((currentYear.sales - referenceYear.sales) / referenceYear.sales) *100) ) as exchange_Rate
from aggregated_data currentYear
left join aggregated_data referenceYear on currentYear.month = referenceYear.month 
                    and 2021 = referenceYear.year
                    and currentYear.productLine = referenceYear.productLine
