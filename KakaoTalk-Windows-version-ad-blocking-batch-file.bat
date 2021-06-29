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

//원하는 명령 실행

@echo off
color 1F
cd /d %~dp0
title 카카오톡 광고 호스트 차단 by SH.
mode con cols=100 lines=25
setlocal enabledelayedexpansion

:gotAdmin

:main
cls
echo.
echo		[ 카카오톡 광고 호스트 차단 By SH. ]
echo.
echo.
echo.
echo		1. 활성화 (시작전 백신은 꺼주세요.)
echo.
echo		2. 종료
echo.
echo.
set menu=
set /p menu=원하시는 작업 번호를 입력 후 엔터(Enter)키를 눌러주세요 : 
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

