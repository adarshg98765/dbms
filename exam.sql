create table "FACULTY" (
	"StaffID" int primary key,
	"Title" varchar(25),
	"Status" varchar(25),
	"Tenured" date
);

create table "STAFF" (
	"StaffID" int primary key,
	"StfFirstName" varchar(25),
	"StfLastName" varchar(25),
	"StfStreetAddress" varchar(50),
	"StfCity" varchar(25),
	"StfState" varchar(25),
	"StfZipCode" int,
	"StfAreaCode" int,
	"StfPhoneNumber" char(10),
	"DateHired" Date,
	"Salary" dec(8,2),
	"Position" varchar(25)
);

create table "FACULTY_CATEGORIES" (
	"StaffID" int,
	"CategoryID" int,
	primary key("StaffID", "CategoryID")
);

create table "FACULTY_CLASSES" (
	"StaffID" int, "ClassID" int,
	primary key("StaffID", "ClassID")
);

create table "FACULTY_SUBJECTS" (
	"StaffID" int, "ClassID" int,
	"ProficiencyRating" dec(2,1),
	primary key("StaffID", "ClassID")
);

create table "CATEGORIES" (
	"CategoryID" int primary key,
	"CategoryDescription" varchar(50),
	"DepartmentID" int
);

create table "SUBJECTS" (
	"SubjectID" int primary key,
	"CategoryID" int,
	"SubjectCode" int,
	"SubjectName" varchar(25),
	"SubjectDescription" varchar(50),
	foreign key("CategoryID") references "CATEGORIES"("CategoryID")
);

create table "BUILDINGS" (
	"BuildingCode" int primary key,
	"BuildingName" varchar(25),
	"NumberofFloors" int
);

create table "CLASSROOMS" (
	"ClassroomID" int primary key,
	"BuildingCode" int,
	"PhoneAvailable" char,
	foreign key("BuildingCode") references "BUILDINGS"("BuildingCode")
);

create table "CLASSES" (
	"ClassID" int primary key,
	"SubjectID" int,
	"ClassroomID" int,
	"StartTime" time,
	"Duration" time,
	foreign key("SubjectID") references "SUBJECTS"("SubjectID"),
	foreign key("ClassroomID") references "CLASSROOMS"("ClassroomID")
);

create table "STUDENT_CLASS_STATUS" (
	"CategoryID" varchar primary key,
	"CategoryDescription" varchar(50)
);

create table "STUDENTS" (
	"StudentID" int primary key,
	"StudFirstName" varchar(25),
	"StudLastName" varchar(25),
	"StudStreetAddress" varchar(50),
	"StudCity" varchar(25),
	"StudState" varchar(25),
	"StudZipCode" int,
	"StudAreaCode" int,
	"StudPhoneNumber" char(10)
);

create table "STUDENT_SCHEDULES" (
	"ClassID" int,
	"StudentID" int,
	"ClassStatus" varchar(50),
	"Grade" int,
	primary key("ClassID", "StudentID"),
	foreign key("ClassStatus") references "STUDENT_CLASS_STATUS"("CategoryID")
);

select * from "STAFF";

select count(distinct("Position")) from "STAFF";

select "StfAreaCode", COUNT(*)
from "STAFF"
group by "StfAreaCode";

alter table "STAFF"
rename column "DateHired" to "JoiningDate";

alter table "SUBJECTS"
drop column "SubjectDescription";

insert into "STAFF" values (
	1, 'Mathew', 'Varghese',
	'2B, Baker St.', 'Kochi', 'Kerala',
	667867, 441, '9653412907',
	'2020-12-25', 150000.00, 'Principal'
);

insert into FACULTY values (
	1, 'Professor', 'Active', 'Y'
);

alter table "STUDENT_CLASS_STATUS"
alter column "CategoryID" type varchar(50);

select * from "FACULTY";

Cycle2

insert into "FACULTY" values
(1, 'Pr', 'Active', '2022-04-30'),
(2, 'AP', 'Active', '2025-01-30'),
(3, 'Pr', 'Transfer', '2020-03-20'),
(4, 'HOD', 'Active', '2030-12-30'),
(5, 'AsP', 'Retire', '2019-02-15')
;

