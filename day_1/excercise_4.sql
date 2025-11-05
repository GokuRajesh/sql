use sqldemo;

create table students(rollno int,studentname varchar(20));
insert into students values(1,'john');
insert into students values(2,'prakash');
insert into students values(3,'mano');
insert into students values(4,'raghav');
insert into students values(5,'kumar');

drop table courses;
create table courses(courseno varchar(20),coursename varchar(20),fee int);
insert into courses values('c0001','dos',1500);
insert into courses values('c0002','mswindows',2000);
insert into courses values('c0003','c++',3000);
insert into courses values('c0004','c',2000);
insert into courses values('c0005','java',3000);
insert into courses values('c0006','oracle',4000);

create table course_enrolled(rollno int,course_no varchar(20));
insert into course_enrolled values(1,'c0001');
insert into course_enrolled values(1,'c0004');
insert into course_enrolled values(2,'c0003');
insert into course_enrolled values(5,'c0006');

select coursename from courses where courseno in 
(select course_no from course_enrolled where rollno=(select rollno from students where studentname='john'));

select coursename from courses where fee>3500;

select coursename from courses where courseno not in (select course_no from course_enrolled);

select fee from courses where courseno='c004';

select count(course_no) from course_enrolled where rollno =(select rollno from students where studentname='prakash');

select coursename from courses where courseno in (select course_no from course_enrolled group by course_no having count(course_no)>=1);

select studentname from students where rollno=(select rollno from course_enrolled group by rollno having count(rollno)>1);

select studentname from students where rollno=(select rollno from course_enrolled where course_no=(select courseno from courses where coursename='oracle'));