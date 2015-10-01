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