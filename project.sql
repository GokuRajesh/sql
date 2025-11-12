create database project;

use project;

create table ClientTable(ClientId varchar(20),ClientName varchar(20),cid varchar(20));
insert into ClientTable values('cl-1','ABC Group','c-1'),('cl-2','PQR','c-1'),
('cl-3','XYZ','c-2'),('cl-4','tech altum','c-3'),('cl-5','mnp','c-5');

create table EmpProject(EmpId int,ProjectId varchar(20),ClientId varchar(20),StartYear int,EndYear int);
insert into EmpProject values(101,'p-1','cl-1',2010,2010),(102,'p-2','cl-2',2010,2012),
(103,'p-1','cl-3',2013,null),(104,'p-4','cl-1',2014,2015),
(105,'p-4','cl-5',2015,null);

create table employee(empid int primary key,empname varchar(100), department 
varchar(50),contactno bigint, emaildid varchar(100), empheadid int);
select * from employee;

create table empdept(deptid varchar(50) primary key,deptname varchar(100), dept_off varchar(100), 
depthead int ,foreign key(depthead) references employee(empid));
select * from empdept;

create table empsalary(empid int, foreign key(empid) references employee(empid), salary bigint, 
ispermanent varchar(3));
select * from empSalary;
insert into empsalary values(101,2000,'Yes'),(102,10000,'Yes'),(103,5000,'No'),
(104,1900,'Yes'),(105,2300,'Yes');

select deptname from empdept where deptid='E-102';

select sum(salary) from empsalary group by ispermanent having ispermanent='Yes';

select empname from employee where empname like '%a';

select empname from employee where empid in (select empid from empsalary where ispermanent='No');