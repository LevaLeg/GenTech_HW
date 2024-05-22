-- Создать новую базу данных.
-- Скачать таблицы из этой папки:
-- https://github.com/annykh/GenTech-220823/tree/main/OE
-- Имортировать таблицы в базу:
-- Правой кнопкой нажать на новую базу данных, выбрать Table data import wizard -> browse -> выбрать таблицу -> open -> все время next… -> finish

SELECT * FROM new_db.customers;
use new_db;


-- 1. Вывести имя, фамилию пользователей и даты их заказов(order_date).
select t1.cust_first_name as name_, t1.cust_last_name as last_name, t2.order_date
from customers t1
join orders t2
on t1.customer_id = t2.customer_id;


-- 2. Вывести даты заказов продуктов и описание этих продуктов (product_description).
select t1.order_date as date_of_order, t2.product_description as description_
from orders t1
join order_items t3
on t1.order_id = t3.order_id
join product_information t2
on t2.product_id = t3.product_id;


-- 3.
-- Вывести имя, фамилию пользователей, даты заказов (orderdate),
-- описание продуктов, которые они заказали и категории соответствующих продуктов (categoryname).

select t1.cust_first_name as name_, t1.cust_last_name as last_name, t2.order_date, t3.PRODUCT_DESCRIPTION, t4.category_name
from customers t1
join orders t2
on t1.customer_id = t2.customer_id
join product_information t3
on t2.customer_id = t3.customer_id
join categories_tab t4
on t3.CATEGORY_ID = t4.category_id
join order_items t5
on t5.order_id = t2.order_id;


-- 4.
-- Вывести названия (productname), описания категорий (categorydescription)
-- и количества (quantity) тех продуктов, у которых минимальная стоимость (min_price) больше 300.

select t3.product_name, t4.category_description, t5.quantity
from product_information t3
join categories_tab t4
on t3.category_id = t4.category_id
join order_items t5
on t5.product_id = t3.product_id
where t3.min_price > 300;


-- 5.
-- Вывести имя, фамилию покупателей, которые купили принтеры. 
select t1.cust_first_name, t1.cust_last_name
from customers t1
join orders t2
on t1.customer_id = t2.customer_id
join order_items t3
on t2.order_id = t3.order_id
join product_information t4
on t3.product_id = t4.product_id
join categories_tab t5
on t4.category_id = t5.category_id
where t5.category_description = 'printers';


-- 6.
-- Вывести имя, фамилию всех женатых мужчин покупателей,
-- которые покупали продукты со стоимостью (list_price) больше 550.

select t1.cust_first_name, t1.cust_last_name
from customers t1
join orders t2
on t1.customer_id = t2.customer_id
join order_items t3
on t2.order_id = t3.order_id
join product_information t4
on t3.product_id = t4.product_id
where t1.marital_status = 'married' and t1.gender = 'M' and t4.list_price > 550;
