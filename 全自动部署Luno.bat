@echo off
title ȫ�Զ�����Luno
:: ����
set lunoURL=https://lunocs2.ru/request?downloadLoader
set configURL=https://github.com/ImLTHQ/CS2-Script/releases/download/main/Luno-CFG.zip
set cfgURL=https://lunocs2.ru/request?downloadConfigs
set folder=C:\Luno
set githubURL=https://github.com/ImLTHQ/CS2-Script

::  ���CS
:checkCS
tasklist|find /i "cs2.exe"

if %errorlevel%==0 (
    cls
    GOTO :checkFolder
) else (
    cls
    GOTO :runCS
)

:: ����CS
:runCS
echo ����CS
echo.
powershell start "steam://rungameid/730"
GOTO :checkFolder

:: ���Ŀ¼
:checkFolder
echo �ļ��ͷ�Ŀ¼"%folder%"

if exist "%folder%" (
GOTO :downloadLuno
) else (
    echo - δ�ҵ�%folder%,���ڴ���
    md %folder% && echo - �����ɹ�
    echo.
    GOTO :downloadLuno
)

:: ����
:downloadLuno
echo ����Luno
powershell wget -o %folder%\LunoLoader.exe %lunoURL% && echo - �ɹ� || GOTO :fail

:downloadConfig
echo.
echo ���ز���
powershell wget -o %folder%\Luno-CFG.zip %configURL% && GOTO :downloadConfigSuccess || GOTO :downloadConfigFail

:downloadConfigSuccess
echo - �ɹ�
echo - ��ѹ������
tar -xvf %folder%\Luno-CFG.zip -C %folder%
echo - ɾ�������ļ�
del /Q %folder%\Luno-CFG.zip
GOTO :downloadCFG

:downloadConfigFail
echo - ʧ�ܣ��Ծ�ִ����һ��
GOTO :downloadCFG

:downloadCFG
echo.
echo �ӹ������ز���
powershell wget -o %folder%\configs.zip %cfgURL% && GOTO :downloadCFGSuccess || GOTO :downloadCFGFail

:downloadCFGSuccess
echo - �ɹ�
echo - ��ѹ������
tar -xvf %folder%\configs.zip -C %folder%
echo - ɾ�������ļ�
del /Q %folder%\configs.zip
del /Q %folder%\"���������������������� �� ������������������!!!.txt"
GOTO :runLuno

:downloadCFGFail
echo - ʧ�ܣ��Ծ�ִ����һ��
GOTO :runLuno

:: ����
:runLuno
echo.
echo ��Ŀ��ַ "%githubURL%" ��Star!!!
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