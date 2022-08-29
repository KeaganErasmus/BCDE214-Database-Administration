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