SELECT * FROM "STAFF";

insert into "STAFF" values(1,'ADARSH','G','VALLICODE','PATHANAMTHITTA','KERALA',689648,0468,'7070707070','2020-12-12',10000,'PROFESSOR');
insert into "STAFF" values(2,'AJIN','BABY','KOOTHATUKULAM','KOTTAYAM','KERALA',689689,0472,'6969696969','2019-10-15',8000,'ASSISTANT PROFESSOR');
insert into "STAFF" values(3,'ALLEN','Y','CHAVADIMUKKU','KOLLAM','KERALA',686648,0488,'4204202020','2014-05-07',9500,'PROFESSOR');
insert into "STAFF" values(4,'ALVIN','ANTONY','SREEKARYAM','THIRUVANANTHAPURAM','KERALA',689696,0458,'1234512345','2012-12-12',15000,'HEAD OF THE DEPARTMENT');
insert into "STAFF" values(5,'AJAY','K','SULTHAN BATHERY','WAYANAD','KERALA',689666,0451,'7070712345','2011-01-11',8000,'ASSOCIATE PROFESSOR');

insert into "FACULTY_CATEGORIES" values
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105);

insert into "FACULTY_CLASSES" values
(1, 3003),
(2, 3001),
(3, 3002),
(4, 3004),
(5, 3005);

insert into "FACULTY_SUBJECTS" values
(1, 13, 7.0),
(2, 17, 8.1),
(3, 12, 8.4),
(4, 20, 7.9),
(5, 23, 9.5);
insert into "FACULTY_SUBJECTS" values
(1, 12, 7.7),
(4, 24, 9.1),
(4, 12, 6.1);

insert into "CATEGORIES" values
(101, 'Arts', 201),
(102, 'Science', 202),
(103, 'Mathematics', 203),
(104, 'Social Science', 204),
(105, 'Businees Studies', 205);

insert into "SUBJECTS" values
(10, 101, 10, 'Craft'),
(11, 101, 11, 'Music'),
(12, 101, 12, 'Painting'),
(13, 102, 13, 'Physics'),
(14, 102, 14, 'Chemistry'),
(15, 102, 15, 'Biology'),
(16, 103, 16, 'Linear Algebra'),
(17, 103, 17, 'Calculus'),
(18, 103, 18, 'Graph Theory'),
(19, 104, 19, 'History'),
(20, 104, 20, 'Geography'),
(21, 104, 21, 'Politics'),
(22, 105, 22, 'Economics'),
(23, 105, 23, 'Statistics')
;

insert into "BUILDINGS" values
(1001, 'Alpha', 3),
(1002, 'Beta', 2),
(1003, 'Gamma', 4),
(1004, 'Delta', 3);

insert into "CLASSROOMS" values
(2001,1001, 'Y'),
(2002,1001,'N'),
(2003,1001,'Y'),
(2004,1002,'Y'),
(2005,1002,'Y'),
(2006,1003,'N'),
(2007,1003,'N'),
(2008,1003,'Y'),
(2009,1003,'N'),
(2010,1004,'N'),
(2011,1004,'Y'),
(2012,1004,'Y')
;

insert into "CLASSES" values
(3001,13,2001,'09:00:00','00:30:00'),
(3002,17,2004,'09:00:00','01:00:00'),
(3003,12,2008,'10:00:00','00:45:00'),
(3004,20,2010,'10:30:00','01:30:00'),
(3005,23,2012,'14:00:00','02:00:00');

insert into "STUDENT_CLASS_STATUS" values
('PT', 'Part Time'),
('FT', 'Full Time');

insert into "STUDENTS" values
(7001,'Jack','Joyce','LA Road','Hearthrow','Ladine',145236,785534,1324531315),
(7002,'Lara','Croft','New Burrow','Oxford','Desperado',461133,543345,9446083477),
(7003,'Ellie','Joel','Ginbow','Polta','Wendes',655641,977755,7055526732),
(7004,'Jesse','Faden','Ordinary','Wertof','Jaydenfare',865766,121112,8093478900),
(7005,'Aiden','Pearce','Monopoly','Dominic','Crossroads',242231,554246,6047892345);

