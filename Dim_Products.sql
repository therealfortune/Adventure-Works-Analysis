USE AdventureWorksDW2019
GO
IF OBJECT_ID('Dim_Product', 'V') IS NOT NULL
DROP VIEW Dim_Product
GO
CREATE VIEW Dim_Product
AS
SELECT [p].[ProductKey]					
      ,[p].[ProductAlternateKey]		[ProductItemCode]	
      ,[p].[EnglishProductName]			[Product Name]
	  ,ps.EnglishProductSubcategoryName [Sub Category]
	  ,pc.EnglishProductCategoryName	[Product Category]
      ,[p].[Color]						[Color]
      ,[p].[Size]						[Size]
      ,[p].[ProductLine]				[Product Line]
      ,[p].[ModelName]					[Product Model Name]
      ,[p].[EnglishDescription]			[Product Description]
	  ,ISNULL(p.Status,'Outdated')		[Product Status]
  FROM [AdventureWorksDW2019].[dbo].[DimProduct] [p]
	  LEFT JOIN [DimProductSubcategory] [ps]
		ON [ps].[ProductSubcategoryKey] = [p].[ProductSubcategoryKey]
		LEFT JOIN [DimProductCategory] [pc]
			ON [pc].[ProductCategoryKey] = [ps].[ProductCategoryKey]
	GO
	
SELECT *
FROM Dim_Product
GO