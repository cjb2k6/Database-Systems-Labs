
-- Create Tables --
-- People --
CREATE TABLE people (
  pid       char(4) not null,
  firstName text,
  lastName  text,
  age    integer,
 primary key(pid)
);

-- Astronauts --
CREATE TABLE astronauts (
  pid          char(4) not null references people(pid),
  yearsFlying  integer,
  golfHandicap integer,
 primary key(pid)
);

-- Engineers --
CREATE TABLE engineers (
  pid           char(4) not null references people(pid),
  highestDegree text,
  favVideoGame  text,
 primary key(pid)
);

-- Flight Control Operators --
CREATE TABLE flightControlOperators (
  pid       char(4) not null references people(pid),
  chairPref text,
  drinkPref text,
 primary key(pid)
);

-- Suppliers --
CREATE TABLE suppliers (
  supid    char(4) not null,
  name     text,
  address  text,
  payterms text,
 primary key(supid)
);

-- Parts --
CREATE TABLE parts (
  partid  char(4) not null,
  name    text,
  descrip text,
 primary key(partid)
);

-- Systems --
CREATE TABLE systems (
  systemid char(4) not null,
  name     text,
  descrip  text,
 primary key(systemid)
);

-- Spacecrafts --
CREATE TABLE spacecrafts (
  scid        char(4) not null,
  name         text,
  tailnum      text,
  weightTONS   numeric(4,2),
  fuelType     text,
  crewCapacity integer,
 primary key(scid)
);
-- Crew --
 CREATE TABLE crew (
  pid char(4) not null references astronauts(pid),
  scid char(4) not null references spacecrafts(scid),
 primary key(pid, scid)
);

-- Spacecraft Systems --
 CREATE TABLE spaceCraftSystems (
  scid char(4) not null references spacecrafts(scid),
  systemid char(4) not null references systems(systemid),
 primary key(scid, systemid)
);

-- System Parts --
 CREATE TABLE sysParts (
  partid char(4) not null references parts(partid),
  systemid char(4) not null references systems(systemid),
 primary key(partid, systemid)
);

-- Catalog --
 CREATE TABLE catalog (
  partid char(4) not null references parts(partid),
  supid char(4) not null references suppliers(supid),
 primary key(partid, supid)
);

--------------------------------------------------------

-- Test Data --

-- People --
INSERT INTO people( pid, firstName, lastName, age)
  VALUES('p001', 'Sean', 'Connery', 80);

INSERT INTO people( pid, firstName, lastName, age)
 VALUES('p002', 'Pierce', 'Brosnan', 50);

INSERT INTO people( pid, firstName, lastName, age)
 VALUES('p003', 'Bob', 'Smith', 30);

INSERT INTO people( pid, firstName, lastName, age)
 VALUES('p004', 'Some', 'Britishguy', 40);

INSERT INTO people( pid, firstName, lastName, age)
 VALUES('p005', 'Jet', 'Black', 35);

INSERT INTO people( pid, firstName, lastName, age)
 VALUES('p006', 'Alec', 'Trevelyan', 40);

-- Engineers --
INSERT INTO engineers( pid, highestDegree, favVideoGame)
  VALUES('p001', 'BS', 'Portal');

INSERT INTO engineers( pid, highestDegree, favVideoGame)
  VALUES('p002', 'BS', 'GoldenEye');

-- Flight Control Operators --
INSERT INTO flightcontroloperators( pid, chairPref, drinkPref)
  VALUES('p003', 'La-Z-Boy', 'Sprite');

INSERT INTO flightcontroloperators( pid, chairPref, drinkPref)
  VALUES('p004', 'Beanbag Chair', 'Crab Juice');

-- Astronauts --
INSERT INTO astronauts( pid, yearsFlying, golfHandicap)
  VALUES('p005', 7, 3);

INSERT INTO astronauts( pid, yearsFlying, golfHandicap)
  VALUES('p006', 6, 1);

-- Spacecrafts --
INSERT INTO spacecrafts( scid, name, tailnum, weightTONS, fuelType, crewCapacity)
  VALUES('sc01', 'Apolo 69', '1355', 90.0, 'coal', 2);

INSERT INTO spacecrafts( scid, name, tailnum, weightTONS, fuelType, crewCapacity)
  VALUES('sc02', 'Pocket Rocket', '1123', 72.0, 'blaze rods', 4);

-- Systems --
INSERT INTO systems( systemid, name, descrip)
  VALUES('s001', 'Propultion', 'Makes the spacecraft move.');

INSERT INTO systems( systemid, name, descrip)
  VALUES('s002', 'Sega Dreamcast', 'Space Exploration is but a dream without one.');

-- Parts --
INSERT INTO parts( partid, name, descrip)
  VALUES('pt01', 'Engine', 'Does a thing');

INSERT INTO parts( partid, name, descrip)
  VALUES('pt02', 'Thrusters', 'Woooosh!');

INSERT INTO parts( partid, name, descrip)
  VALUES('pt03', 'CD-ROM Drive', 'CDs go here.');

INSERT INTO parts( partid, name, descrip)
  VALUES('pt04', 'VMU', 'It is like a memory card that you can play mini games on.');

-- Suppliers --
INSERT INTO suppliers( supid, name, address, payTerms)
  VALUES('s001', 'Fisher Price', 'Somewhere', 'Pay right now.');

INSERT INTO suppliers( supid, name, address, payTerms)
  VALUES('s002', 'Sega', 'Somewhere Else', 'Pay them yesterday.');

-- Catalog --
INSERT INTO catalog( partid, supid)
  VALUES('pt01', 's001');

INSERT INTO catalog( partid, supid)
  VALUES('pt02', 's001');

INSERT INTO catalog( partid, supid)
  VALUES('pt03', 's002');

INSERT INTO catalog( partid, supid)
  VALUES('pt04', 's002');

-- System Parts --
INSERT INTO sysParts( partid, systemid)
  VALUES('pt01', 's001');

INSERT INTO sysParts( partid, systemid)
  VALUES('pt02', 's001');

INSERT INTO sysParts( partid, systemid)
  VALUES('pt03', 's002');

INSERT INTO sysParts( partid, systemid)
  VALUES('pt04', 's002');

-- Spacecraft Systems --
INSERT INTO spacecraftSystems( scid, systemid)
  VALUES('sc01', 's001');

INSERT INTO spacecraftSystems( scid, systemid)
  VALUES('sc02', 's001')

INSERT INTO spacecraftSystems( scid, systemid)
  VALUES('sc02', 's002')

-- Crew --
INSERT INTO crew( pid, scid)
  VALUES('p005', 'sc01');

INSERT INTO crew( pid, scid)
  VALUES('p005', 'sc02');

INSERT INTO crew( pid, scid)
  VALUES('p006', 'sc02');
