-- 🔹 BASIC JOINS

-- Show all orders with customer name
select c.c_name, o.o_id, o.order_date
from ordersp o
join customersp c on o.c_id = c.c_id;


-- Show order details with product names
select p.p_name, od.o_id, od.quantity
from orderdetailssp od
join productsp p on od.p_id = p.p_id;


-- 🔹 FULL REPORT

-- Full order report
select c.c_name, p.p_name, o.o_id, od.quantity
from customersp c
join ordersp o on c.c_id = o.c_id
join orderdetailssp od on o.o_id = od.o_id
join productsp p on od.p_id = p.p_id;


-- 🔹 AGGREGATE QUERIES

-- Total amount per order
select o.o_id,
sum(p.price * od.quantity) as total_amount
from ordersp o
join orderdetailssp od on o.o_id = od.o_id
join productsp p on od.p_id = p.p_id
group by o.o_id;


-- Top 5 expensive products
select * from productsp
order by price desc
limit 5;


-- Total spending per customer
select c.c_name,
sum(p.price * od.quantity) as total_spent
from customersp c
join ordersp o on c.c_id = o.c_id
join orderdetailssp od on o.o_id = od.o_id
join productsp p on od.p_id = p.p_id
group by c.c_name;


-- Most sold product
select p.p_name,
sum(od.quantity) as total_sold
from orderdetailssp od
join productsp p on od.p_id = p.p_id
group by p.p_name
order by total_sold desc
limit 1;


-- Customers with more than 1 order
select c.c_name, count(o.o_id) as total_orders
from customersp c
join ordersp o on c.c_id = o.c_id
group by c.c_name
having count(o.o_id) > 1;


-- Highest value order
select o.o_id,
sum(p.price * od.quantity) as total
from ordersp o
join orderdetailssp od on o.o_id = od.o_id
join productsp p on od.p_id = p.p_id
group by o.o_id
order by total desc
limit 1;
