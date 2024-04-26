use shop;

select * from customers;
select * from orders;

-- 1. Найти общую сумму заказов для каждого клиента.
select customers.CNAME, sum(orders.AMT) as total_sum_of_orders
from customers
join orders
where customers.CUST_ID = orders.CUST_ID
group by customers.CNAME;

-- 2. Получить количество заказов для каждого продавца.
select tab1.sname, count(tab2.sell_id) as orders_count
from sellers tab1
join orders tab2
where tab1.sell_id = tab2.sell_id
group by tab1.sname
order by orders_count desc;

-- 3. Получить количество клиентов с рейтингом выше среднего.*
select count(rating) as vip_clients, rating
from customers group by rating
having rating > (select avg(rating) from customers);

-- 4. Получить количество клиентов в каждом городе с рейтингом выше 200.
select count(cname) as vip, rating, city
from customers
group by rating, city
having rating > 200;

-- 5. Получить количество заказов, сделанных в каждый месяц.
select count(order_id) as orders_amount, odate
from orders
group by odate;

-- 6. Найти клиентов, у которых сумма заказов превышает среднюю сумму заказов всех клиентов.
select tab1.cname as vip, sum(tab2.amt) as sum
from customers tab1
join orders tab2
where tab1.cust_id = tab2.cust_id
group by tab1.cname
having sum(tab2.amt) > (select avg(amt) from orders);
