use sql2;

drop table employee;

create table employee(empid int, empname varchar(20), deptid int, salary int);
create table dept (deptid int, deptname varchar(20));
insert into employee values (1,"john",101,1000);
insert into employee values (2,"Mano",102,2000);
insert into employee values (3,"Prakash",101,3000);
insert into employee values (4,"Venu",102,4500);
insert into employee values (5,"Abirami",101,5000);
insert into dept values(101,"HR");
insert into dept values(102,"Testing");
insert into dept values(103,"Development");
insert into dept values(104,"Accounts");

select empname from employee where deptid=(select deptid from dept where deptname='Testing');

select count(empname) from employee where deptid=(select deptid from dept where deptname='Accounts');

select deptname from dept where deptid=(select deptid from employee where empname='john');

select deptname from dept where deptid=(select deptid from employee where salary=(select max(salary) from employee));

select deptname from dept where deptid=(select deptid from employee where salary=(select min(salary) from employee));

select deptname from dept where deptid=(select deptid 
from employee group by deptid having count(deptid) >= all(select count(deptid) from employee group by deptid));

select deptname from dept where deptid not in (select deptid from employee);

select empname from employee where deptid not in(select deptid from dept where deptname="HR");

select empname from employee where salary=(select salary from employee order by salary desc limit 1,1);

select empname from employee where salary>(select salary from employee where empname='Mano');

select empname from employee
 where salary=(select max(salary) from employee group by deptid having deptid=(select deptid from dept where deptname='Testing'));
 
 select empid,empname,deptname from employee inner join dept on dept.deptid=employee.deptid;
 
 select deptid,deptname from dept where deptid not in (select deptid from employee);
 