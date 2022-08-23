-- Drop database healthCare;
Create database healthCare;
use healthCare;

-- Create the Patient table
DROP TABLE IF EXISTS Patient;
create table Patient
(
ID varchar(4) Primary key,
FName varchar(25),
LName varchar(25),
patPhoneNum varchar(15),
DOB date
);
-- Loading data into the patient table 
SET FOREIGN_KEY_CHECKS=0;
LOAD DATA LOCAL INFILE 'D:/BCDE214/BCDE214-Database-Administration/Itteration2/tables/patient.csv' INTO TABLE Patient
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- Create the Carer table
DROP TABLE IF EXISTS Carer;
CREATE TABLE Carer
(
ID varchar(4) Primary Key,
FName varchar(25),
LName varchar(25),
carerPhoneNum varchar(15)
);

LOAD DATA LOCAL INFILE 'D:/BCDE214/BCDE214-Database-Administration/Itteration2/tables/carer.csv' INTO TABLE Carer
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- testing tables 
select * from Patient;
select * from Carer;