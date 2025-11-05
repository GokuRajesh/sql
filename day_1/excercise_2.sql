create database gokul;
use gokul;

create table students(rollno int,studentname varchar(20),age int);

desc students;

alter table students add dept varchar(20);

desc students;

alter table students change rollno id int;

insert into students values(1,"user1",22,"testing");
insert into students values(2,"user2",23,"dev");
insert into students values(3,"user3",21,"hr");

alter table students add mobile_number int;
insert into students(mobile_number) values(1234567890);
insert into students(mobile_number) values(12290);
select * from students;

alter table students drop age;

update students set dept="development" where dept="dev";
update students set dept="human resources" where dept="hr";

select * from students;