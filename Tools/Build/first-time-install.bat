@echo off
mode con cols=45 lines=20
echo С�Ǻ���װ��������
echo ======================
echo 1����װС�Ǻ����뷨��С�Ǻ����뷨��չ����
echo ע�⣺
echo һ���벻Ҫ�Ķ���װ��ַ��
echo ������ѡ���Ժ�������
"Tools\SystemTools\WindowsTools\app\weasel-0.12.0.0-installer.exe"
"Tools\SystemTools\WindowsTools\app\weasel-expansion-0.9.18.0.exe"
echo .
echo ======================
echo 2������������Զ�����
CLS

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
  echo δ��װgit���򣬽���װgit����
  "Tools\Build\Git-2.19.2-64-bit.exe"
  echo ��ȡ�������
  git pull origin master
  echo ��ȡ����������
)
echo.
echo ��ȡ�����������
echo.

if exist "Tools\SystemTools\WindowsTools\����\" (
  del "Tools\SystemTools\WindowsTools\����\" /S /Q
) else (
  mkdir "Tools\SystemTools\WindowsTools\����\"
)
xcopy "%APPDATA%\Rime" "Tools\SystemTools\WindowsTools\����\" /Y /E
cls
echo ����ԭ�дʿ�		���

taskkill /f /im WeaselServer.exe
del "%APPDATA%\Rime\" /S /Q
xcopy "rime" "%APPDATA%\Rime\" /Y /E
echo ��������ļ�		���

rmdir "%APPDATA%\Rime\Windows" /S /Q
echo ɾ�������ļ�		���

xcopy "Tools\SystemTools\rime\Windows\*" "%APPDATA%\Rime\" /Y /E
echo ���ƶ�������		���

cls

if exist "Tools\SystemTools\WindowsTools\����\xkjd6.user.dict.yaml" (
  xcopy "Tools\SystemTools\WindowsTools\����\xkjd6.user.dict.yaml" "%APPDATA%\Rime\" /Y /E
  echo �û��ʿ⻹ԭ���
) else (
  echo û���û��ʿ�����
)
if exist "Tools\SystemTools\WindowsTools\����\xkjd6.extended.dict.yaml" (
  xcopy "Tools\SystemTools\WindowsTools\����\xkjd6.extended.dict.yaml" "%APPDATA%\Rime\" /Y /E
  echo ��չ���û�ԭ���
) else (
  echo û����չ��������
)
if exist "Tools\SystemTools\WindowsTools\����\xkjd6dz.extended.dict.yaml" (
  xcopy "Tools\SystemTools\WindowsTools\����\xkjd6dz.extended.dict.yaml" "%APPDATA%\Rime\" /Y /E
  echo ������չ���û�ԭ���
) else (
  echo û�е�����չ��������
)
echo ��ԭ�û�����		���

if exist "Tools\SystemTools\WindowsTools\�û�����\" (
  xcopy "Tools\SystemTools\WindowsTools\�û�����\*" "%APPDATA%\Rime\" /Y /E
  xcopy "Tools\SystemTools\WindowsTools\�û�����\preview\*" "C:\Program Files (x86)\Rime\weasel-0.12.0\data\preview\" /Y /E
  echo ��ԭ�û�����		���
) else (
  mkdir "Tools\SystemTools\WindowsTools\�û�����\"
)

type "Tools\SystemTools\rime\Windows\_*.txt"
echo.
echo.

echo �Ѱ�װ��ɣ�
echo.
echo ���²���
title С�Ǻ����²��𹤾�
cls
echo ���ڳ����Զ�����
echo ���Ե�...
"C:\Program Files (x86)\Rime\weasel-0.12.0\WeaselDeployer.exe" /deploy
cls
echo ������ɣ�
echo ���Թر����ˣ���װ���
"C:\Program Files (x86)\Rime\weasel-0.12.0\WeaselServer.exe"
exit