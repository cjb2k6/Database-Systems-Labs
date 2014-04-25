--Christopher Barnett--
--4/24/14--

-- 1 --
create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as 
$$
declare
   course_num  int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select prereqnum
      from   prerequisites
      where  coursenum = course_num;
   return resultset;
end;
$$ 
language plpgsql;

--test
select PreReqsFor(221, 'results');
Fetch all from results;

-- 2 --
create or replace function IsPreReqFor(int, REFCURSOR) returns refcursor as 
$$
declare
   course_num  int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select coursenum
      from   prerequisites
      where  prereqnum = course_num;
   return resultset;
end;
$$ 
language plpgsql;

--test
select IsPreReqFor(220, 'results');
Fetch all from results;