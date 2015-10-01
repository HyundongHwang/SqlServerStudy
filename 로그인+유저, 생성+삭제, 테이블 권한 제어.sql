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