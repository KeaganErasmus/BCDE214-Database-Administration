-- Drop database healthCare;
-- Create database healthCare;
use healthCare;

-- DROP TABLE IF EXISTS Patient;
-- DROP TABLE IF EXISTS Carer;
-- DROP TABLE IF EXISTS ContactLog;
-- DROP TABLE IF EXISTS Worker;
-- DROP TABLE IF EXISTS Contactor;

-- Create the Patient table
CREATE TABLE IF NOT EXISTS Patient
(
patID varchar(4),
patFName varchar(25),
patLName varchar(25),
patPhoneNum varchar(15),
DOB date,
PRIMARY KEY (patID)
);
-- Loading data into the patient table 
SET FOREIGN_KEY_CHECKS=0;
LOAD DATA INFILE 'D:/BCDE214/BCDE214-Database-Administration/Itteration2/tables/patient.csv' INTO TABLE Patient
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- Create the Carer table
CREATE TABLE IF NOT EXISTS Carer
(
carerID varchar(4),
carerFName varchar(25),
carerLName varchar(25),
carerPhoneNum varchar(15),
PRIMARY KEY(carerID)
);

SET FOREIGN_KEY_CHECKS=0;
LOAD DATA INFILE 'D:/BCDE214/BCDE214-Database-Administration/Itteration2/tables/carer.csv' INTO TABLE Carer
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- Create Contactor table
CREATE TABLE IF NOT EXISTS Contactor
(
carerID varchar(4),
patID varchar(4),
FOREIGN KEY (patID) REFERENCES Patient(patID),
FOREIGN KEY (carerID) REFERENCES Carer(carerID),
PRIMARY KEY (carerID, patID)
);

SET FOREIGN_KEY_CHECKS=0;
LOAD DATA INFILE 'D:/BCDE214/BCDE214-Database-Administration/Itteration2/tables/contactor.csv' INTO TABLE Contactor
FIELDS TERMINATED BY ',';
-- IGNORE 1 ROWS;


-- Create Worker table
CREATE TABLE IF NOT EXISTS Worker
(
workerID varchar(4),
workerFName varchar(25),
workerLName varchar(25),
PRIMARY KEY (workerID)
);

SET FOREIGN_KEY_CHECKS=0;
LOAD DATA INFILE 'D:/BCDE214/BCDE214-Database-Administration/Itteration2/tables/worker.csv' INTO TABLE Worker
FIELDS TERMINATED BY ',';
-- IGNORE 1 ROWS;

-- Create ContactLog table
CREATE TABLE IF NOT EXISTS ContactLog
(
contactID varchar(4),
logDate date,
workerID varchar(4),
patID varchar(4),
carerID varchar(4),
PRIMARY KEY (contactID),
FOREIGN KEY (workerID) REFERENCES Worker(workerID),
FOREIGN KEY (carerID) REFERENCES Contactor(carerID),
FOREIGN KEY (patID) REFERENCES Contactor(patID)
);

SET FOREIGN_KEY_CHECKS=0;
LOAD DATA INFILE 'D:/BCDE214/BCDE214-Database-Administration/Itteration2/tables/contactLog.csv' INTO TABLE ContactLog
FIELDS TERMINATED BY ',';
-- IGNORE 1 ROWS;

-- testing tables 
select * from Patient;
select * from Carer;
select * from Contactor;
select * from ContactLog;
select * from Worker;