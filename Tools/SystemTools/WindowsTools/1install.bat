@echo off
mode con cols=45 lines=20
echo С�Ǻ���װ��������
echo ======================
echo 1����װС�Ǻ����뷨��С�Ǻ����뷨��չ����
echo ע�⣺
echo һ���벻Ҫ�Ķ���װ��ַ��
echo ������ѡ���Ժ�������
"%CD%\app\weasel-0.14.0.135-installer.exe"
"%CD%\app\weasel-expansion-0.9.18.0.exe"
echo .
echo ======================
echo 2������������Զ�����
"%CD%\2update.bat"
exit