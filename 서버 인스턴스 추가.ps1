# ���� SQL Server iso ������ ����Ʈ���� setup.exe �� �����ϴ� ��η� �̵�
cd e:\

#/QS : �ԷºҰ�, ��ġ������� ǥ��
#/ACTION=Install : ��ġ(Install), ����(Uninstall) ����
#/IAcceptSQLServerLicenseTerms : ���̼����� ������
#/FEATURES=SQLENGINE : ��ġ�׸��� ����Ÿ���̽������� ����
#/INSTANCENAME=MYINST2 : �ν��Ͻ��̸�, �⺻�̸����� Ŀ�����ϰ� ������ ���Ҵ�.
#/SECURITYMODE=SQL : ȥ�ո��(����������+SQL�������)�� ��ġ��, �� sa�� Ȱ��ȭ�ȴ�.
#/SAPWD="mypassword" : sa�� �н�����, ���� Ŀ�����ϰ�...
#/SQLSVCACCOUNT="NT AUTHORITY\System" : SQL Server ������ ���۰����� �ý��۰����ڷ� ����
#/AGTSVCACCOUNT="NT AUTHORITY\System" : SQL Server ������Ʈ ������ ���۰����� �ý��۰����ڷ� ����
#/SQLSYSADMINACCOUNTS="NT AUTHORITY\System" : ������ ������ �ý��۰����� �α����� sysadmin ���Ҹ���� ����
#/TCPENABLED=1 : TCP ���������� ��������� ǥ��
.\setup.exe /QS /ACTION=Install /IAcceptSQLServerLicenseTerms /FEATURES=SQLENGINE /INSTANCENAME=MYINST2 /SECURITYMODE=SQL /SAPWD="mypassword" /SQLSVCACCOUNT="NT AUTHORITY\System" /AGTSVCACCOUNT="NT AUTHORITY\System" /SQLSYSADMINACCOUNTS="NT AUTHORITY\System" /TCPENABLED=1
