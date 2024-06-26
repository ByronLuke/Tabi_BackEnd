USE [Tabi]
GO
/****** Object:  StoredProcedure [dbo].[Products_Search_Pagination]    Script Date: 4/2/2024 5:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Search: A proc to search Products either by Name, Description, Or ProductType.Name. 
--This proc will accept a searchTerm as a Parameter and return matched records in a 
--paginated fashion.

CREATE proc [dbo].[Products_Search_Pagination]
@PageIndex int
,@PageSize int
,@Query nvarchar(100)
as

/*

Declare @PageIndex int =0
,@PageSize int = 10
,@Query nvarchar(100)= 'test'  

Execute dbo.Products_Search_Pagination @PageIndex, @PageSize, @Query 

*/

Begin

 
Declare @offset int = @PageIndex * @PageSize

SELECT p.[Id]
      ,[SKU]
      ,p.[Name]
      ,[Description]
      ,pt.[Id]
	  ,pt.Name  
      ,[VenueId]
      ,[isVisible]
      ,[isActive]
      ,f.Id
      ,dbo.fn_GetUserJSON(p.Createdby) as CreatedBy
	  ,dbo.fn_GetUserJSON(p.ModifiedBy) as ModifiedBy
		, TotalCount = COUNT(1) OVER()
FROM [dbo].[Products] as p
join dbo.ProductTypes pt on pt.id = p.ProductTypeId
join dbo.Files f on f.Id = p.PrimaryImageId
		WHERE (p.Name LIKE '%' + @Query + '%') OR (p.Description LIKE '%' + @Query + '%') OR (pt.Name LIKE '%' + @Query + '%')
        ORDER BY p.Id
		

	OFFSET @offSet Rows
	Fetch Next @PageSize Rows ONLY

End
GO
