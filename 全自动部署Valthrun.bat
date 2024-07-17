:: ����
@echo off
title ȫ�Զ�����Valthrun
:: ����
set controllerURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.4/controller_fb6b96a.exe
set radarURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.4/radar_client_fb6b96a.exe
set kdmapperURL=https://github.com/valthrunner/Valthrun/releases/download/4/kdmapper.exe
set driverURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.4/valthrun-driver.sys
set folder=D:\CS2-Valthrun
set githubURL=https://github.com/ImLTHQ/CS2-Script

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

:: ���
:checkFolder
echo �ļ��ͷ�Ŀ¼"%folder%"
echo �� Valthrun Wiki https://wiki.valth.run/zh-cn/
echo �� Ϊ���� Valthrun �����������������һЩWindows ��ȫ���ܡ���ο� https://wiki.valth.run/zh-cn/troubleshooting/kernel/windows_security_features

if exist "%folder%" (
GOTO :downloadController
) else (
    echo.
    echo δ�ҵ�%folder%,���ڴ���
    md %folder% && echo �����ɹ�
    GOTO :downloadController
)

:: ����
:downloadController
if exist "%folder%\controller.exe" GOTO :downloadRadar
echo.
echo ����controller %controllerURL%
powershell wget -o %folder%\controller.exe %controllerURL% && echo �ɹ� || echo ʧ�� && GOTO :end

:downloadRadar
if exist "%folder%\radar.exe" GOTO :downloadKdmapper
echo.
echo �����״� %radarURL%
powershell wget -o %folder%\radar.exe %radarURL% && echo �ɹ� || echo ʧ�� && GOTO :end

:downloadKdmapper
if exist "%folder%\kdmapper.exe" GOTO :downloadDriver
echo.
echo ����kdmapper %kdmapperURL%
powershell wget -o %folder%\kdmapper.exe %kdmapperURL% && echo �ɹ� || echo ʧ�� && GOTO :end

:downloadDriver
if exist "%folder%\driver.sys" GOTO :loadDriver
echo.
echo �������� %driverURL%
powershell wget -o %folder%\driver.sys %driverURL% && echo �ɹ� || echo ʧ�� && GOTO :end

:: ��������
:loadDriver
echo.
echo �Թ���Ա��ݼ�������(ʹ�� kdmapper)
%folder%\kdmapper.exe %folder%\driver.sys && echo �ɹ� && GOTO :main
GOTO :errorKdmapper

:: kdmapper����
:errorKdmapper
echo.
echo ʧ�ܣ����Թ���Ա����������нű�������ͼѰ�����˰���
echo ����"ϵͳ�޷�ִ��ָ���ĳ���"������Windows��ȫ���ı�������
echo ��۲��նˣ��ҵ� [+] DriverEntry returned "����"
echo - ����Ϊ0xCF000004 ��Valthrun ���������Ѽ���
echo - ����Ϊ0xCF000003 ��Valthrun ���������ʼ��ʧ�ܡ�
echo - ����Ϊ0xCF000002 ������ Valthrun ��������ĺ�������ʧ�ܡ�
echo - ����Ϊ0xCF000001 ��Valthrun ��־ϵͳ�޷���ʼ������������ܺ���
echo - ����Ϊ0xc0000603 �볢����"Windows��ȫ����>�豸��ȫ��>�ں˸�����ϸ��Ϣ"�н���"���ܹ���������������ֹ�б�"
GOTO :end

:: ѡ��
:main
echo.
echo ������ʲô��
echo [1] ����Controller
echo [2] ���������״�
echo [3] ����
echo [4] �˳�
echo [#] ��Ŀ��ַ "%githubURL%" ��Star!!!
echo [!] �����ɾ��"%folder%"���Ի�Ѱ�����˰���

set /p INPUT="������ѡ��س� (1-4):"

if "%INPUT%" == "1" (
    GOTO :loadController
) else if "%INPUT%" == "2" (
    GOTO :loadRadar
) else if "%INPUT%" == "3" (
    GOTO :help
) else if "%INPUT%" == "4" (
    GOTO :end
) else (
    GOTO :end
)

:: ����
:help
echo.
echo �� û��pause����ο� https://wiki.valth.run/zh-cn/troubleshooting/overlay/pause_key
echo �� AMD�û�������Controller����Ϸ������ʹ��רҵ���Կ��������Կ�����������23.7.1
echo �� �ն���ʾ��Failed to load vulkan-1.dll (os error 14001)�� ��ο� https://wiki.valth.run/zh-cn/troubleshooting/overlay/amd_opengl ����2��3��5
echo �� �����������������ο� https://wiki.valth.run/zh-cn/getting-started/driver/
GOTO :main

:: ����
:loadController
echo.
echo ����controller
echo �� GUI��ݼ���pause��
echo �� Valthrun��֧��CS2ȫ��ģʽ
%folder%\controller.exe
echo �������˳�,����%ERRORLEVEL%��
GOTO :main

:loadRadar
echo.
echo �����״�
%folder%\radar.exe
echo �������˳�,����%ERRORLEVEL%��
GOTO :main

:: ����
:end
echo.
echo ���н���
pause
exit