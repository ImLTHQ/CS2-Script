::init
@echo off
title luno懒人脚本(自动获取最新luno，作者自调参数并启动luno)
echo 获取Luno
powershell wget -o C:\Luno\LunoLoader.exe https://lunocs2.ru/request?downloadLoader && echo 成功 || echo 失败 && GOTO :end
echo 获取参数
powershell wget -o C:\Luno\luno-main.cfg https://github.com/ImLTHQ/CS2-Script/releases/download/main/luno-main.cfg && echo 成功 || echo 失败 && GOTO :end

::run
echo 准备运行luno，蓝色按钮是注入(注意：把默认启用按钮关了！开启时注入会安装第三方浏览器)
C:\Luno\LunoLoader.exe

:end
pause
exit