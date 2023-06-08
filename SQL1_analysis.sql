-- 1. What are the details of all cars purchased in the year 2022?
select c.make,c.type,c.style,c.cost_$ as Cost,Year(s.purchase_date) as Year from cars as c
inner join sales as s
on c.car_id=s.car_id
where year(s.purchase_date)=2022;

-- 2. What is the total number of cars sold by each salesperson?
select sp.name,count(s.sale_id) as Cars_sold from sales as s
join salespersons as sp
on s.salesman_id=sp.salesman_id
group by sp.name
order by Cars_sold desc;

-- 3. What is the total revenue generated by each salesperson?
select sp.name,sum(c.cost_$) as Total_Revenue from cars as c
inner join sales as s
on s.car_id=c.car_id
inner join salespersons as sp
on sp.salesman_id=s.salesman_id
group by sp.name
order by Total_Revenue desc;

-- 4. What are the details of the cars sold by each salesperson?
select sp.name,c.make,c.type,c.style from cars as c
inner join sales as s
on s.car_id=c.car_id
inner join salespersons as sp
on sp.salesman_id=s.salesman_id
group by sp.name,c.make,c.type,c.style;

-- 5. What is the total revenue generated by each car type?
select c.type as "Car Type",sum(c.cost_$) as Revenue from cars as c
inner join sales as s
on c.car_id=s.car_id
group by c.type
order by Revenue desc;

-- 6. What are the details of the cars sold in the year 2021 by salesperson 'Emily Wong'?
select sp.name,c.make,c.type,c.style,c.cost_$ as Cost from cars as c
inner join sales as s
on s.car_id=c.car_id
inner join salespersons as sp
on sp.salesman_id=s.salesman_id
where sp.name="Emily Wong" and year(s.purchase_date)=2021;

-- 7. What is the total revenue generated by the sales of hatchback cars?
select sum(c.cost_$) as "Total Revenue" from cars as c
inner join cars as cc
on c.car_id=cc.car_id
inner join sales as s
on c.car_id=s.car_id
where c.style="Hatchback";

-- 8. What is the total revenue generated by the sales of SUV cars in the year 2022?
select c.style as "Style: SUV",sum(c.cost_$) as "Total Revenue" from cars as c
inner join cars as cc
on c.car_id=cc.car_id
inner join sales as s
on c.car_id=s.car_id
where c.style="SUV" and Year(s.purchase_date)=2022;

-- 9. What is the name and city of the salesperson who sold the most number of cars in the year 2023?
/*To know the salesperson and there sales count in the Year 2023*/
select sp.name as Name,sp.city as City,purchase_date as Date,count(*) as "Total Sales" from sales as s
inner join salespersons as sp
on s.salesman_id=sp.salesman_id
where Year(purchase_date)=2023
group by Date,sp.name,sp.city
order by "Total Sales";

/*The below query is for the Question 9.*/
select sp.name ,sp.city,count(*) as Total_Sales
from sales as s
inner join salespersons as sp
on s.salesman_id=sp.salesman_id
where Year(s.purchase_date)=2023
group by sp.name,sp.city
order by Total_Sales desc limit 1;

-- 10. What is the name and age of the salesperson who generated the highest revenue in the year 2022?
select sp.name as Name,sp.city as City, sum(c.cost_$) as "Revenue"
from cars as c
inner join sales as s
on s.car_id=c.car_id
inner join salespersons as sp
on s.salesman_id=sp.salesman_id
where Year(purchase_date)=2022
group by sp.name,sp.city
order by Revenue desc limit 1;

-- Here is the Query for the sales made by each Sales person in the Year 2022.
select sp.name,s.purchase_date,c.cost_$ from salespersons as sp
inner join sales as s
on s.salesman_id=sp.salesman_id
inner join cars as c
on c.car_id=s.car_id
where Year(purchase_date)=2022
order by sp.name asc;