-- =============================================
-- Description:	Procedure to create an appointment
-- =============================================
USE Vaccinations

DROP PROCEDURE IF EXISTS createAppointment
GO

CREATE PROCEDURE createAppointment
	@placeId char(10) = '', 
	@slot tinyint = 1,
	@apptTime datetime2(0) = NULL,
	@personId char(12) = NULL
AS
BEGIN
	INSERT INTO Appointment(placeId,slot,apptTime,personId) 
		VALUES (@placeId, @slot, @apptTime, @personId)
END

-- Test

EXEC createAppointment @placeID = 'Geraldine ', @slot = 1, @apptTime = '2021-08-2', @personId = 'AAB0052';

select * FROM Person