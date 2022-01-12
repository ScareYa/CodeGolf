SET NOCOUNT ON;

exec [dbo].[Procedure1];
exec [dbo].[CLRProc]; --prints to console
exec [dbo].[SelectTest];
exec [dbo].[AcceptArg] @intAny = 13;

SELECT TOP 5
 name
,dbo.CountVowels(name) [dbo.CountVowels]
,dbo.CountUnderscores(name) [dbo.CountUnderscores]
,CONVERT(VARCHAR(50),crdate,121) crdate
,dbo.CountSpaces(CONVERT(VARCHAR(50),crdate,121)) [dbo.CountSpaces]
FROM master.[sys].[sysobjects]
GROUP BY name, CONVERT(VARCHAR(50),crdate,121) ORDER BY name;

--REQUIRES OctopusScrape Database... :
SELECT
 [EnvironmentsId]
,[OctopusId]
,[Name]
,dbo.CountSpaces(Name) CountSpaces
FROM [OctopusScrape].[Mod].[Environments]
GROUP BY 
 [EnvironmentsId]
,[OctopusId]
,[Name]