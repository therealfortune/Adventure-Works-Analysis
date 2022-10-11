USE AdventureWorksDW2019
GO
IF OBJECT_ID('Fact_InternetSales', 'V') IS NOT NULL
DROP VIEW Fact_InternetSales
GO
CREATE VIEW Fact_InternetSales
AS
SELECT 
  [ProductKey], 
  [OrderDateKey], 
  [DueDateKey], 
  [ShipDateKey], 
  [CustomerKey], 
  [SalesOrderNumber], 
  [SalesAmount]
 
FROM 
  [AdventureWorksDW2019].[dbo].[FactInternetSales]
WHERE 
  LEFT (OrderDateKey, 4) >= YEAR(GETDATE()) -3 
	GO

-- QUERY THE DATA
SELECT * 
FROM Fact_InternetSales
GO
