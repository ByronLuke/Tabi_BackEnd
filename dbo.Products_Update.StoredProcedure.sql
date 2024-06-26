USE [Tabi]
GO
/****** Object:  StoredProcedure [dbo].[Products_Update]    Script Date: 4/2/2024 5:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Products_Update]

@Id int
,@SKU nvarchar(50)
,@Name nvarchar(255)
,@Description nvarchar(400)
,@ProductTypeId int
,@VenueId int
,@isVisible bit
,@isActive bit
,@PrimaryImageId int
,@CreatedBy int
,@ModifiedBy int

as

Begin

/*
Test Code

Declare @Id int = 2
		,@SKU nvarchar(50) = 'Test 2'
		,@Name nvarchar(255) = 'Test 2'
		,@Description nvarchar(400) = 'Test 2'
		,@ProductTypeId int = 1
		,@VenueId int = 2
		,@isVisible bit = 1
		,@isActive bit = 1
		,@PrimaryImageId int = 6
		,@CreatedBy int = 1
		,@ModifiedBy int = 1

Execute dbo.Products_Update @Id 
							,@SKU 
							,@Name 
							,@Description 
							,@ProductTypeId 
							,@VenueId 
							,@isVisible 
							,@isActive 
							,@PrimaryImageId
							,@CreatedBy 
							,@ModifiedBy 

*/

UPDATE [dbo].[Products]
   SET [SKU] = @SKU 
      ,[Name] = @Name 
      ,[Description] = @Description 
      ,[ProductTypeId] = @ProductTypeId 
      ,[VenueId] = @VenueId 
      ,[isVisible] = @isVisible 
      ,[isActive] = @isActive 
      ,[PrimaryImageId] = @PrimaryImageId
	  ,[DateModified] = GETUTCDATE()
      ,[CreatedBy] = @CreatedBy 
      ,[ModifiedBy] = @ModifiedBy 
 WHERE @Id = Id

 End

GO
