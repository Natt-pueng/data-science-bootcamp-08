.open restaurant.db
create table if not exists customers (id int, name text, gender text, city text);
insert into customers values
(1, "Jan", "Female","Chaingmai"),(2,"Oat","Male","Bangkok"),(3,"Tong","Male","Puket"),(4,"May","Female","Bangkok");
.table
.mode column
select * from customers;
  
create table if not exists menus(menuid int, name text, price real);

insert into menus values
  (1,'Padthai with shrimp',90), 
  (2, 'Mushroom Green Curry', 120),
 (3,'Smooties Bowl',120),
 (4,'Tuna Sandwich',70),
 (5,'Tofu curry',90),
  (6,'vegetables fried mushroom',90),
  (7,'Burger with Pork',120);
.table
.mode column
select * from menus;

create table if not exists ReceiptBill (receiptid int primary key, id int, menuid int,amount int, paymet text, receiptdate date);

insert into ReceiptBill values (1,2,5,2,'Cash','2023-01-12'),(2,1,6,3,'Cash','2023-01-22'),(3,4,4,5,'BankingApp','2023-01-23'),(4,2,7,3,'BankingApp','2023-01-24'),(5,1,4,2,'Cash','2023-01-25'),(6,1,1,1,'Cash','2023-01-26'),(7,3,1,4,'BankingApp','2023-01-27'),(8,4,2,2,'Cash','2023-01-28'),(9,2,1,2,'Cash','2023-01-29'),(10,3,1,4,'BankingApp','2023-01-30');

.table
.mode column
select * from ReceiptBill;

select * from customers;
select * from  menus;
select * from ReceiptBill;

--subquery 

select 
  name as customer_name,
  city 
from (select * from customers
  where city like "Bangkok");

 -- join 
select name, count (amount) as TopMenuofSale 
  from ReceiptBill as RE 
  join menus as M
  on RE.menuid = M.menuid 
  group by name
  order by 2 desc
  limit 3;

--Aggregate
SELECT 
	COUNT(name) AS menus_name,
    AVG(price) AS avg_price,
    SUM(price) AS sum_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM menus;

 --Find Total ReceiptBill
select 
  customers.name as name,
  customers.city as city,
  menus.name   as menu,
  menus.price * ReceiptBill.amount as total
from ReceiptBill
join customers
on ReceiptBill.id = customers.id 
join menus
on ReceiptBill.menuid = menus.menuid;

--with Find ReceiptBill payment by Cash
with sub1 as (
    select * from customers
    where city = "Bangkok"
), sub2 as (
    select * from ReceiptBill
    where paymet = 'Cash'
)
select
  sub1.name,
  sub2.receiptid
from sub1
join sub2
on sub1.id = sub2.id;
