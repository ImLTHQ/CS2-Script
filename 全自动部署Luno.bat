@echo off
title 全自动部署Luno
:: 变量
set lunoURL=https://lunocs2.ru/request?downloadLoader
set configURL=https://github.com/ImLTHQ/CS2-Script/releases/download/main/luno-main.cfg
set cfgURL=https://lunocs2.ru/request?downloadConfigs
set folder=C:\Luno

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

:: 检查目录
:checkFolder
echo 文件释放目录"%folder%"

if exist "%folder%" (
GOTO :download
) else (
    echo 未找到%folder%,正在创建
    md %folder% && echo 创建成功
    echo.
    GOTO :download
)

:: 下载
:download
echo.
echo 下载Luno
powershell wget -o %folder%\LunoLoader.exe %lunoURL% && echo - 成功 || GOTO :fail

echo.
echo 下载参数
powershell wget -o %folder%\luno-main.cfg %configURL% && echo - 成功 || echo - 失败，仍旧执行下一步

echo.
echo 从官网下载参数
powershell wget -o %folder%\configs.zip %cfgURL% && echo - 成功 || echo - 失败，仍旧执行下一步
echo - 解压缩参数
tar -xvf %folder%\configs.zip -C %folder%
echo 删除无用文件
del /Q %folder%\configs.zip
del /Q %folder%\"ОБЯЗАТЕЛЬНО К ПРОЧТЕНИЮ!!!.txt"

:: 启动
echo.
echo 准备启动luno，蓝色按钮是注入（注意：把默认启用按钮关了！开启时注入会安装第三方浏览器）
echo GUI快捷键是ins,齿轮图标是设置，点进去选择luno-main，然后点load加载参数
echo.
%folder%\LunoLoader.exe && GOTO :end

:: Luno下载失败
:fail

echo.
echo - LunoLoader下载失败，请检查网络重试，必要时可以使用网络代理
pause
exit

:: 结束
:end

pause
exit