use sqldemo;
drop table dept;
drop table emp;

create table dept(deptid int,deptname varchar(20),empid int);

insert into dept values(1,'hr',101);
insert into dept values(2,'testing',102);
insert into dept values(1,'development',103);
insert into dept values(1,'accounts',104);
insert into dept values(1,'admin',105);

create table emp(empname varchar(20),sal int ,deptid int );
insert into emp values('john',10000,1);
insert into emp values('prakash',25000,2);
insert into emp values('gouri',12000,2);
insert into emp values('krishnan',15000,1);
insert into emp values('kumar',28000,3);

select empname from emp where sal in (select max(sal) from emp group by deptid);
select empname from emp where deptid=(select deptid from dept where deptname='testing') and sal=(select max(sal) from emp where deptid=(select deptid from dept where deptname='testing'));

select empname from emp e where sal<(select avg(sal) from emp d where e.deptid=d.deptid);
select empname as "employee name" from emp e where sal=(select max(sal) from emp d where e.deptid=d.deptid);