:: 设置
@echo off
title 全自动部署Valthrun
:: 变量
set controllerURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.5/controller_dced9bd.exe
set radarURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.5/radar_client_862f57b.exe
set kdmapperURL=https://github.com/valthrunner/Valthrun/releases/download/4/kdmapper.exe
set driverURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.5/valthrun-driver.sys
set folder=D:\CS2-Valthrun
set githubURL=https://github.com/ImLTHQ/CS2-Script

::  检查CS
:checkCS
tasklist|find /i "cs2.exe"

if %errorlevel%==0 (
    cls
    GOTO :checkFolder
) else (
    cls
    GOTO :startCS
)

:: 启动CS
:startCS
echo 启动CS
echo.
powershell start "steam://rungameid/730"
GOTO :checkFolder

:: 检查
:checkFolder
echo 文件释放目录"%folder%"
echo · Valthrun Wiki https://wiki.valth.run/zh-cn/
echo · 为了让 Valthrun 正常工作，必须禁用一些Windows 安全功能。请参考 https://wiki.valth.run/zh-cn/troubleshooting/kernel/windows_security_features

if exist "%folder%" (
GOTO :downloadController
) else (
    echo.
    echo 未找到%folder%,正在创建
    md %folder% && echo 创建成功
    GOTO :downloadController
)

:: 下载
:downloadController
if exist "%folder%\controller.exe" GOTO :downloadRadar
echo.
echo 下载controller %controllerURL%
powershell wget -o %folder%\controller.exe %controllerURL% && echo 成功 || echo 失败 && GOTO :end

:downloadRadar
if exist "%folder%\radar.exe" GOTO :downloadKdmapper
echo.
echo 下载雷达 %radarURL%
powershell wget -o %folder%\radar.exe %radarURL% && echo 成功 || echo 失败 && GOTO :end

:downloadKdmapper
if exist "%folder%\kdmapper.exe" GOTO :downloadDriver
echo.
echo 下载kdmapper %kdmapperURL%
powershell wget -o %folder%\kdmapper.exe %kdmapperURL% && echo 成功 || echo 失败 && GOTO :end

:downloadDriver
if exist "%folder%\driver.sys" GOTO :loadDriver
echo.
echo 下载驱动 %driverURL%
powershell wget -o %folder%\driver.sys %driverURL% && echo 成功 || echo 失败 && GOTO :end

:: 加载驱动
:loadDriver
echo.
echo 以管理员身份加载驱动(使用 kdmapper)
%folder%\kdmapper.exe %folder%\driver.sys && echo 成功 && GOTO :main
GOTO :errorKdmapper

:: kdmapper报错
:errorKdmapper
echo.
echo 失败，请以管理员身份重新运行脚本，并截图寻求他人帮助
echo 出现"系统无法执行指定的程序"可能是Windows安全中心报毒隔离
echo 请观察终端，找到 [+] DriverEntry returned "内容"
echo - 内容为0xCF000004 是Valthrun 驱动程序已加载
echo - 内容为0xCF000003 是Valthrun 驱动程序初始化失败。
echo - 内容为0xCF000002 是设置 Valthrun 驱动程序的函数调用失败。
echo - 内容为0xCF000001 是Valthrun 日志系统无法初始化。这种情况很罕见
echo - 内容为0xc0000603 请尝试在"Windows安全中心>设备安全性>内核隔离详细信息"中禁用"易受攻击的驱动程序阻止列表"
GOTO :end

:: 选择
:main
echo.
echo 你想做什么？
echo [1] 启动Controller
echo [2] 启动网络雷达
echo [3] 帮助
echo [4] 退出
echo [#] 项目地址 "%githubURL%" ，Star!!!
echo [!] 出错可删除"%folder%"重试或寻求他人帮助

set /p INPUT="请输入选项并回车 (1-4):"

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

:: 帮助
:help
echo.
echo · 没有pause键请参考 https://wiki.valth.run/zh-cn/troubleshooting/overlay/pause_key
echo · AMD用户在运行Controller后游戏黑屏请使用专业版显卡驱动或将显卡驱动降级至23.7.1
echo · 终端显示“Failed to load vulkan-1.dll (os error 14001)” 请参考 https://wiki.valth.run/zh-cn/troubleshooting/overlay/amd_opengl 方案2，3，5
echo · 更多加载驱动方法请参考 https://wiki.valth.run/zh-cn/getting-started/driver/
GOTO :main

:: 启动
:loadController
echo.
echo 启动controller
echo · GUI快捷键是pause。
echo · Valthrun不支持CS2全屏模式
%folder%\controller.exe
echo 非正常退出,代码%ERRORLEVEL%。
GOTO :main

:loadRadar
echo.
echo 启动雷达
%folder%\radar.exe
echo 非正常退出,代码%ERRORLEVEL%。
GOTO :main

:: 结束
:end
echo.
echo 运行结束
pause
exit
