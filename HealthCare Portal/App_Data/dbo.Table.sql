CREATE TABLE [dbo].[Table]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Fname] NCHAR(20) NOT NULL, 
    [Lname] NCHAR(20) NOT NULL, 
    [Email] NCHAR(50) NOT NULL, 
    [Password] NCHAR(10) NOT NULL, 
    [DateOB] DATE NOT NULL, 
    [Phone] INT NOT NULL, 
    [Gender] NCHAR(10) NULL, 
    [Insurance] NCHAR(20) NULL
)
