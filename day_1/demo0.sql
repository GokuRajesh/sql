create database sqldemo;

use sqldemo;

create table emp(empid int,empname varchar(20),sal int,city varchar(20));

insert into emp values(1,"user 1",200,'hyd');
insert into emp values(2,"user 2",400,'tvm');
insert into emp values(3,"user 3",500,'chn');
insert into emp values(4,"user 4",6200,'pun');
insert into emp values(5,"user 5",1200,'coc');

select * from emp;
select city from emp;

select * from emp where sal>3000;
select sal from emp where empid=2;

update emp set empname="raju" where empid=1;
select * from emp;