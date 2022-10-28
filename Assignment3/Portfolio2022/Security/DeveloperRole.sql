USE [master]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [Developer]    Script Date: 28/10/2022 4:39:28 PM ******/
CREATE LOGIN [Developer] WITH PASSWORD=N'WSb/osaupdU7VNrwD7KLK3Z2opLe/INpIiinyMFxlP8=', 
DEFAULT_DATABASE=[master],
DEFAULT_LANGUAGE=[us_english], 
CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO

ALTER LOGIN [Developer] DISABLE
GO

ALTER SERVER ROLE [dbcreator] ADD MEMBER [Developer]
GO


