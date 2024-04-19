-- 1 Уровень сложности: Создать базу данных airport:
-- https://github.com/NelliEfr/MySQL_databases/blob/main/airport.txt

use airport;

-- 1. 
-- Посчитать количество рейсов по каждой модели самолета. Вывести modelname и flightcount.
select t1.model_name, count(t2.id) as flight_count
from airliners t1
join trips t2
on t1.id = t2.airliner_id
group by t1.model_name;


-- 2. Вычислить среднюю стоимость билета по классам обслуживания.
-- Вывести serviceclass и averageprice.
select t1.service_class, avg(t2.price) as average_price
from tickets t1
join tickets t2 -- SELF JOIN
on t1.id = t2.id
group by t1.service_class;

-- Другой вариант
select service_class, avg(price) as average_price 
from tickets
group by service_class;


-- 3. Определить средний возраст клиентов, сгруппированных по классу обслуживания.
-- Вывести serviceclass и averageage.
select t1.service_class, avg(t2.age) as average_age
from tickets t1
join clients t2
on t1.client_id = t2.id
group by t1.service_class;


-- 4. Получить общее количество билетов, купленных каждым клиентом.
-- Вывести name и ticket_count.
select t2.name, count(t1.id) as ticket_count
from tickets t1
join clients t2
on t1.client_id = t2.id
group by t2.id
order by t2.name;


-- 5. Определить количество рейсов, отправленных из каждого аэропорта.
-- Вывести departure и departure_count.
select departure, count(trip_code) as departure_count 
from trips
group by departure
order by departure;


-- 6. Вычислить общий доход от продажи билетов для каждой страны - владельца/арендатора самолетов.
-- Вывести country и total_sum.
select t1.country, sum(t2.price) as total_sum
from airliners t1
join trips t3
on t1.id = t3.airliner_id
join tickets t2
on t3.id = t2.trip_id
group by t1.country;
