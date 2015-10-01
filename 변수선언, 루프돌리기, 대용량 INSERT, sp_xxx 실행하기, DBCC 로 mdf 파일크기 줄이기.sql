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



-- 테이블용량 DB용량 측정
EXEC sp_spaceused testtbl;
EXEC sp_helpdb hhddb;



-- 테이블에 대량데이타 삽입
DECLARE @i INT = 1;
DECLARE @num INT = 1024 * 100;
WHILE @i < @num
    BEGIN
        INSERT INTO testtbl values(REPLICATE('a', 1024));
        SET @i = @i + 1;
    END

SELECT *
FROM testtbl;

SELECT COUNT(*)
FROM testtbl;

-- 테이블용량 DB용량 측정
EXEC sp_spaceused testtbl;
EXEC sp_helpdb hhddb;



-- 테이블 비우기
TRUNCATE TABLE testtbl;

-- 테이블용량 DB용량 측정
EXEC sp_spaceused testtbl;
EXEC sp_helpdb hhddb;



-- DB 빈공간 압축
DBCC SHRINKDATABASE (hhddb);

-- 테이블용량 DB용량 측정
-- 실제로 파일용량이 감소 했으면 성공
EXEC sp_spaceused testtbl;
EXEC sp_helpdb hhddb;