insert into "STUDENT_SCHEDULES" values
(3001,7001,'PT', 10),
(3001,7002, 'FT', 4),
(3002,7001, 'PT', 8),
(3003, 7003, 'PT', 9),
(3005, 7004,'FT', 7);



select s."StaffID", s."StfFirstName"
from "FACULTY" AS f, "STAFF" AS s
where (s."StaffID" = f."StaffID") and ("Tenured"-"JoiningDate")/365.0 > 5;

select s."StaffID", s."StfFirstName", (age("Tenured", current_date)) as "RemainingTenured"
from "FACULTY" AS f, "STAFF" AS s
where (s."StaffID" = f."StaffID") and (f."Status" = 'Active');

select * from "STAFF"
where ("Salary">10000) and ("Salary"<50000);

select count(distinct "Position") from "STAFF";

select "StfAreaCode", count(*)
from "STAFF"
group by "StfAreaCode";

select * from "STAFF";
SELECT * FROM "FACULTY";

//Cycle_3;

select * from "SUBJECTS";
select * FROM "FACULTY_SUBJECTS";

alter table "FACULTY_SUBJECTS"
rename column "ClassID" TO "SubjectID";

select max(avgsal)
from(select "Position", trunc(avg("Salary"),2) as avgsal
from "STAFF"
group by "Position") as random
;


select count(*) as "Staff_Count" from (
select "StaffID", count(*) from "FACULTY_SUBJECTS"
group by "StaffID" having count(*)=2 or count(*)=3
)
as "Staff_Subjects";

select max(avg_salary) as "Max_Avg_Salary" from
(select "Position", trunc(avg("Salary"),2) as avg_salary from "STAFF"
group by "Position")
as avg_table;

select c."ClassID", c."SubjectID", max(ss."Grade") as "Min_Grade"
from "STUDENTS" as s, "STUDENT_SCHEDULES" as ss, "CLASSES" as c
where s."StudentID" = ss."StudentID" and ss."ClassID" = c."ClassID"
group by c."ClassID",c."SubjectID";

select "SubjectName"
from "SUBJECTS"
where "SubjectName" like '%a%';


update "STUDENTS"
set "StudPhoneNumber"=9534249012
where "StudentID"=7005;
select "StudFirstName", "StudLastName", "StudPhoneNumber"
from "STUDENTS"
where "StudPhoneNumber"::text like '94%';

select "ClassID", "Duration"
from "CLASSES"
where "Duration" in
(select max("Duration") as "Duration"
from "CLASSES"
where "Duration" < '00:45:00');

select s."StudentID", s."StudFirstName", sj."SubjectName"
from "STUDENTS" s, "STUDENT_SCHEDULES" ss, "CLASSES" c, "SUBJECTS" sj
where s."StudentID"=ss."StudentID" and
c."SubjectID"=sj."SubjectID" and
ss."ClassID"=c."ClassID";

update "STAFF" set "Salary"=20000 where "StaffID"=5;
update "STAFF" set "StfState"='Tamil Nadu' where "StaffID"=5;
update "STAFF" set "StfState"='Tamil Nadu' where "StaffID"=3;
update "STAFF" set "Salary"=23000 where "StaffID"=3;
update "STAFF" set "Salary"=12000 where "StaffID"=1;
Display position and average salary of staff belonging to state “Kerala” or “Tamil Nadu” where salary is
more than 10000 and average salary is less than 25000
select * from "STAFF";

select "Position",avgsal
from(
select "Position", avg("Salary") as avgsal
FROM "STAFF"
WHERE ("StfState"='KERALA' OR "StfState"='Tamil Nadu') and "Salary">10000
group by "Position") as sdfsd
where avgsal<19000;

Select "Position", trunc(avg("Salary"),2) as avg_sal
from "STAFF"
where ("StfState" = 'KERALA' or "StfState"='Tamil Nadu' and "Salary">10000)
group by "Position" having avg("Salary")< 25000;

//Cycle 4;

revoke insert on "STUDENTS" from user1;
insert into "STUDENTS" values(106,'Bill','Gates','M2,Apollo road','Hyderabad','Telengane',866866,389389,'9886353212');

