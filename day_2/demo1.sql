create database join1;

use join1;

create table books(bookid int,bookname varchar(20),price int);
insert into books values(1,'c',100);
insert into books values(2,'c++',200);
insert into books values(3,'java',300);

create table transaction(transactionid int,bookid int);
insert into transaction values(101,1);
insert into transaction values(102,1);
insert into transaction values(103,1);

select * from books inner join transaction on books.bookid=transaction.bookid;

select books.bookid,books.bookname,transaction.transactionid 
from books left join transaction 
on books.bookid=transaction.bookid;

select books.bookid,books.bookname,transaction.transactionid 
from books right join transaction
 on books.bookid=transaction.bookid;
 
 select * from books cross join transaction;
 
 create table employee(empid int,empname varchar(20),managerid int);
 insert into employee values(1,'user1',4);
 insert into employee values(2,'user2',3);
 insert into employee values(3,'user3',1);
 insert into employee values(4,'user4',2);
 
 select * from employee e1, employee e2 where e1.empid=e2.managerid;
 
 create table emp(empid int,empname varchar(20),salary int,deptid int);
 insert into emp values(1,'user1',1000,101);
 insert into emp values(2,'user2',2000,101);
 insert into emp values(3,'user3',3000,101);
 
 select empid,empname,deptid from emp
 where deptid=
 any(select deptid from dept where dptname='testing' or deptname='hr');
 
 select empid,empname,sal
 from emp e1
 where sal>(select avg(sal)
 from emo e2 where e1.deptid=e2.deptid);
 
 
 create table testindex(id int primary key,fname varchar(20));
 insert into testindex values(1,'user1');
insert into testindex values(3,'user3');
insert into testindex values(2,'user2');
select * from testindex;

show index from testindex;
create index myindex on testindex(fname);

delimiter //
create procedure p1()
begin
	select * from emp;
end //
delimiter ;

call p1

delimiter //
create procedure p2(a int,b int)
begin 
	select 'sum is'+(a+b);
end //
delimiter ;

call p2(2,3)

drop procedure p3;

delimiter //
create procedure p3(a int)
begin 
	select * from emp where empid=a;
end //
delimiter ;

call p3(1);

delimiter //
create trigger t1 after insert on emp for each row
begin
	set @count='record addd';
end //
delimiter ;

insert into emp values(5,'use5',23000,102);
select @count;


delimiter //
create trigger t2 after delete on emp for each row
begin
	set @count='record deleted';
end //
delimiter ;

delete from emp where salary=23000;
select @count;

create view v1 as select empid,empname from emp;
select * from v1;
drop view v2;