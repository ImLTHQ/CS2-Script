:: ׼��
@echo off
title ȫ�Զ�����Valthrun
set controllerURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.4/controller_fb6b96a.exe
set radarURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.4/radar_client_fb6b96a.exe
set kdmapperURL=https://github.com/valthrunner/Valthrun/releases/download/4/kdmapper.exe
set driverURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.4/valthrun-driver.sys
set folder=D:\CS2-Valthrun
echo �ļ��ͷ�Ŀ¼"%folder%"

:checkFolder
if exist "%folder%" (
GOTO :controller
) else (
    echo δ�ҵ�%folder%,׼�������ļ���
    md %folder% && echo �����ɹ�
    GOTO :controller
)

:controller
if exist "%folder%\controller.exe" GOTO :radar
echo ׼������controller %controllerURL%
powershell wget -o %folder%\controller.exe %controllerURL% && echo �ɹ� || echo controller����ʧ�� && GOTO :end

:radar
if exist "%folder%\radar.exe" GOTO :kdmapper
echo ׼�������״� %radarURL%
powershell wget -o %folder%\radar.exe %radarURL% && echo �ɹ� || echo �״�����ʧ�� && GOTO :end

:kdmapper
if exist "%folder%\kdmapper.exe" GOTO :driver
echo ׼������kdmapper %kdmapperURL%
powershell wget -o %folder%\kdmapper.exe %kdmapperURL% && echo �ɹ� || echo kdmapper����ʧ�� && GOTO :end

:driver
if exist "%folder%\driver.sys" GOTO :loadDriver
echo ׼���������� %driverURL%
powershell wget -o %folder%\driver.sys %driverURL% && echo �ɹ� || echo driver����ʧ�� && GOTO :end

:loadDriver
echo ��������(ʹ�� kdmapper)
%folder%\kdmapper.exe %folder%\driver.sys && echo ���سɹ� || echo ����ʧ�� && GOTO :end

:: ѡ��
:main
echo ������ʲô��
echo [1] ����Controller
echo [2] ���������״�
echo [3] �˳�
set /p INPUT="������ѡ�� (1-3): "

if "%INPUT%" == "1" (
    GOTO :loadController
) else if "%INPUT%" == "2" (
    goto :loadRadar
) else if "%INPUT%" == "3" (
    goto :end
) else (
    GOTO :end
)

:loadController
echo ����controller
%folder%\controller.exe || echo controller�������˳���������û������CS2�������ű����µ� && GOTO :end

:loadRadar
echo �����״�
%folder%\radar.exe || echo �״�������˳���������û������CS2�������ű����µ� && GOTO :end

:end
echo ���н���
pause
exit