@echo off
CLS
mode con cols=80 lines=20
title С�Ǻ�����ƹ���
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

echo �ѿ�ʼ�����Ե�...
for %%i in ("../../../rime") do set thisTime1=%%~ti
git pull
for %%i in ("../../../rime") do set thisTime2=%%~ti
if "%thisTime1%"=="%thisTime2%" (
  echo ���������ˡ���
  ping -n 6 127.1 >nul
  exit
  pause
)
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
xcopy ".\����\xkjd6.user.dict.yaml" "%APPDATA%\Rime\" /Y /E
xcopy ".\����\xkjd6.extended.dict.yaml" "%APPDATA%\Rime\" /Y /E
xcopy ".\����\xkjd6dz.extended.dict.yaml" "%APPDATA%\Rime\" /Y /E
echo ��ԭ�û�����		���
cls
type ..\rime\Windows\_*.txt
echo.
echo.
echo �Ѱ�װ��ɣ�
echo.
echo ���²���
start %CD%\4deploy.bat
exit