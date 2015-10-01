-- DB 백업, 복원
USE tempdb;

DROP DATABASE AdventureWorks;

RESTORE DATABASE AdventureWorks FROM DISK = 'c:\project\150827_SqlServerStudy\AdventureWorks.bak'
    WITH STATS;

BACKUP DATABASE AdventureWorks
    TO DISK = 'c:\project\150827_SqlServerStudy\AdventureWorks.bak'
    WITH STATS;