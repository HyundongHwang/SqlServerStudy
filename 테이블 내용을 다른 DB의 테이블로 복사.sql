-- ���̺� ������ �ٸ� DB�� ����
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

SELECT * 
    INTO hhddb2.dbo.testtbl 
    FROM hhddb.dbo.testtbl;

SELECT * FROM hhddb.dbo.testtbl;
SELECT * FROM hhddb2.dbo.testtbl;