--Query 1
select distinct c.name, p.city
from customers c, products p
where c.city = p.city and p.city in (
				select city
				from products
				group by city
				order by sum(quantity) desc
				limit 1);
--Query 2
select distinct c.name, p.city, sum(p.quantity) as "sq"
from customers c, products p
where c.city = p.city and p.city in (
				select city
				from products
				where 

--I don't know

--Query 3
select * from Products
where priceusd > (select avg(priceusd) 
		 from products)
order by pid asc;

--Query 4
select c.name, o.pid, o.dollars
from customers c, orders o
where c.cid = o.cid
order by dollars desc;

--Query 5
select c.name, coalesce(sum(o.qty),0) as "total ordered"
from customers c
left outer join orders o on c.cid = o.cid
group by c.name
order by c.name;

--Query 6
select distinct c.name, p.name, a.name
from customers c, products p, agents a, orders o
where 