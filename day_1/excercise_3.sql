use sqldemo;
drop table books;
create table books(bookid int ,bookname varchar(20),category varchar(20),author varchar(20),price int);
insert into books values(1,'book1','fiction','raju',200);
insert into books values(2,'book2','non-fiction','guru',400);
insert into books values(3,'book3','non-fiction','swamy',500);
insert into books values(4,'book4','fiction','mahi',150);
insert into books values(5,'book5','non-fiction','pratap',300);

select * from books;

select category,count(category) from books group by category;

select count(*) from books;

select * from books where price between 300 and 500;

select bookname from books where author='mahi';

select price from books where author='guru';

select bookname from books where author in ('swamy','raju');

select bookname from books where author!='pratap';

select category,min(price) from books group by category;

select bookname from books where category='fiction' and price>200;

select bookname,author from books where author like '%u';


