CREATE TABLE [Register].[Table]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [FirstName] NCHAR(20) NOT NULL, 
    [LastName] NCHAR(20) NOT NULL, 
    [Email] NCHAR(50) NOT NULL, 
    [Password] NCHAR(10) NOT NULL, 
    [Date] DATE NOT NULL, 
    [Gender] NCHAR(10) NOT NULL, 
    [Insurance] NCHAR(50) NOT NULL
)
