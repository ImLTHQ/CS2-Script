@echo off
title ȫ�Զ�����Luno
:: ����
set lunoURL=https://lunocs2.ru/request?downloadLoader
set configURL=https://github.com/ImLTHQ/CS2-Script/releases/download/main/luno-main.cfg
set cfgURL=https://lunocs2.ru/request?downloadConfigs
set folder=C:\Luno

::  ���CS
:checkCS
tasklist|find /i "cs2.exe"

if %errorlevel%==0 (
    cls
    GOTO :checkFolder
) else (
    cls
    GOTO :startCS
)

:: ����CS
:startCS
echo ����CS
echo.
powershell start "steam://rungameid/730"
GOTO :checkFolder

:: ���Ŀ¼
:checkFolder
echo �ļ��ͷ�Ŀ¼"%folder%"

if exist "%folder%" (
GOTO :download
) else (
    echo δ�ҵ�%folder%,���ڴ���
    md %folder% && echo �����ɹ�
    echo.
    GOTO :download
)

:: ����
:download
echo.
echo ����Luno
powershell wget -o %folder%\LunoLoader.exe %lunoURL% && echo - �ɹ� || GOTO :fail

echo.
echo ���ز���
powershell wget -o %folder%\luno-main.cfg %configURL% && echo - �ɹ� || echo - ʧ�ܣ��Ծ�ִ����һ��

echo.
echo �ӹ������ز���
powershell wget -o %folder%\configs.zip %cfgURL% && echo - �ɹ� || echo - ʧ�ܣ��Ծ�ִ����һ��
echo - ��ѹ������
tar -xvf %folder%\configs.zip -C %folder%
echo ɾ�������ļ�
del /Q %folder%\configs.zip
del /Q %folder%\"���������������������� �� ������������������!!!.txt"

:: ����
echo.
echo ׼������luno����ɫ��ť��ע�루ע�⣺��Ĭ�����ð�ť���ˣ�����ʱע��ᰲװ�������������
echo GUI��ݼ���ins,����ͼ�������ã����ȥѡ��luno-main��Ȼ���load���ز���
echo.
%folder%\LunoLoader.exe && GOTO :end

:: Luno����ʧ��
:fail

echo.
echo - LunoLoader����ʧ�ܣ������������ԣ���Ҫʱ����ʹ���������
pause
exit

:: ����
:end

pause
exit