grant insert on "STUDENTS" to user1;
insert into "STUDENTS" values(106,'Bill','Gates','M2,Apollo road','Hyderabad','Telengane',866866,389389,'9886353212');

begin;
insert into "STAFF" values(6,'Richard','H','Munnar','Idukki','Kerala',697866,716,'7306076345','2016-06-24',25000,'PROFESSOR');
commit;

begin;
insert into "STAFF" values(7,'Gopi','Sundar','East Fort','Trivandrum','Kerala',697866,716,'7306076345','2016-06-24',25000,'PROFESSOR');
rollback;

select "StaffID", "Position", 'S' AS "EMPLOYEE" from "STAFF"
union all
select "StaffID", "Title", 'F' AS "EMPLOYEE" from "FACULTY";

To cast,
1. columnname::type
2. value::type;

select s."SubjectName", count(*)::decimal*100/(select count(*)
from "SUBJECTS" s, "CLASSES" c, "STUDENT_SCHEDULES" ss where s."SubjectID"=c."SubjectID" and
c."ClassID"=ss."ClassID" and s."SubjectName"='Physics') AS "Pass Percentage"
from "SUBJECTS" s, "CLASSES" c, "STUDENT_SCHEDULES" ss
where s."SubjectID"=c."SubjectID" and c."ClassID"=ss."ClassID" and
s."SubjectName"='Physics' and ss."Grade">5
group by s."SubjectName";

select b."BuildingName",c."ClassroomID",count(*)
from "BUILDINGS" b join "CLASSROOMS" c on b."BuildingCode"=c."BuildingCode"
join "CLASSES" cs on c."ClassroomID"=cs."ClassroomID"
join "STUDENT_SCHEDULES" ss on cs."ClassID"=ss."ClassID"
group by c."ClassroomID",b."BuildingName"
order by b."BuildingName";

select "StudFirstName", "StudentID", "StfFirstName", "StaffID", "StudZipCode" as "ZipCode"
from "STUDENTS", "STAFF"
where "StudZipCode"="StfZipCode";

select "StudFirstName", "StudentID", "StfFirstName", "StaffID", "StudZipCode" as "ZipCode"
from "STUDENTS" join "STAFF"
on "StudZipCode"="StfZipCode";

insert into "STUDENTS" values(7006,'Bill','Gates','M2,Apollo road','Hyderabad','Telengane',689648,389389,'9886353212');
alter table "FACULTY_SUBJECTS"
rename column "ClassID" to "SubjectID";

Display the list of faculty who engage same subject (for any particular
subject name);

select S."StfFirstName"
from "STAFF" s join "FACULTY_SUBJECTS" FS
ON S."StaffID"=FS."StaffID" JOIN
"SUBJECTS" SUB ON SUB."SubjectID"=FS."SubjectID"
WHERE SUB."SubjectName"='Painting';

select "StaffID", "StfFirstName"
from "STAFF"
where "StaffID"
in(
select "StaffID" from "FACULTY_SUBJECTS"
where "SubjectID"=(select "SubjectID" from "SUBJECTS" where "SubjectName" = 'Painting')
);

//Cycle 5;

create view faculty_view
as
select s."StfFirstName" as faculty_name, fc."ClassID", sj."SubjectName"
from "STAFF" s, "FACULTY_CLASSES" fc, "CLASSES" c, "SUBJECTS" sj 
where s."StaffID"=fc."StaffID" and
fc."ClassID"=c."ClassID" and
c."SubjectID"=sj."SubjectID";

do $$
declare
classroom_count integer;
begin
select count(*)
from "CLASSROOMS"
into classroom_count;
assert classroom_count>=100,'Check for empty CLASSROOM table';
end$$;


do $$
declare
f record;
ent record;
begin
select * from "STAFF" into f where "STAFF"."JoiningDate">'2015-01-01' and "STAFF"."JoiningDate"<'2022-01-01';
if not found then
raise notice 'No data found!';
else
for ent in select * from "STAFF" where "JoiningDate">'2015-01-01' and "JoiningDate"<'2022-01-01'
loop
raise notice '% % ', ent."StfFirstName",ent."StfLastName";
end loop;
end if;
end;
$$;


