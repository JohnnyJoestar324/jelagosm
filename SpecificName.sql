
IF EXISTS (
  SELECT * 
    FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE SPECIFIC_SCHEMA = N'dbo'
     AND SPECIFIC_NAME = N'backupsProcedure' 
)
   DROP PROCEDURE dbo.backupsProcedure
GO

CREATE PROCEDURE dbo.backupsProcedure
	@Name varchar(150) 
AS
	BACKUP DATABASE AdventureWorks2019 
	TO  AdventureWorksDevice 
WITH 
	NOFORMAT, 
	NO_COMPRESSION,
	NOINIT,  
	NAME = @Name, 
	SKIP, 
	STATS = 10;


GO

EXEC dbo.backupsProcedure 'Johnny Backup'
EXEC dbo.backupsProcedure 'Eduardo Backup'
EXEC dbo.backupsProcedure 'Lagos Backup'
EXEC dbo.backupsProcedure 'Martinez Backup'


