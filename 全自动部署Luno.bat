:: 设置
@echo off
title luno懒人脚本(自动获取最新luno，作者自调参数并启动luno)
set lunoURL=https://lunocs2.ru/request?downloadLoader
set configURL=https://github.com/ImLTHQ/CS2-Script/releases/download/main/luno-main.cfg
set folder=C:\Luno
echo 文件释放目录"%folder%"

:: 检查
:checkFolder
if exist "%folder%" (
GOTO :download
) else (
    echo 未找到%folder%,正在创建
    md %folder% && echo 创建成功
    GOTO :download
)

:: 下载
:download
echo.
echo 下载Luno
powershell wget -o %folder%\LunoLoader.exe %lunoURL% && echo 成功 || GOTO :fail
echo.
echo 下载参数
powershell wget -o %folder%\luno-main.cfg %configURL% && echo 成功 || echo 失败，仍旧执行下一步

:: 启动
echo.
echo 启动luno，蓝色按钮是注入(注意：把默认启用按钮关了！开启时注入会安装第三方浏览器)
echo GUI快捷键是ins,齿轮图标是设置，点进去选择luno-main，然后点load加载参数
%folder%\LunoLoader.exe && exit

:: 非正常结束
:fail
echo LunoLoader下载失败，请检查网络重试，必要时可以使用网络代理
pause
exit