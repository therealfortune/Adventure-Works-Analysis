USE AdventureWorksDW2019
GO
IF OBJECT_ID('Dim_Calender','V') IS NOT NULL
DROP VIEW Dim_Calender
GO
CREATE VIEW Dim_Calender
AS
SELECT [DateKey]
      ,[FullDateAlternateKey]		[Date]
      ,[DayNumberOfWeek]
      ,[EnglishDayNameOfWeek]
      ,[DayNumberOfMonth]
      ,[EnglishMonthName]			[Month name]
	  ,LEFT([EnglishMonthName],3)	[Month Short]
      ,[MonthNumberOfYear]			[Month No]
      ,[CalendarQuarter]			[Quarter]
      ,[CalendarYear]				[Year]
      ,[CalendarSemester]

  FROM [AdventureWorksDW2019].[dbo].[DimDate]
  WHERE CalendarYear >= 2019
  GO

-- QUERY THE VIEW 
SELECT * 
FROM Dim_Calender
GO

--COUNT THE NUMBER OF ROWS
SELECT COUNT(*)
FROM Dim_Calender
GO