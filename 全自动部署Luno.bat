:: ����
@echo off
title luno���˽ű�(�Զ���ȡ����luno�������Ե�����������luno)
set lunoURL=https://lunocs2.ru/request?downloadLoader
set configURL=https://github.com/ImLTHQ/CS2-Script/releases/download/main/luno-main.cfg
set folder=C:\Luno
echo �ļ��ͷ�Ŀ¼"%folder%"

:: ���
:checkAdmin
net session >nul 2>&1 && (
    GOTO :checkFolder
) || (
    echo ���Թ���Ա������У�
    GOTO :end
)
:checkFolder
if exist "%folder%" (
GOTO :downloadController
) else (
    echo δ�ҵ�%folder%,���ڴ���
    md %folder% && echo �����ɹ�
    GOTO :downloadController
)

:: ����
:download
echo ����Luno
powershell wget -o %folder%\LunoLoader.exe %lunoURL% && echo �ɹ� || echo ʧ�� && GOTO :end
echo ���ز���
powershell wget -o %folder%\luno-main.cfg %configURL% && echo �ɹ� || echo ʧ�� && GOTO :end

:: ����
echo ����luno����ɫ��ť��ע��(ע�⣺��Ĭ�����ð�ť���ˣ�����ʱע��ᰲװ�����������)
%folder%\LunoLoader.exe || echo �������˳�,����%ERRORLEVEL%�� && GOTO :end

:: ����
:end
echo ���н���
pause
exit