do $$                   
declare
row record;
begin
for row in select * from "STAFF" loop
case
when row."Salary"<5000 then
update "STAFF" set "Salary"=1.5*"Salary" where row."StaffID"="STAFF"."StaffID";
raise notice '% % : "Salary" incremented by 50 percent', row."StfFirstName",row."StfLastName";
when row."Salary">=5000 and row."Salary"<=10000 then
update "STAFF" set "Salary"=1.1*"Salary" where row."StaffID" = "STAFF"."StaffID";
raise notice '% % : "Salary" incremented by 10 percent', row."StfFirstName", row."StfLastName";
when row."Salary">10000 then
raise notice '% % : no increment', row."StfFirstName",row."StfLastName";
end case;
end loop;
end;
$$;

update "STAFF"
set "Salary"="Salary"/2;

insert into "FACULTY" values(6,'Pr','Active','2023-12-12');

do $$
declare
count integer:= 1;
f varchar;
begin
while count<=6 loop
select "STAFF"."StfLastName" into f from "STAFF","FACULTY" where "FACULTY"."StaffID"="STAFF"."StaffID" and count="STAFF"."StaffID";
raise notice '%.LastName: %', count, f;
count:=count+1;
end loop;
end;
$$;

create table "STUDENT_SCHEDULES_copy" (
	"ClassID" int,
	"StudentID" int,
	"ClassStatus" varchar(50),
    "Grade" int
);

CREATE OR REPLACE FUNCTION copyfunc()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
      INSERT INTO "STUDENT_SCHEDULES_copy"
      VALUES(old."ClassID",old."StudentID",old."ClassStatus");
      RETURN old;
END $$;

CREATE TRIGGER copy_row
BEFORE DELETE ON "STUDENT_SCHEDULES"
FOR EACH ROW EXECUTE FUNCTION copyfunc();

delete from "STUDENT_SCHEDULES" where "ClassID"=3001;

select * from "STUDENT_SCHEDULES";
truncate "STUDENT_SCHEDULES";

2.
CREATE OR REPLACE FUNCTION check_day()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
day varchar(10);
BEGIN
    SELECT INTO day to_char(current_date, 'Day');
    IF TG_OP='INSERT' THEN
        IF day!='Friday' THEN
            raise exception 'Insertion allowed only on fridays';
        END IF;
        RETURN NEW;
    END IF;
    
    IF TG_OP='UPDATE' or TG_OP='DELETE' THEN
        IF day='Sunday' THEN
          raise exception 'Deletion or updation not allowed on sundays';
        END IF;
        RETURN OLD;
    END IF;
END $$;

CREATE TRIGGER day
BEFORE UPDATE or DELETE or INSERT ON "STUDENTS"
FOR EACH ROW EXECUTE PROCEDURE check_day();

insert into "STUDENTS" 
values(206,'shinoj','s','gandhi nagar','jaipur','delhi',755438,12789,256954653);

3.
CREATE OR REPLACE FUNCTION stop_update()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF new."Salary">old."Salary" THEN
      raise exception 'No update if new salary greater than old salary';
    END IF;
    RETURN NEW;
END $$;

CREATE TRIGGER check_salary
BEFORE UPDATE ON "STAFF"
FOR EACH ROW EXECUTE PROCEDURE stop_update();

update "STAFF" set "Salary" = 20000 where "Salary" = 6600;

c.1
CREATE OR REPLACE FUNCTION get_faculty(cityname varchar(25))
RETURNS void
language plpgsql
AS $$
DECLARE
    declare c_staff refcursor;
    r record;
BEGIN
    OPEN c_staff for select * from "STAFF";
    FETCH c_staff INTO r;
      
    WHILE FOUND c_staff
    LOOP
        IF r."StfCity"=cityname THEN
            raise notice '% %
            %',r."StfFirstName",r."StaffID",r."StfCity";
        END IF;
        FETCH c_staff INTO r;
    END LOOP;
    
    CLOSE c_staff;
END;
$$;

select get_faculty('KOLLAM');

