@echo off
color 1F
title HOST Edit Script
bcdedit > nul || (echo 오른쪽 마우스 클릭 후, 관리자 권한으로 다시 실행해주세요. & pause & exit)
SET NEWLINE=^& echo.
FIND /C /I "display.ad.daum.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1                   차단하고자 할 주소>>%WINDIR%\system32\drivers\etc\hosts