use sqldemo;

drop table members;
create table members(memberid int,membername varchar(20),category varchar(20));
insert into members values(1,'user1','admin');
insert into members values(2,'user2','guest');
insert into members values(3,'user3','admin');
insert into members values(4,'user4','admin');

create table transaction(orderid int,memberid int);
insert into transaction values(101,1);
insert into transaction values(102,1);
insert into transaction values(103,2);
insert into transaction values(104,3);
insert into transaction values(105,1);

select * from transaction;
select * from members;

select membername from members where category='guest' and memberid in (select memberid from transaction);

select membername from members where memberid=(select memberid from transaction where orderid=104);

select membername from members where memberid not in (select memberid from transaction) and category='admin';

select count(*) from transaction where memberid=(select memberid from members where membername='user1');

