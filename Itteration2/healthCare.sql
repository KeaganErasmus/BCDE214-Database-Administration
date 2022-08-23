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
LOAD DATA INFILE 'C:/Temp/patient.csv' INTO TABLE Patient
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;


-- testing tables 
select * from Patient;