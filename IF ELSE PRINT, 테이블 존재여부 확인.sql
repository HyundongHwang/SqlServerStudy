CREATE DATABASE hhddb;
USE hhddb;

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'mytable')
    BEGIN
        PRINT 'mytable 존재';
    END
ELSE
    BEGIN
        PRINT 'mytable 존재안함';

        CREATE TABLE mytable
        (
	        id INT PRIMARY KEY IDENTITY,
            abc char(10),
            def char(10)
        );
    END
GO
