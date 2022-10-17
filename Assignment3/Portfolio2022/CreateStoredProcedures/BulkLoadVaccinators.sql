-- Write your code here
USE [Vaccinations];

DROP PROCEDURE IF EXISTS bulkLoadVaccinators
GO

CREATE PROCEDURE bulkLoadVaccinators
	@fileName varchar(100) = ''
AS
BEGIN
	DECLARE @sqlString varchar(512) = '' -- The string that is being executed to bulk load the data
	
	--  Create the temporary table to load the data by copying the structure
	DROP TABLE IF EXISTS #newVaccinators
	SELECT TOP 0 * INTO #newVaccinators FROM Vaccinator

	-- Create and execute the sql string.  The quotes are important
	SET @sqlString = '
	BULK INSERT #newVaccinators
	FROM '''  + @fileName + '''
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = '','',
		ROWTERMINATOR=''\n''
	)'
	EXECUTE (@sqlString)

	-- Use a cursor to loop through the temporary table, and load the data into the permanent table
	-- Variables data read from
	DECLARE @iRDNumber char(10)
	DECLARE @preferredname nchar(20)

		-- the cursor declared 
	DECLARE newVaccinatorCursor CURSOR FOR
		SELECT iRDNumber FROM #newVaccinators
		-- Open Cursor
	OPEN newVaccinatorCursor

		-- Loop through the cursor until there is no more data
	FETCH NEXT FROM newVaccinatorCursor INTO @iRDNumber
	-- We have not started fetching yet!!
	WHILE @@FETCH_STATUS = 0
		BEGIN
			-- Get the data from the temporary table
			SELECT @iRDNumber = iRDNumber, @preferredname = preferredName
				FROM #newVaccinators
				WHERE iRDNumber = @iRDNumber
			-- Run the procedure that enters the data
			EXEC [dbo].[createVaccinator] @iRDNumber=@iRDNumber, @preferredName=@preferredname
			-- Get the next lot of data
			FETCH NEXT FROM newVaccinatorCursor INTO @iRDNumber
		END

	-- Tidy up
	CLOSE newVaccinatorCursor -- close the cursor
	DEALLOCATE newVaccinatorCursor -- Free up the memory
	DROP TABLE #newVaccinators -- Purge the Temp Table
END

-- Testing data
DELETE FROM Vaccinator
EXEC bulkLoadVaccinators @fileName = 'D:\BCDE214\BCDE214-Database-Administration\Assignment3\Portfolio2022\Vaccine2021Data\Vaccinators.csv'
SELECT * FROM Vaccinator


