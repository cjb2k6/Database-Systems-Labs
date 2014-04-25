-----------------------------
-- TABLE CREATE STATEMENTS --
-----------------------------

-- People --
CREATE TABLE people (
  pid      	 char(4) not null,
  first_Name 	 text,
  last_Name 	 text,
  street_address text,
  city           text,
  state   	 char(2),
  zip   	 char(5),
  birth_Date	 date,
 primary key(pid)
);

-- Customers --
CREATE TABLE customers (
  cid          char(4) not null references people(pid),
  date_Entered date,
 primary key(cid)
);

-- Employees--
CREATE TABLE employees (
  eid          char(4) not null references people(pid),
  date_hired   date,
 primary key(eid)
);

-- Platforms --
CREATE TABLE platforms (
  platID      char(4) not null,
  name        text,
  description text,
 primary key(platID)
);

-- Products --
CREATE TABLE products (
  prodID        char(4) not null,
  name          text,
  description   text,
  newQty 	int,
  usedQty 	int,
 primary key(prodID)
);

-- Games --
 CREATE TABLE games (
  prodID 	char(4) not null references products(prodID),
  platID 	char(4) not null references platforms(platID),
  release_date  date not null,
  genre  	text,
  developer 	text,
  publisher 	text,
  ESRB 		char(3),
  online_play 	boolean,
  dlc 		boolean,
 primary key(prodID, platID, release_date)
);

-- Accessories --
 CREATE TABLE accessories (
  prodID 	char(4) not null references products(prodID),
  platID 	char(4) not null references platforms(platID),
  manufacturer  text,
  type	 	text,
 primary key(prodID, platID)
);

-- Consoles --
 CREATE TABLE consoles (
  prodID 	char(4) not null references products(prodID),
  generation 	int,
  manufacturer  text,
 primary key(prodID)
);

-- Prices --
 CREATE TABLE prices (
  prodID        char(4) not null references products(prodID),
  new_priceUSD  numeric(12,2), 
  used_priceUSD numeric(12,2),
 primary key(prodID)
);

-- TradeInValues --
 CREATE TABLE tradeinvalues (
  prodID 	       char(4) not null references products(prodID),
  good_shape_valueUSD  numeric(12,2),
  poor_shape_valueUSD  numeric(12,2),
 primary key(prodID)
);

-- Orders --
 CREATE TABLE orders (
  cid        char(4) not null references customers(cid),
  eid        char(4) not null references employees(eid),
  prodID     char(4) not null references products(prodID),
  time_stamp timestamp without time zone not null, 
  quantity   int not null,
 primary key(cid, eid, prodID, time_stamp)
);

-- Trade-Ins --
 CREATE TABLE tradeins (
  cid        char(4) not null references customers(cid),
  eid        char(4) not null references employees(eid),
  prodID     char(4) not null references products(prodID),
  time_stamp timestamp without time zone not null, 
  quantity   int not null,
 primary key(cid, eid, prodID, time_stamp)
);

---------------
-- TEST DATA --
---------------

-- People --
INSERT INTO people( pid, first_Name, last_Name, street_address, city, state, zip, birth_date)
  VALUES('p001', 'Jason', 'Smith', '123 Fake St.', 'Poughkeepsie', 'NY', '12603', '1953-05-16');

INSERT INTO people(  pid, first_Name, last_Name, street_address, city, state, zip, birth_date)
 VALUES('p002', 'Pierce', 'Brosnan', '40 Real St.', 'Wappinger Falls', 'NY', '12590', '1982-07-12');

INSERT INTO people(  pid, first_Name, last_Name, street_address, city, state, zip, birth_date)
 VALUES('p003', 'Bob', 'Smith', '300 Fake Rd.', 'Somewhere', 'CA', '90000', '1992-12-21');

INSERT INTO people(  pid, first_Name, last_Name, street_address, city, state, zip, birth_date)
 VALUES('p004', 'Donald', 'Jump', '80 Real Rd.', 'Wappinger Falls', 'NY', '12590', '2006-07-12');

INSERT INTO people(  pid, first_Name, last_Name, street_address, city, state, zip, birth_date)
 VALUES('p005', 'Jet', 'Black', '33 Bebop St.', 'Nowhere', 'RI', '00000', '1989-09-25');

INSERT INTO people(  pid, first_Name, last_Name, street_address, city, state, zip, birth_date)
 VALUES('p006', 'Cave', 'Johnson', '1 Aperture St.', 'Poughkeepse', 'NY', '12601', '1942-01-01');

-- Customers --
INSERT INTO customers( cid, date_entered)
  VALUES('p001', '2010-05-16');

INSERT INTO customers( cid, date_entered)
  VALUES('p002', '2011-01-12');

INSERT INTO customers( cid, date_entered)
  VALUES('p003', '2011-02-27');

