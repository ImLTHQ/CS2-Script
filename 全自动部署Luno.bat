:: ����
@echo off
title luno���˽ű�(�Զ���ȡ����luno�������Ե�����������luno)
set lunoURL=https://lunocs2.ru/request?downloadLoader
set configURL=https://github.com/ImLTHQ/CS2-Script/releases/download/main/luno-main.cfg
set folder=C:\Luno
echo �ļ��ͷ�Ŀ¼"%folder%"

:: ���
:checkFolder
if exist "%folder%" (
GOTO :download
) else (
    echo δ�ҵ�%folder%,���ڴ���
    md %folder% && echo �����ɹ�
    GOTO :download
)

:: ����
:download
echo.
echo ����Luno
powershell wget -o %folder%\LunoLoader.exe %lunoURL% && echo �ɹ� || GOTO :fail
echo.
echo ���ز���
powershell wget -o %folder%\luno-main.cfg %configURL% && echo �ɹ� || echo ʧ�ܣ��Ծ�ִ����һ��

:: ����
echo.
echo ����luno����ɫ��ť��ע��(ע�⣺��Ĭ�����ð�ť���ˣ�����ʱע��ᰲװ�����������)
echo GUI��ݼ���ins,����ͼ�������ã����ȥѡ��luno-main��Ȼ���load���ز���
%folder%\LunoLoader.exe && exit

:: ����������
:fail
echo LunoLoader����ʧ�ܣ������������ԣ���Ҫʱ����ʹ���������
pause
exit