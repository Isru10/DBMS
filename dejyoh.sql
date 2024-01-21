use  dejyoh;--database name 

create table student (id int primary key, Firstname varchar(50), Lastname varchar(50), country varchar(50) , cgpa float);--CREATING STUDENT TABLE 

create table Teachers (id int primary key, Firstname varchar(50), Lastname varchar(50), country varchar(50) , cgpa float);--CREATING Teacher TABLE 

create table studentet (id int primary key, Firstname varchar(50), Lastname varchar(50), country varchar(50) , cgpa float);--creating studentet table

create table course (coursecode int primary key , coursetitle  varchar(50), credit int , prerequisite varchar(50));--CREATING COURSE TABLE 

--INSETING VALUES INTO STUDENT TABLE 
insert into student (id ,Firstname,Lastname,country,cgpa ) VALUES ( 10,'CHALA ','BETEW','ETHIOPIA', 3.4);
insert into student (id ,Firstname,Lastname,country,cgpa ) VALUES ( 11,'BATU','DEJENE','CHINA', 3.7);
insert into student (id ,Firstname,Lastname,country,cgpa ) VALUES ( 12,'GEMEDA','ISRU','ETHIOPIA', 3.9);
insert into student (id ,Firstname,Lastname,country,cgpa ) VALUES ( 13,'NATI ','NAHOM','AMERICA', 3.1);
insert into student (id ,Firstname,Lastname,country,cgpa ) VALUES ( 14,'SAMI ','ABDI','NETHERLAND',3.0 );
insert into student (id ,Firstname,Lastname,country,cgpa ) VALUES ( 15,'LIBE ','ESAYAS','CANADA', 3.8);
insert into student (id ,Firstname,Lastname,country,cgpa ) VALUES ( 16,'SAM','HUNDE','ETHIOPIA', 3.99);
insert into student (id ,Firstname,Lastname,country,cgpa ) VALUES ( 17,'DAVE','ELYAS','PORTUGAL ',3.6 );
insert into student (id ,Firstname,Lastname,country,cgpa ) VALUES ( 18,'LEUL','MEGERSSA','FRANCE', 3.5);
insert into student (id ,Firstname,Lastname,country,cgpa ) VALUES ( 19,'TOLA','TONA','ETHIOPIA',3.0 );

insert into Teachers select * from student;--inserting into teachers values of students 

insert into studentet select * from student  where country='Ethiopia';--insert values of only ethiopia from student into studentet table

select * from studentet;--return studentet



--INSETING VALUES INTO COURSE TABLE 
INSERT INTO course(coursecode,coursetitle,credit,prerequisite) VALUES ( 111,  'MATH2' ,  3 , 'MATH1');
INSERT INTO course(coursecode,coursetitle,credit,prerequisite) VALUES (112 ,  'SCIENCE' , 3  , 'PRIMARYSCIENCE');
INSERT INTO course(coursecode,coursetitle,credit,prerequisite) VALUES ( 113,  'GEOGRAPHY' , 3  , 'NONE');
INSERT INTO course(coursecode,coursetitle,credit,prerequisite) VALUES ( 114,  'DCN ' , 4  , 'CIRCUIT');
INSERT INTO course(coursecode,coursetitle,credit,prerequisite) VALUES ( 115,  'DATABASE' , 4  , 'CSE104');
INSERT INTO course(coursecode,coursetitle,credit,prerequisite) VALUES ( 116,  'PHYSICS2 ',3,'PHYSICS1');
INSERT INTO course(coursecode,coursetitle,credit,prerequisite) VALUES (117 ,  'COMPARCH' , 4, 'DLD');
INSERT INTO course(coursecode,coursetitle,credit,prerequisite) VALUES ( 118,  'CIRCUIT' , 3  , 'MATH1');
INSERT INTO course(coursecode,coursetitle,credit,prerequisite) VALUES ( 119,  'FSE' ,  3 , 'PYTHON');
INSERT INTO course(coursecode,coursetitle,credit,prerequisite) VALUES ( 110,  'SRE' , 3  , 'FSE');

select  * from Teachers;

select count (distinct country)  from student;--return number of distinct countries 

select cgpa from student order by cgpa ASC; --return country in ascending order 

select cgpa from student order by cgpa  desc;--return cgpa in descending order 

select cgpa,Firstname from student order by cgpa  desc;--return cgpa in descending order and return  first name

select cgpa,Firstname from student order by cgpa desc , country   desc;--return cgpa and first name in descending order of cgpa and  country 

select COUNT(id),  country from student group by country ;--return number of unique countries count and the country name itself

select COUNT(id) from student group by country ;--return students in each country 

--like m% , %m, %m%, -m%(second letter) or wildcard 
select Firstname, id from student where Firstname like 'm%';--return firstname from student table with first letter starts with m
select Firstname, id from student where Firstname like '%m';--return first name from student table where last letter starts with m
select Firstname, id from student where Firstname like '%m%';--return first name where there is m in between 
select Firstname, id from student where Firstname like '[T or t]%';--return first name where it starts with upper or lower case 
select Firstname, id from student where Firstname like '-m%'--return first name where second letter is m

SELECT id, Firstname,--goes through conditions and returns a value when the first condition is met in this case the cgp is being teseted in every case 
CASE
    WHEN cgpa > 3.0 THEN ' grade greater than 3.0'
    WHEN cgpa = 3.0 THEN 'grade is 3.0'
    ELSE 'grade under 3.0'
END AS Firstname
FROM student; 

select * into q from student where country ='Ethiopia';--creates and displays a table(copying student table) having only country ethiopia


select top 50 percent  * from student;--return top 50% which is 5 values out of 10

select count(id) from student having count(id)>3;--returns the number of unique id in student table that have id >3

select * from student where cgpa between 3.5 and 4 ; --return the table where cgpa is between 3.5 and 4

select * from student where cgpa between 3.5 and 4 and country in ('ETHIOPIA ','FRANCE') ;--return the table where cgpa is between 3.5 and 4 and country ethiopia and france only


select Firstname from student where EXISTS(select Firstname from student where country ='CANADA' AND cgpa=3.8);--test for the existence of any record in a subquery.


select cgpa from student where cgpa =All(select cgpa from student where cgpa =3.0);--return boolean values after comparision ALL if ALL of the subquery values meet the condition


select Firstname from student where Firstname =Any(select Firstname from student where cgpa =3.9);--lists Firstname if it finds any persson with cgpa of 3.9 