-- Drop database healthCare;
-- Create database healthCare;
use healthCare;

DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS Carer;
DROP TABLE IF EXISTS ContactLog;
DROP TABLE IF EXISTS Worker;
DROP TABLE IF EXISTS Contactor;

-- Create the Patient table
CREATE TABLE IF NOT EXISTS Patient
(
patID varchar(4),
FName varchar(25),
LName varchar(25),
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
FName varchar(25),
LName varchar(25),
carerPhoneNum varchar(15),
PRIMARY KEY(carerID)
);

-- Create Contactor table
CREATE TABLE IF NOT EXISTS Contactor
(
carerID varchar(4),
patID varchar(4),
PRIMARY KEY (carerID, patID)
);

-- Create Worker table
CREATE TABLE IF NOT EXISTS Worker
(
workerID varchar(4),
FName varchar(25),
LName varchar(25),
PRIMARY KEY (workerID)
);

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
FOREIGN KEY (patID) REFERENCES Patient(patID),
FOREIGN KEY (carerID) REFERENCES Carer(carerID),
FOREIGN KEY (carerID ,patID) REFERENCES Contactor(carerID ,patID)
);

-- testing tables 
select * from Patient;