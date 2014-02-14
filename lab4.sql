--Christopher Barnett
--2/13/14
--Lab 4

--Query 1
select distinct city
from agents
where aid in  (select aid
		from orders
		where cid in (select cid
				from customers
				where name = 'Basics')
				)
order by city asc;

