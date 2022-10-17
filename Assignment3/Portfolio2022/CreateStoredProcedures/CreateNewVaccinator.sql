-- =============================================
-- Description:	Procedure to create a New Vaccinator
-- =============================================
-- Write your code here
USE [Vaccinations];

SELECT * FROM Vaccinator;

DROP PROCEDURE IF EXISTS createVaccinator
GO

CREATE PROCEDURE createVaccinator
	@iRDNumber char(10) = '',
	@preferredName nchar(20) = ''
AS
BEGIN
	INSERT INTO Vaccinator(iRDNumber, preferredName)
		VALUES(@iRDNumber, @preferredName)
END

EXEC createVaccinator @iRDNumber = 10, @preferredName = 'Keagan';