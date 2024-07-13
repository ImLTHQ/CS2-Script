:: ����
@echo off
title ȫ�Զ�����Valthrun
set controllerURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.4/controller_fb6b96a.exe
set radarURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.4/radar_client_fb6b96a.exe
set kdmapperURL=https://github.com/valthrunner/Valthrun/releases/download/4/kdmapper.exe
set driverURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.4/valthrun-driver.sys
set folder=D:\CS2-Valthrun
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
echo ��������(ʹ�� kdmapper)
%folder%\kdmapper.exe %folder%\driver.sys && echo �ɹ� || echo ʧ�� && GOTO :end

:: ѡ��
:main
echo ������ʲô��
echo [1] ����Controller
echo [2] ���������״�
echo [3] �˳�
echo [!] ������ɾ��"%folder%"���Ի�Ѱ�����˰���
echo [!] ��Ŀ��ַ ��https://github.com/ImLTHQ/CS2-Script�� ��Star!!!
set /p INPUT="������ѡ�� (1-3):"

if "%INPUT%" == "1" (
    GOTO :loadController
) else if "%INPUT%" == "2" (
    goto :loadRadar
) else if "%INPUT%" == "3" (
    goto :end
) else (
    GOTO :end
)

:: ����
:loadController
echo ����controller
%folder%\controller.exe || echo �������˳�,����%ERRORLEVEL%��������û������CS2�������ű����µ� && GOTO :main

:loadRadar
echo �����״�
%folder%\radar.exe || echo �������˳�,����%ERRORLEVEL%��������û������CS2�������ű����µ� && GOTO :main

:: ����
:end
echo ���н���
pause
exit