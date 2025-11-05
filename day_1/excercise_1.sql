use sqldemo;

create table books(bookid int ,bookname varchar(20),author varchar(20),price int);

insert into books values(1,"c","balaguruswamy",150);
insert into books values(2,"c++","balaguruswamy",175);
insert into books values(3,"java","balaguruswamy",300);
insert into books values(4,"oracle","rish",850);
insert into books values(5,"mysql","manohar",400);

select * from books;
select author from books where bookname="mysql";
select price from books where bookname="oracle";
select bookname from books where author="balaguruswamy";
select count(*) from books;
select bookid from books where bookname="java";
select bookname from books where price>200;
select count(*) from books where author="balaguruswamy";
