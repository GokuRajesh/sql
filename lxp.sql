create database lxp1;
use lxp1;

CREATE TABLE books (
    BookID INT PRIMARY KEY,
    BookName VARCHAR(50),
    Author VARCHAR(50),
    Price DECIMAL(10, 2),
    Publisher VARCHAR(50)
);

INSERT INTO books (BookID, BookName, Author, Price, Publisher) VALUES
(1, 'C', 'Balu', 100, 'BPB'),
(2, 'C++', 'Gowri', 200, 'McGRaw'),
(3, 'Java', 'Mano', 300, 'BPB'),
(4, 'Perl', 'James', 400, 'BPB'),
(5, 'Ruby', 'Antony', 500, 'McGRaw');

-- Display all the records
select * from books;

-- Display only the book name
select BookName from books;

-- Display the number of books in the library
select count(BookName) from books;

-- Display the author name of C++ books
select Author from books where BookName='C++';

-- Display the book names where price is above 200
select BookName from books where price>200;

-- Display the book name where the price is between 200 and 400
select BookName from books where price between 200 and 400;

-- Display the book name written by the author Antony
select BookName from books where Author='Antony';

-- Display the book name which has the highest price
select BookName from books where price=(select max(price) from books);

-- Display the book which has the lowest price
select BookName from books where price=(select min(price) from books);

-- Display the number of book published by each publisher
select count(Publisher),Publisher from books group by Publisher;

-- Display the average price of the books which are published by McGraw
select avg(price) from books group by Publisher having Publisher='McGraw';

-- Display the first 2 rows in the table
select * from books limit 2;

-- Display the last 2 rows in the table
select * from books order by BookID desc limit 2;

create table employee(empid int primary key,empname varchar(20),deptid int,salary int);
insert into employee values(1,'John',101,1000),(2,'Mano',102,2000),(3,'Prakash',101,3000),
(4,'Venu',102,4500),(5,'Abirami',101,5000);

create table dept(deptid int,deptname varchar(20));
insert into dept values(101,'HR'),(102,'Testing'),(103,'Development'),(104,'Accounts');

-- Display the employee names who are working in “Testing” department
select empname from employee where deptid=(select deptid from dept where deptname='Testing');

-- Display the number of employees who are working in “Accounts” department
select empname from employee where deptid=(select deptid from dept where deptname='Accounts');

-- Display the department name of the employee “john”
select deptname from dept where deptid=(select deptid from employee where empname='John');

-- Display the department name where the highest salary is paid
select deptname from dept where deptid=(select deptid from employee where salary=(select
max(salary) from employee));

-- Display the department name where the lowest salary is paid
select deptname from dept where deptid=(select deptid from employee where salary=(select
min(salary) from employee));

-- Display the department name where more number of employees are working
select deptname from dept where deptid=(select deptid from employee group by deptid having count(deptid) >= all(select count(deptid) from employee group by deptid));

-- Display the department name where none of the employees are working
select deptname from dept where deptid not in (select deptid from employee);

-- Display the employee names who are not working in “HR” department
select empname from employee where deptid not in (select deptid from dept where deptname='HR');

-- Display the employee who earns second highest salary
select empname from employee order by salary desc
limit 1,1;

-- Display the employee who earns salary more than “Mano”
select empname from employee where salary>(select salary from employee where empname='Mano');

-- Display the employee name who earns highest salary in “Testing” department
SELECT empname 
FROM employee 
WHERE salary >= (SELECT MAX(salary) FROM employee WHERE deptid IN (
        SELECT deptid 
        FROM dept 
        WHERE deptname = 'Testing'
    )
);

-- Display the employee ID, employee name and department names of all employees.
select empid,empname,deptname from employee e inner join dept d on e.deptid=d.deptid;

-- List the department ID and name of all the departments where no employee is working.
select deptid,deptname from dept where deptid not in (select deptid from employee);