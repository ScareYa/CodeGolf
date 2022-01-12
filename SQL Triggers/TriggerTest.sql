create table dbo.trigtest (id int, dt datetime)
go
create trigger dbo.trig1 on dbo.trigtest
after insert
as
update dbo.trigtest set dt = getdate();
go
insert into dbo.trigtest (id) values (1) waitfor delay '00:00:01'
select * from dbo.trigtest
insert into dbo.trigtest (id) values (2) waitfor delay '00:00:01'
select * from dbo.trigtest
insert into dbo.trigtest (id) values (3) waitfor delay '00:00:01'
select * from dbo.trigtest
go
alter trigger dbo.trig1 on dbo.trigtest
after insert
as
update tst set dt = getdate()
from dbo.trigtest tst
join inserted ins on ins.id = tst.id;
go
insert into dbo.trigtest (id) values (4) waitfor delay '00:00:01'
select * from dbo.trigtest
insert into dbo.trigtest (id) values (5) waitfor delay '00:00:01'
select * from dbo.trigtest
insert into dbo.trigtest (id) values (6) waitfor delay '00:00:01'
select * from dbo.trigtest
go
drop trigger dbo.trig1;
drop table dbo.trigtest;