create database sql2;
use sql2;

create table books(bookid int,bookname varchar(20),author varchar(20),price int,publisher varchar(20));
insert into books values(1,'C','Balu',100,'BPB'),(2,'C++','Gowri',200,'McGraw'),
(3,'Java','Mano',300,'BPB'),(4,'Peri','James',400,'BPB'),(5,'Ruby','Antony',500,'McGraw');

select * from books;

select bookname from books;

select count(bookname) from books;

select author from books where bookname='C++';

select bookname from books where price>200;

select bookname from books where price between 200 and 400;

select bookname from books where author='Antony';

select bookname from books where price=(select max(price) from books);

select bookname from books where price=(select min(price) from books);

select publisher,count(bookname) from books group by publisher;

select publisher,avg(price) from books group by publisher having publisher='McGraw';

select * from books
limit 2;

select * from books
order by bookid desc
limit 2;
