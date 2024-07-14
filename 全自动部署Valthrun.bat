:: ����
@echo off
title ȫ�Զ�����Valthrun
set controllerURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.4/controller_fb6b96a.exe
set radarURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.4/radar_client_fb6b96a.exe
set kdmapperURL=https://github.com/valthrunner/Valthrun/releases/download/4/kdmapper.exe
set driverURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.4/valthrun-driver.sys
set folder=D:\CS2-Valthrun
set githubURL=https://github.com/ImLTHQ/CS2-Script

echo �ļ��ͷ�Ŀ¼��%folder%��
echo �� Valthrun Wiki ��https://wiki.valth.run/zh-cn/��
echo �� Ϊ���� Valthrun �����������������һЩWindows ��ȫ���ܡ���ο���https://wiki.valth.run/zh-cn/troubleshooting/kernel/windows_security_features��
echo.

:: ���
:checkFolder
if exist "%folder%" (
GOTO :downloadController
) else (
    echo δ�ҵ�%folder%,���ڴ���
    md %folder% && echo �����ɹ�
    GOTO :downloadController
)

:: ����
:downloadController
if exist "%folder%\controller.exe" GOTO :downloadRadar
echo ����controller %controllerURL%
powershell wget -o %folder%\controller.exe %controllerURL% && echo �ɹ� || echo ʧ�� && GOTO :end

:downloadRadar
if exist "%folder%\radar.exe" GOTO :downloadKdmapper
echo �����״� %radarURL%
powershell wget -o %folder%\radar.exe %radarURL% && echo �ɹ� || echo ʧ�� && GOTO :end

:downloadKdmapper
if exist "%folder%\kdmapper.exe" GOTO :downloadDriver
echo ����kdmapper %kdmapperURL%
powershell wget -o %folder%\kdmapper.exe %kdmapperURL% && echo �ɹ� || echo ʧ�� && GOTO :end

:downloadDriver
if exist "%folder%\driver.sys" GOTO :loadDriver
echo �������� %driverURL%
powershell wget -o %folder%\driver.sys %driverURL% && echo �ɹ� || echo ʧ�� && GOTO :end

:: ��������
:loadDriver
echo �Թ���Ա��ݼ�������(ʹ�� kdmapper)
%folder%\kdmapper.exe %folder%\driver.sys && echo �ɹ� && GOTO :main
GOTO :errorKdmapper

:: kdmapper����
:errorKdmapper
echo ʧ�ܣ����Թ���Ա����������нű�������ͼѰ�����˰���
echo ��۲��նˣ��ҵ� [+] DriverEntry returned "����"
echo ����Ϊ0xCF000004 ��Valthrun ���������Ѽ���
echo ����Ϊ0xCF000003 ��Valthrun ���������ʼ��ʧ�ܡ�������鿴 DebugView��
echo ����Ϊ0xCF000002 ������ Valthrun ��������ĺ�������ʧ�ܡ�������鿴 DebugView��
echo ����Ϊ0xCF000001 ��Valthrun ��־ϵͳ�޷���ʼ������������ܺ���
echo ����Ϊ0xc0000603 �ܿ���������ʹ�� intel ����������Ϊ���ܹ������������� ��kdmapper issue #65�����볢���ڡ�Windows��ȫ����>�豸��ȫ��>�ں˸�����ϸ��Ϣ���н��á����ܹ���������������ֹ�б�
GOTO :end

:: ѡ��
:main
echo.
echo ������ʲô��
echo [1] ����Controller
echo [2] ���������״�
echo [3] ����
echo [4] �˳�
echo [!] �����ɾ��"%folder%"���Ի�Ѱ�����˰���
echo [!] ��Ŀ��ַ ��%githubURL%�� ��Star!!!

set /p INPUT="������ѡ�� (1-4):"

if "%INPUT%" == "1" (
    GOTO :loadController
) else if "%INPUT%" == "2" (
    GOTO :loadRadar
) else if "%INPUT%" == "3" (
    GOTO :help
) else if "%INPUT%" == "4" (
    exit
) else (
    exit
)

:: ����
:help
echo.
echo �� û��pause����ο���https://wiki.valth.run/zh-cn/troubleshooting/overlay/pause_key��
echo �� AMD�û�������Controller����Ϸ������ʹ��רҵ���Կ��������Կ�����������23.7.1
echo �� �ն���ʾ��Failed to load vulkan-1.dll (os error 14001)�� ��ο���https://wiki.valth.run/zh-cn/troubleshooting/overlay/amd_opengl�� ����2��3��5
echo �� �����������������ο���https://wiki.valth.run/zh-cn/getting-started/driver/��
GOTO :main

:: ����
:loadController
echo.
echo ����controller
echo �� GUI��ݼ���pause��
echo �� Valthrun��֧��CS2ȫ��ģʽ
%folder%\controller.exe
echo �������˳�,����%ERRORLEVEL%��������û������CS2������controller���µ�
GOTO :main

:loadRadar
echo.
echo �����״�
%folder%\radar.exe
echo �������˳�,����%ERRORLEVEL%��������û������CS2�������״ﵼ�µ�
GOTO :main

:: ����
:end
echo ���н���
pause
exit