@echo off
CLS
mode con cols=80 lines=20
title С�Ǻ����²��𹤾�

echo ���ڳ����Զ�����
echo ���Ե�...

if exist "C:\Program Files (x86)\Rime\weasel-0.13.0\WeaselDeployer.exe" (
"C:\Program Files (x86)\Rime\weasel-0.13.0\WeaselDeployer.exe" /deploy
)

if exist "C:\Program Files (x86)\Rime\weasel-0.14.0\WeaselDeployer.exe" (
"C:\Program Files (x86)\Rime\weasel-0.14.0\WeaselDeployer.exe" /deploy
)

cls
echo ������ɣ�
echo ������ɣ����Թر�����

if exist "C:\Program Files (x86)\Rime\weasel-0.13.0\WeaselServer.exe" (
"C:\Program Files (x86)\Rime\weasel-0.13.0\WeaselServer.exe"
)

if exist "C:\Program Files (x86)\Rime\weasel-0.14.0\WeaselServer.exe" (
"C:\Program Files (x86)\Rime\weasel-0.14.0\WeaselServer.exe"
)

exit
