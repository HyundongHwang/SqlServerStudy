ALTER LOGIN sa WITH PASSWORD = 'lotte200';

USE LTPOS;

select * from sys.tables;
drop table KMSG_QUEUE;

CREATE DATABASE hhddb;
USE hhddb;

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'mytable')
    BEGIN
        PRINT 'mytable ����';
    END
else
    BEGIN
        PRINT 'mytable �������';

        CREATE TABLE mytable
        (
	        id INT PRIMARY KEY IDENTITY,
            abc char(10),
            def char(10)
        );
    END
GO



use hhddb;

create table test
(
    txt varchar(max)
);



exec sp_spaceused test2;
exec sp_helpdb hhddb;

create table test2
(
    txt varchar(max)
);

declare @i int = 1;
declare @num int = 1024 * 100;
while @i < @num
    begin
        insert into test2 values(REPLICATE('a', 1024));
        set @i = @i + 1;
    end

select *
from test2;

select COUNT(*)
from test2;

exec sp_spaceused test2;
exec sp_helpdb hhddb;

truncate table test2;

exec sp_spaceused test2;
exec sp_helpdb hhddb;

dbcc shrinkdatabase (hhddb);

exec sp_spaceused test2;
exec sp_helpdb hhddb;








-- sa �α���
-- hhddb, testtbl �ʱ�ȭ
USE tempdb;

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'hhddb')
    BEGIN
        PRINT 'hhddb ������';
        DROP DATABASE hhddb;
    END
GO

CREATE DATABASE hhddb;
USE hhddb;

CREATE TABLE testtbl
(
    txt VARCHAR(MAX)
);

INSERT INTO testtbl values('abc');
INSERT INTO testtbl values('123');
INSERT INTO testtbl values('������');



-- �α��� ����
CREATE LOGIN myuser
    WITH PASSWORD = 'mypassword',
    CHECK_POLICY = off,
    CHECK_EXPIRATION = off;

-- ���� ����
CREATE USER myuser FOR LOGIN myuser;

-- �α��ΰ� ������ �� �����Ǿ����� Ȯ��
SELECT * FROM sys.syslogins;
SELECT * FROM sys.sysusers;



-- myuser�� �α���
USE hhddb;

-- ���̺� select ����
SELECT * FROM testtbl;



-- sa�� �α���
USE hhddb;

-- ���̺� ���� �Ҵ�
GRANT ALL ON testtbl to myuser;



-- myuser�� �α���
USE hhddb;

-- ���̺� select ����
SELECT * FROM testtbl;






-- sa�� �α���
USE hhddb;

-- �α��ΰ� ������ ����
DROP LOGIN myuser;
DROP USER myuser;

-- �α��ΰ� ������ �� ���� �Ǿ����� Ȯ��
SELECT * FROM sys.syslogins;
SELECT * FROM sys.sysusers;








-- sa �α���
-- DB ����, ���̺� �ʱ�ȭ
USE tempdb;

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'hhddb')
    BEGIN
        PRINT 'hhddb ������';
        ALTER DATABASE hhddb SET SINGLE_USER;
        DROP DATABASE hhddb;
    END

CREATE DATABASE hhddb;
ALTER DATABASE hhddb SET MULTI_USER;
USE hhddb;

CREATE TABLE testtbl
(
    txt VARCHAR(MAX),
);

INSERT INTO testtbl values('abc');
INSERT INTO testtbl values('123');
INSERT INTO testtbl values('������');


drop database hhddb2;
CREATE DATABASE hhddb2;
use hhddb2;
select * into hhddb2.dbo.testtbl from  hhddb.dbo.testtbl;




DROP DATABASE hhddb;
CREATE DATABASE hhddb;

USE hhddb;

CREATE TABLE testtbl
(
    txt VARCHAR(MAX),
);

INSERT INTO testtbl values('abc');
INSERT INTO testtbl values('123');
INSERT INTO testtbl values('������');

DROP DATABASE hhddb2;
CREATE DATABASE hhddb2;

SELECT * INTO hhddb2.dbo.testtbl FROM hhddb.dbo.testtbl;






USE tempdb;
DROP DATABASE hhddb;
CREATE DATABASE hhddb;
USE hhddb;

CREATE TABLE testtbl
(
    id varchar(max),
    passwordHash varchar(max),
);

INSERT INTO testtbl VALUES ('myuserid', HASHBYTES('SHA2_512', 'mypassword' +'1234'));

SELECT * FROM testtbl;






USE tempdb;
DROP DATABASE hhddb;
CREATE DATABASE hhddb;
USE hhddb;

CREATE TABLE testtbl
(
    txt varchar(max),
);

INSERT INTO testtbl values('abc');
INSERT INTO testtbl values('123');
INSERT INTO testtbl values('������');

select * from testtbl;

use tempdb;

restore database hhddb 
    from disk = 'c:\project\150827_SqlServerStudy\hhddb.bak' 
    with replace;

alter database hhddb set offline;

alter database hhddb set online;

use master;

create master key
    encryption by password = 'mypassword';

create certificate mycert
    with subject = 'mycertsubject';

create database encryption key
    with algorithm = aes_256
    encryption by server certificate mycert;

alter database hhddb set encryption on;

backup master key to file = 'c:\project\150827_SqlServerStudy\mycert_masterkey_backup'
    encryption by password = 'mypassword';

backup certificate mycert to file = 'c:\project\150827_SqlServerStudy\mycert_backup';

alter database hhddb set offline;

alter database hhddb set online;






-- DB ���, ����
USE tempdb;

DROP DATABASE AdventureWorks;

RESTORE DATABASE AdventureWorks FROM DISK = 'c:\project\150827_SqlServerStudy\AdventureWorks.bak'
    WITH STATS;

BACKUP DATABASE AdventureWorks
    TO DISK = 'c:\project\150827_SqlServerStudy\AdventureWorks.bak'
    WITH STATS;















USE tempdb;
DROP DATABASE hhddb;
CREATE DATABASE hhddb;
USE hhddb;

CREATE TABLE testtbl
(
    txt varchar(max),
);

INSERT INTO testtbl values('abc');
INSERT INTO testtbl values('123');
INSERT INTO testtbl values('������');

select * from testtbl;





use tempdb;

create database hhddb;



select @@PROCID as PROCID;
select @@SERVERNAME as SERVERNAME;
select @@SERVICENAME as SERVICENAME;
select @@VERSION as VERSION;







drop database hhddb;
create database hhddb;
use hhddb;

create table pubTbl
(
    id int identity primary key,
    memberName nchar(5),
    age smallint,
    jumin char(14),
);

insert into pubTbl values ('�̼���', 27, '123456-1234567');
insert into pubTbl values ('�̹��', 28, '123456-1234568');
insert into pubTbl values ('�̼���', 29, '123456-1234569');

select * 
from pubTbl;

