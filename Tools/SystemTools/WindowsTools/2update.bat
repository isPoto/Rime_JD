@echo off
CLS
mode con cols=80 lines=20
title С�Ǻ�������ƹ���
:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion
:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )
:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO.
ECHO ********************************
ECHO ���� UAC Ȩ����׼����
ECHO ********************************
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B
:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

echo ================================
echo ԭRime�ļ���������"%CD%\����\"
echo *��ȷ���ϼ��ļ�����rime�ļ���
echo.
echo                      �������ʼ
echo ================================
pause
echo �ѿ�ʼ�����Ե�...
mkdir "%CD%\����\"
del "%CD%\����\" /S /Q
xcopy "%APPDATA%\Rime" "%CD%\����\" /Y /E
cls
echo ����ԭ�дʿ�		���
taskkill /f /im WeaselServer.exe
del "%APPDATA%\Rime\" /S /Q
xcopy "..\..\..\rime" "%APPDATA%\Rime\" /Y /E
echo ��������ļ�		���
rmdir "%APPDATA%\Rime\Windows" /S /Q
echo ɾ�������ļ�		���
xcopy "..\rime\Windows\*" "%APPDATA%\Rime\" /Y /E
echo ���ƶ�������		���
xcopy ".\����\xkjd6.dict.cizu.yaml" "%APPDATA%\Rime\" /Y /E
echo ��ԭ�û�����		���
cls
type ..\rime\Windows\_*.txt
echo.
echo.
echo �Ѱ�װ��ɣ�
echo.
echo ���²���
start 4deploy.bat
exit