c.2
CREATE OR REPLACE FUNCTION get_staff(staffname varchar(25))
RETURNS void
language plpgsql
AS $$
DECLARE
    c_staff CURSOR(name varchar(25)) 
    FOR select * from "STAFF" s,"FACULTY_CATEGORIES" f,"CATEGORIES" c
    where s."StaffID"=f."StaffID" and f."CategoryID"=c."CategoryID" and 
    c."DepartmentID"=
    (select "CATEGORIES"."DepartmentID" from "STAFF","FACULTY_CATEGORIES",
    "CATEGORIES" where "STAFF"."StaffID"="FACULTY_CATEGORIES"."StaffID" 
    and "FACULTY_CATEGORIES"."CategoryID"="CATEGORIES"."CategoryID"
    and "STAFF"."StfFirstName"=name);
    
    r record;
BEGIN
    OPEN c_staff(staffname);
    FETCH c_staff INTO r;
    
    WHILE FOUND c_staff 
    LOOP
        raise notice 'name:%  dept
        id:%',r."StfFirstName",r."DepartmentID";
        FETCH c_staff INTO r;
         END LOOP;
    
    CLOSE c_staff;
END;$$;

select get_staff('AJIN');

c.3
begin;
declare sal_cursor cursor for select "StaffID", "Salary" from "STAFF" 
order by "Salary" desc;
fetch 2 from sal_cursor;

p.1
CREATE OR REPLACE PROCEDURE func1(facultyid int)
LANGUAGE plpgsql
AS $$
DECLARE 
    r record;
BEGIN
    select s."Salary",c."DepartmentID",c."CategoryDescription"
    from "STAFF" s,"FACULTY_CATEGORIES" f,"CATEGORIES" c
    where s."StaffID"=f."StaffID" and f."CategoryID"=c."CategoryID" and 
    s."StaffID"=facultyid
    into r;
    
    raise notice 'salary:% , dept id:% , dept name:%',
    r."Salary",r."DepartmentID",r."CategoryDescription";
END$$;

call func1(1);
call func1(2);

Find the names of departments which have more than four faculty;
create or replace procedure faculty()
language plpgsql
as $$
declare
f record;
begin
select c."DepartmentID", c."CategoryDescription"
into f
from "FACULTY_CATEGORIES" fc, "CATEGORIES" c
where fc."CategoryID"=c."CategoryID"
group by "DepartmentID",c."CategoryDescription" having count(*)>=4;
raise notice '% %', f."DepartmentID", f."CategoryDescription";
end$$;




p.2
CREATE OR REPLACE PROCEDURE faculty()
LANGUAGE plpgsql
AS $$
DECLARE
    r record;
    cnt integer;
BEGIN
    FOR r IN (select * from "CATEGORIES")
    LOOP
        select count(*)
        into cnt
        from "STAFF" s,"FACULTY_CATEGORIES" f,"CATEGORIES" c
        where s."StaffID"=f."StaffID" and
        f."CategoryID"=c."CategoryID" and
        c."DepartmentID"=r."DepartmentID";
        
        IF cnt>=4 THEN
            raise notice 'dept name:% , dept id:%',
            r."CategoryDescription",r."DepartmentID";
        END IF;
    END LOOP;
END $$;

call faculty();

p.3
CREATE OR REPLACE PROCEDURE salary_hike(faculty_id int)
language plpgsql
as $$
declare
    r record;
    service int;
begin
    for r in (select * from "STAFF")
    loop
        service :=(current_date-r."JoiningDate")/365;
        if service>2 then
            update "STAFF" set "Salary" = 1.05* "Salary" where 
            "StaffID"=faculty_id;
            raise notice 'staffid:%, service period:% years,
            new salary:%',r."StaffID",service,r."Salary";
        else
            raise notice 'staffid:% , service period:% years, 
            No increment',
            r."StaffID",service;
        end if;
    end loop;
end; $$;
call salary_hike(2);

p.4;
alter table "CLASSES" drop constraint "CLASSES_SubjectID_fkey";

