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

--Query 2
select distinct o2.pid 
from orders o
inner join customers c
	on c.cid = o.cid
inner join orders o2
	on o2.aid = o.aid and c.city = 'Kyoto'
order by pid asc;

