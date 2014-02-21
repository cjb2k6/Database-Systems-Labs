--Christopher Barnett
--Lab 5

--Query 1
select a.city
from agents a
inner join orders o
	on a.aid = o.aid
inner join customers c
	on c.cid = o.cid and c.name = 'Basics'
order by city asc;

