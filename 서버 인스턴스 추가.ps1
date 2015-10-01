# 먼저 SQL Server iso 파일을 마운트한후 setup.exe 가 존재하는 경로로 이동
cd e:\

#/QS : 입력불가, 설치진행률은 표시
#/ACTION=Install : 설치(Install), 제거(Uninstall) 선택
#/IAcceptSQLServerLicenseTerms : 라이센스에 동의함
#/FEATURES=SQLENGINE : 설치항목은 데이타베이스엔진만 선택
#/INSTANCENAME=MYINST2 : 인스턴스이름, 기본이름말고 커스톰하게 지정해 보았다.
#/SECURITYMODE=SQL : 혼합모드(윈도우인증+SQL인증모드)가 설치됨, 즉 sa가 활성화된다.
#/SAPWD="mypassword" : sa의 패스워드, 역시 커스톰하게...
#/SQLSVCACCOUNT="NT AUTHORITY\System" : SQL Server 서비스의 시작계정을 시스템관리자로 설정
#/AGTSVCACCOUNT="NT AUTHORITY\System" : SQL Server 에이전트 서비스의 시작계정을 시스템관리자로 설정
#/SQLSYSADMINACCOUNTS="NT AUTHORITY\System" : 위에서 설정한 시스템관리자 로그인을 sysadmin 역할멤버로 설정
#/TCPENABLED=1 : TCP 프로토콜을 사용함으로 표시
.\setup.exe /QS /ACTION=Install /IAcceptSQLServerLicenseTerms /FEATURES=SQLENGINE /INSTANCENAME=MYINST2 /SECURITYMODE=SQL /SAPWD="mypassword" /SQLSVCACCOUNT="NT AUTHORITY\System" /AGTSVCACCOUNT="NT AUTHORITY\System" /SQLSYSADMINACCOUNTS="NT AUTHORITY\System" /TCPENABLED=1
