--Define a Logical Backup Device for a Disk File 
USE Vaccinations ;  
GO 
EXEC sp_addumpdevice 'disk', 'mydiskdump', 'D:\BCDE214\BCDE214-Database-Administration\Assignment3\Portfolio2022\Backup\Vaccinations.bak' ;  
GO  

-- Create a full database backup first.
BACKUP DATABASE [Vaccinations]    
   TO mydiskdump   
   WITH INIT;  
GO

-- Time elapses.  
-- Create a differential database backup, appending the backup  
-- to the backup device containing the full database backup.
BACKUP DATABASE [Vaccinations]  
   TO mydiskdump  
   WITH DIFFERENTIAL;  
GO  

BACKUP LOG [Vaccinations]  
   TO mydiskdump
   WITH NORECOVERY; 
GO 

RESTORE DATABASE [Vaccinations]   
   FROM mydiskdump  
   WITH NORECOVERY;  
GO  

RESTORE DATABASE [Vaccinations]  
   FROM mydiskdump  
   WITH FILE = 2,  
   RECOVERY;  
GO 

RESTORE LOG [Vaccinations]  
   FROM mydiskdump  
   WITH RECOVERY;  
GO  