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

echo ����git�汾Ϊ��
git --version
echo.

if %ERRORLEVEL% EQU 0 (
  echo ��ȡ�������
  git pull origin master
  echo ��ȡ����������
) else (
  cls
  echo.
  echo δ��װgit�����밲װgit����
  ping -n 3 127.1 >nul
  echo.
  echo ʮ����Զ��˳�...
  ping -n 10 127.1 >nul
  exit
)
echo.
echo 3���ʼ���£�Ctrl + Cֹͣ����
ping -n 3 127.1 >nul

if exist "%CD%\����\" (
  del "%CD%\����\" /S /Q
) else (
  mkdir "%CD%\����\"
)
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

cls

if exist ".\����\xkjd6.user.dict.yaml" (
  xcopy ".\����\xkjd6.user.dict.yaml" "%APPDATA%\Rime\" /Y /E
  echo �û��ʿ⻹ԭ���
) else (
  echo û���û��ʿ�����
)
if exist ".\����\xkjd6.extended.dict.yaml" (
  xcopy ".\����\xkjd6.extended.dict.yaml" "%APPDATA%\Rime\" /Y /E
  echo ��չ���û�ԭ���
) else (
  echo û����չ��������
)
if exist ".\����\xkjd6dz.extended.dict.yaml" (
  xcopy ".\����\xkjd6dz.extended.dict.yaml" "%APPDATA%\Rime\" /Y /E
  echo ������չ���û�ԭ���
) else (
  echo û�е�����չ��������
)
echo ��ԭ�û�����		���

if exist "%CD%\�û�����\" (
  xcopy ".\�û�����\*" "%APPDATA%\Rime\" /Y /E
  xcopy ".\�û�����\preview\*" "C:\Program Files (x86)\Rime\weasel-0.12.0\data\preview\" /Y /E
  echo ��ԭ�û�����		���
) else (
  mkdir "%CD%\�û�����\"
)

type ..\rime\Windows\_*.txt
echo.
echo.

echo �Ѱ�װ��ɣ�
echo.
echo ���²���
"%CD%\4deploy.bat"
exit