INSERT INTO customers( cid, date_entered)
  VALUES('p004', '2011-05-06');

INSERT INTO customers( cid, date_entered)
  VALUES('p005', '2012-10-31');

-- Employees --
INSERT INTO employees( eid, date_hired)
  VALUES('p001', '2010-06-16');

INSERT INTO employees( eid, date_hired)
  VALUES('p002', '2011-02-12');

INSERT INTO employees( eid, date_hired)
  VALUES('p006', '2012-08-02');

-- Platforms --
INSERT INTO platforms( platid, name, description)
  VALUES('NES', 'Nintendo Entertainment System', 'First home video game console released by Nintendo.');

INSERT INTO platforms( platid, name, description)
  VALUES('SNES', 'Super Nintendo Entertainment System', 'Second home video game console released by Nintendo.');

INSERT INTO platforms( platid, name, description)
  VALUES('N64', 'Nintendo 64', 'Third home video game console released by Nintendo.');

INSERT INTO platforms( platid, name, description)
  VALUES('X360', 'Xbox 360', 'Second home video game console released by Microsoft.');

INSERT INTO platforms( platid, name, description)
  VALUES('PS3', 'Playstation 3', 'Third home video game console released by Sony.');

INSERT INTO platforms( platid, name, description)
  VALUES('DC', 'Sega Dreamcast', 'The best thing ever.');

-- Products --
INSERT INTO products( prodid, name, description, newqty, usedqty)
  VALUES('0001', 'Super Mario Bros.', 'A classic platforming game.', 0, 3);

INSERT INTO products( prodid, name, description, newqty, usedqty)
 VALUES('0002', 'Final Fantasy VI', 'An iconic RPG', 0, 1);

INSERT INTO products( prodid, name, description, newqty, usedqty)
  VALUES('0003', 'Super Smash Bros', 'The original Smash Bros. game.', 0, 2);

INSERT INTO products( prodid, name, description, newqty, usedqty)
  VALUES('0004', 'Portal 2', 'A first person puzzle game.', 10, 2);

INSERT INTO products( prodid, name, description, newqty, usedqty)
  VALUES('0005', 'Metal Gear Solid HD Collection', 'A combination of several classic Metal Gear Solid games in HD.', 20, 4);

INSERT INTO products( prodid, name, description, newqty, usedqty)
  VALUES('0006', 'Sonic Adventure', 'A 3D platformer.', 0, 2);

INSERT INTO products( prodid, name, description, newqty, usedqty)
  VALUES('0007', 'Xbox 360 Wireless Controller', 'Wireless Game Controller.', 10, 3);

INSERT INTO products( prodid, name, description, newqty, usedqty)
  VALUES('0008', 'Playstation 4', 'The latest console from Sony', 1, 0);

INSERT INTO products( prodid, name, description, newqty, usedqty)
  VALUES('0009', 'Xbox One', 'The latest console from Microsoft.', 20, 10);

-- Games --
INSERT INTO games( prodid, platid, release_date, genre, developer, publisher, ESRB, online_play, dlc)
  VALUES('0001', 'NES', '1985-09-13', 'Platforming', 'Nintendo', 'Nintendo', 'E', false, false);

INSERT INTO games( prodid, platid, release_date, genre, developer, publisher, ESRB, online_play, dlc)
  VALUES('0002', 'SNES', '1994-08-20', 'Role-playing', 'Square', 'Square', 'E10', false, false);

INSERT INTO games( prodid, platid, release_date, genre, developer, publisher, ESRB, online_play, dlc)
  VALUES('0003', 'N64', '1999-04-26', 'Fighting', 'HAL Laboratory', 'Nintendo', 'E', false, false);

INSERT INTO games( prodid, platid, release_date, genre, developer, publisher, ESRB, online_play, dlc)
  VALUES('0004', 'X360', '2011-04-19', 'Puzzle', 'Valve', 'Valve', 'E10', true, true);

INSERT INTO games( prodid, platid, release_date, genre, developer, publisher, ESRB, online_play, dlc)
  VALUES('0005', 'PS3', '2011-11-08', 'Action Adventure', 'Kojima Productions', 'Konami', 'M', false, false);

INSERT INTO games( prodid, platid, release_date, genre, developer, publisher, ESRB, online_play, dlc)
  VALUES('0006', 'DC', '1999-12-23', 'Platformer', 'Sonic Team', 'Sega', 'E', false, false);
  
-- Accessories --
INSERT INTO accessories( prodid, platid, manufacturer, type)
  VALUES('0007', 'X360', 'Microsoft', 'Controller');

-- Consoles --
INSERT INTO consoles( prodid, generation, manufacturer)
  VALUES('0008', 8, 'Sony');

