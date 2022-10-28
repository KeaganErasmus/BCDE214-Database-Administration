USE Vaccinations
GO
 
DROP TRIGGER IF EXISTS appointmentChange

CREATE OR ALTER TRIGGER appointmentChange
ON [dbo].[Appointment]
AFTER UPDATE
AS
BEGIN
	DECLARE @reason varchar(50);
	DECLARE @id int;
	DECLARE @personId char(10);

	select @id = id ,@personId = personId from Appointment
	-- id of the changed appointment
	where id = 1489

	SET @reason = 'Changed appointment'
	SET @id = @id
	SET @personId = @personId

	insert into OldAppointment (id, personId, reason, missed)
	Values (@id, @personId, @reason, 1)
	-- show the oldAppointment table after the trigger gets activated
	select * from OldAppointment
END 

-- TEST
DELETE FROM OldAppointment
EXEC addPersonToAppointment @id=1489, @personId='FZC6224', @vaccineNumber=2