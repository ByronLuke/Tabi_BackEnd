USE [Tabi]
GO
/****** Object:  StoredProcedure [dbo].[Products_Insert]    Script Date: 4/2/2024 5:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Products_Insert]

@Id int OUTPUT
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

BEGIN

/*
WHEN VENUE TABLE IS COMPLETE THE SECOND JOIN WILL BE IMPLEMENTED
FOR NOW VENUEID IS INDIVIDUAL VALUE

TEST CODE FOR V1

Declare @Id int = 1
		,@SKU nvarchar(50) ='Test 8'
		,@Name nvarchar(255) ='Test 8'
		,@Description nvarchar(400) ='Test 8'	
		,@ProductTypeId int = 3
		,@VenueId int = 2
		,@isVisible bit = 1
		,@isActive bit = 1
		,@PrimaryImageId int = 6
		,@CreatedBy int = 1
		,@ModifiedBy int = 1


Execute dbo.Products_Insert @Id OUTPUT
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


INSERT INTO [dbo].[Products]
           ([SKU]
           ,[Name]
           ,[Description]
           ,[ProductTypeId]
           ,[VenueId]
           ,[isVisible]
           ,[isActive]
           ,[PrimaryImageId]
           ,[CreatedBy]
           ,[ModifiedBy])
     VALUES
           (@SKU
           ,@Name 
           ,@Description 
		   ,@ProductTypeId
           ,@VenueId 
           ,@isVisible 
           ,@isActive 
           ,@PrimaryImageId
           ,@CreatedBy 
           ,@ModifiedBy)
		   SET @Id = SCOPE_IDENTITY()

End


GO
