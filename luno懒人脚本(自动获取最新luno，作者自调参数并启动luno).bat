::init
@echo off
title luno���˽ű�(�Զ���ȡ����luno�������Ե�����������luno)
echo ��ȡLuno
powershell wget -o C:\Luno\LunoLoader.exe https://lunocs2.ru/request?downloadLoader && echo �ɹ� || echo ʧ�� && GOTO :end
echo ��ȡ����
powershell wget -o C:\Luno\luno-main.cfg https://github.com/ImLTHQ/CS2-Script/releases/download/main/luno-main.cfg && echo �ɹ� || echo ʧ�� && GOTO :end

::run
echo ׼������luno����ɫ��ť��ע��(ע�⣺��Ĭ�����ð�ť���ˣ�����ʱע��ᰲװ�����������)
C:\Luno\LunoLoader.exe

:end
pause
exit