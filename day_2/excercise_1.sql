use join1;

delimiter //
create procedure display(a varchar(20))
begin
	select count(*) into @count from emp where empname=a;
end //
delimiter ;

call display('user1');
select @count;

drop trigger tinsert;

delimiter //
create trigger tinsert after insert on emp for each row
begin
	select count(*) into @count from emp;
end //
delimiter ;

insert into emp values(6,'user6',45000,102);
select @count;

delimiter //
create trigger tdelete after delete on emp for each row
begin
	select count(*) into @count from emp;
end //
delimiter ;

delete from emp where empid=6;
select @count;

delimiter //
create trigger tupdate after update on emp for each row
begin
	select count(*) into @count from emp;
end //
delimiter ;

update emp set salary=30000 where empid=6;
select@count
