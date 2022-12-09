use master
go

EXEC sp_addumpdevice 'Disk', 'AdventureWorksDevice',
'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\AdventureWorksDevice.bak';
GO
SELECT * FROM sys.backup_devices
GO

BACKUP DATABASE AdventureWorks2019
TO AdventureWorksDevice
WITH FORMAT, INIT, NAME = N'AdventureWorks Full Backup'

RESTORE HEADERONLY FROM AdventureWorksDevice

EXEC sp_dropdevice 'AdventureWorksDevice', 'delfile' 
 GO