-- 테이블 내용을 다른 DB로 복사
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

SELECT * 
    INTO hhddb2.dbo.testtbl 
    FROM hhddb.dbo.testtbl;

SELECT * FROM hhddb.dbo.testtbl;
SELECT * FROM hhddb2.dbo.testtbl;