INSERT INTO consoles( prodid, generation, manufacturer)
  VALUES('0009', 8, 'Microsoft');

-- Prices --
INSERT INTO prices( prodid, new_priceUSD, used_priceUSD)
  VALUES('0001', 100.00, 20.00);

INSERT INTO prices( prodid, new_priceUSD, used_priceUSD)
  VALUES('0002', 70.00, 30.00);

INSERT INTO prices( prodid, new_priceUSD, used_priceUSD)
  VALUES('0003', 60.00, 30.00);

INSERT INTO prices( prodid, new_priceUSD, used_priceUSD)
  VALUES('0004', 40.00, 20.00);

INSERT INTO prices( prodid, new_priceUSD, used_priceUSD)
  VALUES('0005', 40.00, 25.00);

INSERT INTO prices( prodid, new_priceUSD, used_priceUSD)
  VALUES('0006', 70.00, 20.00);

INSERT INTO prices( prodid, new_priceUSD, used_priceUSD)
  VALUES('0007', 50.00, 25.00);

INSERT INTO prices( prodid, new_priceUSD, used_priceUSD)
  VALUES('0008', 400.00, 380.00);

INSERT INTO prices( prodid, new_priceUSD, used_priceUSD)
  VALUES('0009', 500.00, 480.00);

--TradeInValues--
INSERT INTO tradeinvalues( prodid, good_shape_valueUSD, poor_shape_valueUSD)
  VALUES('0001', 20.00, 10.00);

INSERT INTO tradeinvalues( prodid, good_shape_valueUSD, poor_shape_valueUSD)
  VALUES('0002', 20.00, 10.00);

INSERT INTO tradeinvalues( prodid, good_shape_valueUSD, poor_shape_valueUSD)
  VALUES('0003', 15.00, 9.00);

INSERT INTO tradeinvalues( prodid, good_shape_valueUSD, poor_shape_valueUSD)
  VALUES('0004', 7.00, 5.00);

INSERT INTO tradeinvalues( prodid, good_shape_valueUSD, poor_shape_valueUSD)
  VALUES('0005', 6.00, 4.00);

INSERT INTO tradeinvalues( prodid, good_shape_valueUSD, poor_shape_valueUSD)
  VALUES('0006', 20.00, 10.00);

INSERT INTO tradeinvalues( prodid, good_shape_valueUSD, poor_shape_valueUSD)
  VALUES('0007', 11.00, 7.00);

INSERT INTO tradeinvalues( prodid, good_shape_valueUSD, poor_shape_valueUSD)
  VALUES('0008', 180.00, 125.00);

INSERT INTO tradeinvalues( prodid, good_shape_valueUSD, poor_shape_valueUSD)
  VALUES('0009', 180.00, 125.00);

-- Orders --
INSERT INTO orders( cid, eid, prodid, time_stamp, quantity)
  VALUES('p001', 'p002', '0009', now(), 1);

INSERT INTO orders( cid, eid, prodid, time_stamp, quantity)
  VALUES('p002', 'p006', '0003', now(), 1);

INSERT INTO orders( cid, eid, prodid, time_stamp, quantity)
  VALUES('p005', 'p001', '0006', now(), 1);
  
-- Trade-Ins --
INSERT INTO tradeins( cid, eid, prodid, time_stamp, quantity)
  VALUES('p003', 'p002', '0005', now(), 1);

INSERT INTO tradeins( cid, eid, prodid, time_stamp, quantity)
  VALUES('p004', 'p006', '0007', now(), 1);

-----------
-- Views --
-----------
create view oldGameInventory as
select p.prodid as Product_ID, p.name as Game, p.newQty as New_Copies, p.usedQty as Used_Copies,
       plat.name as Platform, g.publisher as Publisher, g.release_date 
from products p, platforms plat, games g
where p.prodid = g.prodid
  and g.platID = plat.platid
  and g.release_date < '2000-01-01'


-----------------------
-- Stored Procedures --
-----------------------

create function getAge(char(4)) returns integer as
$$
declare
   personID  char(4)  := $1;
   age integer;
   
begin 
   select extract(year from age((select birth_date
				 from people
				 where pid = personID))) into age;
   return age;
end;
$$ 
language plpgsql;


--------------
-- Triggers --
--------------
--Check if customer is at least 17 years old for buying mature games
create or replace function matureGame() returns trigger as $mature_game$
declare
	age integer;
	rating char(3);
begin
	select getAge(new.cid) into age;
	
	select ESRB
	from games
	where games.prodid = new.prodid into rating;
	
	if  age < 17 and rating = 'M'
	then
	   raise exception 'This customer is under 17 and cannot purchase Mature games.';
	end if;
	return new;
end;
$mature_game$ language plpgsql;

create trigger mature_game before insert or update on orders
	for each row execute procedure matureGame();



