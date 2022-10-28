USE Vaccinations
GO

SELECT * FROM Appointment

--1 A view that shows each vaccination place, with the total number of vaccinations that could happen each day, and the number of vaccinations actually happening or booked each day. 
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

--2 A view showing all people that have missed a booking, and do not have a later booking.  We will want to contact these people, so include names and contact details.
CREATE OR ALTER VIEW listMissedAppointments
AS
SELECT preferredName, eMail, phone 
FROM Person
inner join OldAppointment ON Person.NHI = OldAppointment.personId
WHERE OldAppointment.missed = 1

SELECT * FROM listMissedAppointments

--3 A view that can be used to show people broken down by age in decades as at the date of their first vaccination.  Only show people that have been vaccinated.
-- lists people and their age range base on when the appointment took place
CREATE OR ALTER VIEW listPeople
AS
SELECT preferredName, ROUND(DATEDIFF(YEAR, dateOfBirth, apptTime), -1, 1) as AgeRangeByDecade, vaccineNumber
FROM Person
inner join Appointment ON personId = Person.NHI
WHERE vaccineNumber >= 1

SELECT * FROM listPeople
GO

--4 A view showing the number of sessions and the number of vaccines all vaccinators have done.  Include those vaccinators that have yet to vaccinate anybody.
CREATE OR ALTER VIEW groupSessions AS
SELECT vaccinator, CONCAT(placeId, '- ', CONVERT(VARCHAR(20), CONVERT(date, apptTime))) AS ApptSession
FROM Appointment
GROUP BY vaccinator, CONCAT(placeId, '- ', CONVERT(VARCHAR(20), CONVERT(date, apptTime)))
GO

CREATE OR ALTER VIEW vaccinatorSessions AS
SELECT vaccinator, COUNT(vaccinator) AS numOfSessions 
FROM groupSessions
WHERE vaccinator IS NOT NULL
GROUP BY vaccinator
GO

CREATE OR ALTER VIEW vaccinatorActivity AS
SELECT v.preferredName as Va, numOfSessions AS numOfSessions, COUNT(a.vaccinator) AS numOfVaccines
FROM vaccinatorSessions vc
INNER JOIN Appointment a 
ON vc.vaccinator = a.vaccinator
RIGHT JOIN Vaccinator v
ON a.vaccinator = v.iRDNumber
GROUP BY v.preferredName, numOfSessions
GO

SELECT * FROM VaccinatorActivity
