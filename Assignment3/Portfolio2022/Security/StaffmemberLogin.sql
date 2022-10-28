USE [master]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [StaffMember]    Script Date: 28/10/2022 4:42:26 PM ******/
CREATE LOGIN [StaffMember] WITH PASSWORD=N'hFcKH8PfNpBTmsENRzzH4V5DDqZDfoYNEsZCT9Bu08c=', 
DEFAULT_DATABASE=[master], 
DEFAULT_LANGUAGE=[us_english], 
CHECK_EXPIRATION=ON, 
CHECK_POLICY=ON
GO

ALTER LOGIN [StaffMember] DISABLE
GO


