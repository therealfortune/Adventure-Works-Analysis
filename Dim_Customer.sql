USE AdventureWorksDW2019
GO
IF OBJECT_ID('Dim_Customer', 'V') IS NOT NULL
DROP VIEW Dim_Customer
GO
CREATE VIEW Dim_Customer
AS
SELECT 
  c.customerkey AS CustomerKey, 

  c.firstname AS [First Name], 
  c.lastname AS [Last Name], 
  c.firstname + ' ' + lastname AS [Full Name], 

  CASE c.gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender,

  c.datefirstpurchase AS DateFirstPurchase, 
  g.city AS [Customer City] 
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] as c
  LEFT JOIN dbo.dimgeography AS g ON g.geographykey = c.geographykey 
  GO

-- QUERY THE DATA
SELECT *
FROM Dim_Customer
GO

