use sqldemo;
select * from emp;

update emp set sal=sal+1000 where city="pun";
select * from emp;

use sqldemo;

rename table emp to newemp;

alter table newemp add deptname varchar(20);

alter table newemp drop deptname;

show tables;

show databases;

desc newemp;

drop table newemp;

create table emp(empid int primary key,empname varchar(20),sal int);
insert into emp(empname,sal) values("user1",1000);
insert into emp values(1,"user1",1000);
insert into emp values(1,"user2",1000);

drop table emp;
create table emp(empid int primary key,empname varchar(20),age int check(age>20));
insert into emp values(1,"raj",19);
insert into emp values(2,"taj",24);
insert into emp values(3,"poli",-100);

drop table emp;

create table emp(empid int,empname varchar(20),country varchar(20) default "india");
insert into emp(empid,empname) values(2,"loki");
select * from emp;

drop table emp;
create table emp(empid int not null);
insert into emp values(1);
insert into emp values();

drop table emp;
create table dept(deptid int primary key,deptname varchar(20));
drop table emp;
create table emp(empid int primary key,empname varchar(20),deptid int, foreign key(deptid) references dept(deptid));

drop table emp;
create table emp(empid int,empname varchar(20),sal int,deptname varchar(20));
insert into emp values(1,'user1',1000,'hr');
insert into emp values(2,'user2',5000,'dev');
insert into emp values(3,'user3',7000,'hr');
insert into emp values(4,'user4',3000,'dev');

select deptname,max(sal) from emp group by deptname having max(Sal)>5000;
select deptname from emp where deptname in ('hr');
select deptname as "department name " from emp;

update emp set deptname="hr" where deptname is not null;

drop table emp;
#is null , like 


