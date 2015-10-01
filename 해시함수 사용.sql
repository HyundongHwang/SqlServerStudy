-- 해시함수 사용
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