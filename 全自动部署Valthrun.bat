:: ׼��
@echo off
title ȫ�Զ�����Valthrun
set controllerURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.4/controller_fb6b96a.exe
set radarURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.4/radar_client_fb6b96a.exe
set kdmapperURL=https://github.com/valthrunner/Valthrun/releases/download/4/kdmapper.exe
set driverURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.4/valthrun-driver.sys
echo �ļ��ͷ�Ŀ¼D:\CS2-Valthrun

:controller
if exist "D:\CS2-Valthrun\controller.exe" GOTO :radar
echo ׼������controller %controllerURL%
powershell wget -o D:\CS2-Valthrun\controller.exe %controllerURL% && echo �ɹ� || echo controller����ʧ�� && GOTO :end

:radar
if exist "D:\CS2-Valthrun\radar.exe" GOTO :kdmapper
echo ׼�������״� %radarURL%
powershell wget -o D:\CS2-Valthrun\radar.exe %radarURL% && echo �ɹ� || echo �״�����ʧ�� && GOTO :end

:kdmapper
if exist "D:\CS2-Valthrun\kdmapper.exe" GOTO :driver
echo ׼������kdmapper %kdmapperURL%
powershell wget -o D:\CS2-Valthrun\kdmapper.exe %kdmapperURL% && echo �ɹ� || echo kdmapper����ʧ�� && GOTO :end

:driver
if exist "D:\CS2-Valthrun\driver.sys" GOTO :loadDriver
echo ׼���������� %driverURL%
powershell wget -o D:\CS2-Valthrun\driver.sys %driverURL% && echo �ɹ� || echo driver����ʧ�� && GOTO :end

:loadDriver
echo ��������(ʹ�� kdmapper)
D:\CS2-Valthrun\kdmapper.exe D:\CS2-Valthrun\driver.sys && echo ���سɹ� || echo ����ʧ�� && GOTO :end

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
D:\CS2-Valthrun\controller.exe || echo controller�������˳���������û������CS2�������ű����µ� && GOTO :end

:loadRadar
echo �����״�
D:\CS2-Valthrun\radar.exe || echo �״�������˳���������û������CS2�������ű����µ� && GOTO :end

:end
echo ���н���
pause
exit