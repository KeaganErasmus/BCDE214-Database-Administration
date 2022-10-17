-- Description:	Create Procedure to Bulk Load Appointments
-- =============================================

-- Write Your Code
USE [Vaccinations];
SELECT * FROM Appointment;

DROP PROCEDURE IF EXISTS bulkLoadAppointments
GO

CREATE PROCEDURE bulkLoadAppointments
	-- Loads a file of places into the Place table.  No error checking.
	@fileName varchar(100) = ''	-- The file name where the data is being loaded from
AS
BEGIN
	DECLARE @sqlString varchar(512) = '' -- The string that is being executed to bulk load the data
	
	--  Create the temporary table to load the data by copying the structure
	DROP TABLE IF EXISTS #newAppointment
	SELECT TOP 0 * INTO #newAppointment FROM Appointment

	-- Create and execute the sql string.  The quotes are important
	SET @sqlString = '
	BULK INSERT #newAppointment
	FROM '''  + @fileName + '''
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = '','',
		ROWTERMINATOR=''\n''
	)'
	EXECUTE (@sqlString)

	-- Use a cursor to loop through the temporary table, and load the data into the permanent table
	-- Variables data read from
	DECLARE @id int
	DECLARE @placeId char(10)
	DECLARE @slot tinyint
	DECLARE @apptTime datetime2(0)

	-- the cursor declared 
	DECLARE newAppointmentCursor CURSOR FOR
		SELECT id FROM #newAppointment
		-- Open Cursor
	OPEN newAppointmentCursor
	
	-- Loop through the cursor until there is no more data
	FETCH NEXT FROM newAppointmentCursor INTO @id
	-- We have not started fetching yet!!
	WHILE @@FETCH_STATUS = 0
		BEGIN
			-- Get the data from the temporary table
			SELECT @id = id, @placeId = placeId, @slot = slot, @apptTime = apptTime
				FROM #newAppointment
				WHERE id = @id
			-- Run the procedure that enters the data
			
			EXEC createAppointment @placeId = @placeId, @slot = @slot, @apptTime = @apptTime
			-- Get the next lot of data
			FETCH NEXT FROM newAppointmentCursor INTO @id
		END

	-- Tidy up
	CLOSE newAppointmentCursor -- close the cursor
	DEALLOCATE newAppointmentCursor -- Free up the memory
	DROP TABLE #newAppointment -- Purge the Temp Table
END 
GO

-- Testing data
DELETE FROM Appointment
GO
SELECT * FROM Appointment
GO
EXEC bulkLoadAppointments @fileName = 'D:\BCDE214\BCDE214-Database-Administration\Assignment3\Portfolio2022\Vaccine2021Data\SiteSessions.csv'
GO
SELECT count(*) AS AppointmentCount FROM Appointment


