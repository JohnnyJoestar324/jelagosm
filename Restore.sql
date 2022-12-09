

RESTORE FILELISTONLY FROM AdventureWorksDevice
GO


IF EXISTS (
  SELECT * 
    FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE SPECIFIC_SCHEMA = N'dbo'
     AND SPECIFIC_NAME = N'Restore_Backup' 
)
   DROP PROCEDURE dbo.Restore_Backup
GO

CREATE PROCEDURE dbo.Restore_Backup
	@File smallint
AS
	RESTORE DATABASE AdventureWorks2019
	FROM  AdventureWorksDevice 
WITH FILE = @File,  
	MOVE N'AdventureWorks2017' 
	TO 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AwExamenBDII_Restore.mdf',
	Move N'AdventureWorks2017_log' 
	TO 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AwExamenBDII_Restore_lg.ldf',
	NOUNLOAD,  
	REPLACE,
	STATS = 10

GO


EXECUTE dbo.Restore_Backup 6
GO
