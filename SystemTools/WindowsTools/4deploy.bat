@echo off
CLS
mode con cols=80 lines=20
title С�Ǻ����²��𹤾�

echo ���ڳ����Զ�����
echo ���Ե�...
"C:\Program Files (x86)\Rime\weasel-0.9.30\WeaselDeployer.exe" /deploy
cls
echo ������ɣ�
"C:\Program Files (x86)\Rime\weasel-0.9.30\WeaselServer.exe" /deploy
echo.
echo ============================
echo ���л����뷨��С�Ǻ�������TSF�棬���ֶ�ɾ��TSF�汾ѡ�
echo.
echo ���������Ѵ򿪼��±���������
echo.
echo ����֮������ֱ�ɹ�
echo.
echo �رռ��±������...
notepad
echo ============================
echo ���裬��˫�����û��ļ��м���ļ�
pause
exit
