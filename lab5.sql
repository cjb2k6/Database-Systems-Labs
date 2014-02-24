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

--Query 3
select distinct name
from customers
where not cid in
	(select cid
	from orders
	)
order by name asc;

--Query 4
select distinct c.name
from customers c
left outer join orders o
	on c.cid = o.cid
where o.cid is null
order by name asc;

--Query 5
select distinct c.name, a.name
from customers c, orders o, agents a
where c.cid = o.cid and a.aid = o.aid and c.city = a.city
order by c.name asc;

--Query 6
select c.name, a.name, c.city
from customers c, agents a
where c.city = a.city
order by c.name asc;

--Query 7
select distinct c.name, p.city
from customers c, products p
where c.city = p.city and p.city in (
				select city
				from products
				group by city
				order by sum(quantity) asc
				limit 1);