Using a function, delete the details of subject from the subject table having
no students;
select * from "SUBJECTS"
where "SubjectName" not in(select sub."SubjectName"
from "STUDENT_SCHEDULES" ss join "CLASSES" cl
on ss."ClassID"=cl."ClassID" JOIN
"SUBJECTS" sub on sub."SubjectID"=cl."SubjectID");
create or replace function delsub()
returns void
language plpgsql
as $$
declare
f record;
begin
    delete from "SUBJECTS" where "SubjectName" not in(select sub."SubjectName" from "STUDENT_SCHEDULES" ss join "CLASSES" cl on ss."ClassID"=cl."ClassID" JOIN "SUBJECTS" sub on sub."SubjectID"=cl."SubjectID");
end$$;

CREATE FUNCTION delsub()
returns void
language plpgsql
as $$
declare
    r record;
begin
    delete from "SUBJECTS" where "SubjectID" not in 
    (select sub."SubjectID" from "SUBJECTS" sub,"CLASSES" cls,
    "STUDENT_SCHEDULES" st 
    where sub."SubjectID"=cls."SubjectID" and cls."ClassID"=st."ClassID" 
    group by sub."SubjectID" having count(st."StudentID")>0);
end;
$$;

select delsub();
p.5
CREATE OR REPLACE FUNCTION salary_1by4()
RETURNS VOID 
LANGUAGE plpgsql
AS $$
DECLARE
    avg_salary decimal(10,2);
    r record;
BEGIN
    select avg("Salary")
    into avg_salary
    from "STAFF";
    
    for r in (select * from "STAFF")
    loop
        if r."Salary"<(0.25*avg_salary) then
            raise notice 'name:% %',r."StfFirstName",r."StfLastName";
        end if;
    end loop;
END $$;

select salary_1by4();

p.6
CREATE FUNCTION updatesal()
returns void
language plpgsql
as $$
begin
    update "STAFF" set "Salary" = 1.25*"Salary" where "Salary"<10000;
end;
$$;

select updatesal();

select "StfAreaCode", count("StfAreaCode")
from "STAFF"
group by "StfAreaCode";

--Display the count of teachers teaching either two or three different subjects


select * from "SUBJECTS";

select * from "FACULTY_SUBJECTS";

select count(*) from(
select "StaffID", count("SubjectID") as subjectcount
from "FACULTY_SUBJECTS"
group by "StaffID"
having count("SubjectID")=2 or count("SubjectID")=3) as lol;

--Display the maximum of average salary from Staff table based on their positions

select max(average) from (SELECT trunc(avg("Salary"),2) as average, "Position"
from "STAFF"
group by "Position") as lol;

SELECT trunc(avg("Salary"),2) as average, "Position"
from "STAFF"
group by "Position";

select * from "STUDENTS";
select * from "SUBJECTS";
select * from "CLASSES";

select "StudFirstName", "StudLastName", "StudPhoneNumber"
from "STUDENTS"
where
"StudPhoneNumber"like
'95%';

--Retrieve Class ID and maximum duration available in Classes where maximum duration is less than 45 minutes
select "BuildingCode"
from "CLASSROOMS", "CLASSES"
where "Duration" IN
(select "Duration"
from "CLASSES"
where "Duration" < '01:00:00') AND
"CLASSROOMS"."ClassroomID" = "CLASSES"."ClassroomID";

--Display position and average salary of staff belonging to state “Kerala” or “Tamil Nadu” where salary is more than 10000 and average salary is less than 25000

insert into "STAFF" VALUES
(7, 'asads', 'asda', 'asdasfs', 'asdsa', 'KARNATAKA', 64532,3242,2342313443,'2000-11-11',15000,'PROFESSOR');

select "Position", avgsal
from(select "Position",trunc(avg("Salary"),2) as avgsal
from "STAFF"
WHERE ("StfState"='KERALA' OR "StfState"='Tamil Nadu') AND
"Salary" > 10000 
group by "Position") as lol
where avgsal<25000;

select "Position", trunc(avg("Salary"),2) as avgsal
from "STAFF"
WHERE ("StfState"='KERALA' OR "StfState"='Tamil Nadu') AND
"Salary" > 10000 
group by "Position";

select "Title", 'F' as "Table name", 'test' as "Testing"
from "FACULTY"
union ALL
select "Position", 'S' as "Table Name1", 'test' as "Testing"
from "STAFF"
