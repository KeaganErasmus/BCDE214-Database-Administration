-- =============================================
-- Description:	Procedure to create a New Person
-- =============================================
USE [Vaccinations];
DROP PROCEDURE IF EXISTS createPerson
GO

CREATE PROCEDURE createPerson
	@NHI char(12) = '', 
	@preferredName nchar(20) = '',
	@dateOfBirth date,
	@eMail varchar(50) = NULL,
	@phone char(20) = NULL,
	@preferredContactMethod char(10) = 'text'
AS
BEGIN
	INSERT INTO [dbo].[Person](NHI,preferredName,dateOfBirth,eMail,phone,preferredContactMethod) 
		VALUES (@NHI, @preferredname, @dateOfBirth, @eMail,@phone,@preferredContactMethod)
END
GO
