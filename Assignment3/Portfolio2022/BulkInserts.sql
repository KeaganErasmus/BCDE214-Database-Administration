USE [Vaccinations];

SELECT * FROM [dbo].[AllPeople];

SELECT * FROM [dbo].[Appointment];

SELECT * FROM [dbo].[OldAppointment];

SELECT * FROM [dbo].[Person];

SELECT * FROM [dbo].[Place];

DELETE FROM Place;

SELECT * FROM [dbo].[Vaccinator];

-- Bulk inser into Person table
BULK INSERT [dbo].[Person]
FROM 'D:\BCDE214\BCDE214-Database-Administration\Assignment3\Portfolio2022\Vaccine2021Data\People.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

-- Bulk inser into Place table
BULK INSERT [dbo].[Place]
FROM 'D:\BCDE214\BCDE214-Database-Administration\Assignment3\Portfolio2022\Vaccine2021Data\Sites.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);


-- Bulk inser into Vaccinator table
BULK INSERT [dbo].[Vaccinator]
FROM 'D:\BCDE214\BCDE214-Database-Administration\Assignment3\Portfolio2022\Vaccine2021Data\Vaccinators.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);