REM --add the following to the top of your bat file--
@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

//���ϴ� ��� ����

@echo off
color 1F
cd /d %~dp0
title īī���� ���� ȣ��Ʈ ���� by SH.
mode con cols=100 lines=25
setlocal enabledelayedexpansion

:gotAdmin

:main
cls
echo.
echo		[ īī���� ���� ȣ��Ʈ ���� By SH. ]
echo.
echo.
echo.
echo		1. Ȱ��ȭ (������ ����� ���ּ���.)
echo.
echo		2. ����
echo.
echo.
set menu=
set /p menu=���Ͻô� �۾� ��ȣ�� �Է� �� ����(Enter)Ű�� �����ּ��� : 
if "%menu%" == "1" goto Go
if "%menu%" == "2" goto Exit

goto main

:Go
SET NEWLINE=^& echo.

FIND /C /I "display.ad.daum.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1                   display.ad.daum.net>>%WINDIR%\system32\drivers\etc\hosts
pause
goto main

:EXit
pause

