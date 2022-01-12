declare @a varchar(5) = '1'

declare
 @s varchar(max) = 'create table #t (i int) insert into #t values (1' + left(@a, 1) + ')'
,@x varchar(max) = ' ;with x (y) as (select right(t1.i, 1)'
,@u varchar(max) = ' from #t t1'
,@w varchar(max) = ''
,@n int = len(@a), @i int = 1, @c int;

while @i < @n
begin
	set @s = @s + ',(' + cast(@i + 1 as char(1)) + substring(@a, @i + 1, 1) + ')'
	set @x = @x + ' + right(t' + cast(@i + 1 as char(1)) + '.i, 1)'
	set @u = @u + ' cross join #t t' + cast(@i + 1 as char(1))
	set @c = @i
	while @c > 0
	begin
		set @w = @w + case when @i < 2 then ' where ' else ' and ' end + 't' + cast(@i + 1 as char(1)) + '.i <> t' + cast(@c as char(1)) + '.i'
		set @c = @c - 1
	end
	set @i = @i + 1
end

set @s = @s + @x + @u + @w + ') select sum(cast(y as int)) from x'

exec (@s)