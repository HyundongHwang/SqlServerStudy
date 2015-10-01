ALTER LOGIN sa WITH PASSWORD = 'lotte200';

USE LTPOS;

select * from sys.tables;
drop table KMSG_QUEUE;

CREATE DATABASE hhddb;
USE hhddb;

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'mytable')
    BEGIN
        PRINT 'mytable 존재';
    END
else
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








-- sa 로그인
-- hhddb, testtbl 초기화
USE tempdb;

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'hhddb')
    BEGIN
        PRINT 'hhddb 존재함';
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
INSERT INTO testtbl values('가나다');



-- 로그인 생성
CREATE LOGIN myuser
    WITH PASSWORD = 'mypassword',
    CHECK_POLICY = off,
    CHECK_EXPIRATION = off;

-- 유저 생성
CREATE USER myuser FOR LOGIN myuser;

-- 로그인과 유저가 잘 생성되었는지 확인
SELECT * FROM sys.syslogins;
SELECT * FROM sys.sysusers;



-- myuser로 로그인
USE hhddb;

-- 테이블 select 실패
SELECT * FROM testtbl;



-- sa로 로그인
USE hhddb;

-- 테이블 권한 할당
GRANT ALL ON testtbl to myuser;



-- myuser로 로그인
USE hhddb;

-- 테이블 select 성공
SELECT * FROM testtbl;






-- sa로 로그인
USE hhddb;

-- 로그인과 유저를 삭제
DROP LOGIN myuser;
DROP USER myuser;

-- 로그인과 유저가 잘 삭제 되었는지 확인
SELECT * FROM sys.syslogins;
SELECT * FROM sys.sysusers;








-- sa 로그인
-- DB 생성, 테이블 초기화
USE tempdb;

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'hhddb')
    BEGIN
        PRINT 'hhddb 존재함';
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
INSERT INTO testtbl values('가나다');


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
INSERT INTO testtbl values('가나다');

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
INSERT INTO testtbl values('가나다');

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






-- DB 백업, 복원
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
INSERT INTO testtbl values('가나다');

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

insert into pubTbl values ('이순신', 27, '123456-1234567');
insert into pubTbl values ('이방원', 28, '123456-1234568');
insert into pubTbl values ('이성계', 29, '123456-1234569');

select * 
from pubTbl;

