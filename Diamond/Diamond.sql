DECLARE @r INT = 9, @c INT = 1, @l INT = 1

 WHILE @c < 2 * @r
 BEGIN
 PRINT REPLICATE(' ', @r-@l) + REPLICATE('*',2*@l-1)
 SET @c = @c + 1
 IF @c > @r SET @l = @r - @c % @r ELSE SET @l = @c
 END