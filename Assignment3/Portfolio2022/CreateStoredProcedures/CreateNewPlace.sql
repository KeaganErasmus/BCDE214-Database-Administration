-- =============================================
-- Description:	Procedure to create a New Place
-- =============================================
-- Write Your Code here
USE [Vaccinations];

DROP PROCEDURE IF EXISTS createNewPlace
GO

CREATE PROCEDURE createNewPlace
	@id char(10) = '', 
	@longName nvarchar(50) = '',
	@maxSlots tinyint = 1
AS
BEGIN
	INSERT INTO Place(id,longName,maxSlots) 
	VALUES (@id, @longName, @maxSlots)
END
GO
