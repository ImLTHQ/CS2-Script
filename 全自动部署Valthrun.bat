:: 准备
@echo off
title 全自动部署Valthrun
set controllerURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.4/controller_fb6b96a.exe
set radarURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.4/radar_client_fb6b96a.exe
set kdmapperURL=https://github.com/valthrunner/Valthrun/releases/download/4/kdmapper.exe
set driverURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.4/valthrun-driver.sys
set folder=D:\CS2-Valthrun
echo 文件释放目录"%folder%"

:checkFolder
if exist "%folder%" (
GOTO :controller
) else (
    echo 未找到%folder%,准备创建文件夹
    md %folder% && echo 创建成功
    GOTO :controller
)

:controller
if exist "%folder%\controller.exe" GOTO :radar
echo 准备下载controller %controllerURL%
powershell wget -o %folder%\controller.exe %controllerURL% && echo 成功 || echo controller下载失败 && GOTO :end

:radar
if exist "%folder%\radar.exe" GOTO :kdmapper
echo 准备下载雷达 %radarURL%
powershell wget -o %folder%\radar.exe %radarURL% && echo 成功 || echo 雷达下载失败 && GOTO :end

:kdmapper
if exist "%folder%\kdmapper.exe" GOTO :driver
echo 准备下载kdmapper %kdmapperURL%
powershell wget -o %folder%\kdmapper.exe %kdmapperURL% && echo 成功 || echo kdmapper下载失败 && GOTO :end

:driver
if exist "%folder%\driver.sys" GOTO :loadDriver
echo 准备下载驱动 %driverURL%
powershell wget -o %folder%\driver.sys %driverURL% && echo 成功 || echo driver下载失败 && GOTO :end

:loadDriver
echo 加载驱动(使用 kdmapper)
%folder%\kdmapper.exe %folder%\driver.sys && echo 加载成功 || echo 加载失败 && GOTO :end

:: 选择
:main
echo 你想做什么？
echo [1] 启动Controller
echo [2] 启动网络雷达
echo [3] 退出
set /p INPUT="请输入选项 (1-3): "

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
echo 启动controller
%folder%\controller.exe || echo controller非正常退出，可能是没有启动CS2就启动脚本导致的 && GOTO :end

:loadRadar
echo 启动雷达
%folder%\radar.exe || echo 雷达非正常退出，可能是没有启动CS2就启动脚本导致的 && GOTO :end

:end
echo 运行结束
pause
exit