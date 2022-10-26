USE Vaccinations
GO

--A view that shows each vaccination place, with the total number of vaccinations that could happen each day, and the number of vaccinations actually happening or booked each day. 
CREATE OR ALTER VIEW vaccinationsHappening
AS
SELECT placeId, count(apptTime) as vacinations
from Appointment
WHERE vaccineNumber IS NOT NULL
Group BY placeId

SELECT * FROM vaccinationsHappening
GO

CREATE OR ALTER VIEW vaccinationsBookedAndHappening
AS
SELECT Appointment.placeId, count(slot) as 'Num Vaccinations that could happen', vacinations as 'Vaccinations booked/happening'
from Appointment
inner join vaccinationsHappening on Appointment.placeId = vaccinationsHappening.placeId
Group BY Appointment.placeId, vaccinationsHappening.vacinations;

SELECT * FROM vaccinationsBookedAndHappening;
GO

--A view showing all people that have missed a booking, and do not have a later booking.  We will want to contact these people, so include names and contact details.
CREATE OR ALTER VIEW listMissedAppointments
AS
SELECT preferredName, eMail, phone 
FROM Person
inner join Appointment ON Person.NHI = Appointment.personId
WHERE Appointment.vaccinator IS NULL

SELECT * FROM listMissedAppointments
GO

--A view that can be used to show people broken down by age in decades as at the date of their first vaccination.  Only show people that have been vaccinated.
CREATE OR ALTER VIEW listPeople
AS
SELECT preferredName, DATEDIFF(YEAR, dateOfBirth, GETDATE()) as AGE, vaccineNumber
FROM Person
inner join Appointment ON personId = Person.NHI
WHERE vaccineNumber >= 1

SELECT * FROM listPeople
GO

--A view showing the number of sessions and the number of vaccines all vaccinators have done.  Include those vaccinators that have yet to vaccinate anybody.
SELECT * FROM Appointment