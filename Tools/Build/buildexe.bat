@echo off
if exist "..\SystemTools\WindowsTools\����" (
  mkdir "..\..\..\����"
  xcopy "..\SystemTools\WindowsTools\����" "..\..\..\����" /y /e
  echo �û��ʿⱸ�����
  rmdir /S /Q "..\SystemTools\WindowsTools\����"
)

if exist "Rime_JD.7z" (
  del Rime_JD.7z /S /Q
  echo ɾ�����ļ�
)

if exist "Rime_JD.exe" (
  del Rime_JD.exe /S /Q
  echo ɾ�����ļ�
)


echo ��ʼ����7zip
7z a -m1=LZMA Rime_JD.7z ..\..\