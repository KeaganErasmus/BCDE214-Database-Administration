USE healthcare;

-- Creating a view to see what patient is connected to what carer
CREATE VIEW patient_carer_relationship AS
SELECT ContactLog.patID, Patient.patFName, ContactLog.carerID, Carer.carerFName
from ContactLog
inner join Contactor
inner join Patient on ContactLog.patID = Patient.patID
inner join Carer on ContactLog.carerID = Carer.carerID
group by Carer.carerID;

select * from patient_carer_relationship;

-- Creating a view if we need to find a way to contact the patient
CREATE VIEW patient_contact AS
SELECT Patient.patID, Patient.patFname, Patient.patPhoneNum
from Contactlog
inner join Contactor
inner join Patient on Contactlog.patID = Patient.patID;

SELECT * FROM patient_contact;

-- Creating a view to see patients that are over the age of 90
CREATE VIEW patient_over_90 AS
select Patient.patID, Patient.patFName, timestampdiff(YEAR, DOB, CURDATE()) AS AGE
from Contactlog
inner join Contactor
inner join Patient on Contactlog.patID = Patient.patID
where timestampdiff(YEAR, DOB, CURDATE()) >= 90
group by Patient.patID;

SELECT * FROM patient_over_90;
