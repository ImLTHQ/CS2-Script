:: 设置
@echo off
title luno懒人脚本(自动获取最新luno，作者自调参数并启动luno)
set lunoURL=https://lunocs2.ru/request?downloadLoader
set configURL=https://github.com/ImLTHQ/CS2-Script/releases/download/main/luno-main.cfg
set folder=C:\Luno
echo 文件释放目录"%folder%"

:: 检查
:checkAdmin
net session >nul 2>&1 && (
    GOTO :checkFolder
) || (
    echo 请以管理员身份运行！
    GOTO :end
)
:checkFolder
if exist "%folder%" (
GOTO :downloadController
) else (
    echo 未找到%folder%,正在创建
    md %folder% && echo 创建成功
    GOTO :downloadController
)

:: 下载
:download
echo 下载Luno
powershell wget -o %folder%\LunoLoader.exe %lunoURL% && echo 成功 || echo 失败 && GOTO :end
echo 下载参数
powershell wget -o %folder%\luno-main.cfg %configURL% && echo 成功 || echo 失败 && GOTO :end

:: 启动
echo 启动luno，蓝色按钮是注入(注意：把默认启用按钮关了！开启时注入会安装第三方浏览器)
%folder%\LunoLoader.exe || echo 非正常退出,代码%ERRORLEVEL%。 && GOTO :end

:: 结束
:end
echo 运行结束
pause
exit