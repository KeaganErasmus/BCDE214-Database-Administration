USE Vaccinations

DROP PROCEDURE IF EXISTS changeAppointment
GO

CREATE PROCEDURE changeAppointment
	@oldId int = NULL, 
	@newId int = NULL,
	@reason varchar(50) = NULL,
	@missed bit = 0
	 
AS
BEGIN
	DECLARE @personId char(12)
	SET @personId = (SELECT personId FROM Appointment WHERE id = @oldId)
	DECLARE @vaccineNumber tinyint
	SET @vaccineNumber = (SELECT vaccineNumber FROM Appointment WHERE id = @oldId)
	-- update teh set of old ones
	INSERT INTO OldAppointment(id,personId,missed,reason) 
		VALUES (@oldId, @personId, @missed,@reason)
	IF @missed=0	-- Only delete if changed prior to booking time
	BEGIN
		UPDATE Appointment
			SET personId=@personId WHERE id= @oldId
	END
	-- Create teh new appointment
	EXEC addPersonToAppointment @id=@newId, @personId=@personId, @vaccineNumber=@vaccineNumber
END

-- Test
EXEC changeAppointment @oldId = 1032, @newId = 1023, @reason = 'asda', @missed = 1

select * from OldAppointment