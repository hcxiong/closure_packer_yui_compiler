@echo off 
echo *******************************************************************************
echo *
echo *       Closure/Packer/YUI Compiler ѹ��Ŀ¼����Ŀ¼�µ�����JS/CSS�ļ�
echo *
echo *    �����ļ�����ӡ�-min�� �� filename.(js/css) -^> filename-min.(js/css)
echo *
echo *******************************************************************************
echo.

call :Fd %1 
goto :End 

:Fd 
for /F "tokens=*" %%i in ('dir %1 /ad /B') do call :Fd "%~f1\%%~nxi" 

cd "%~dp1"
%~d1
for /F "tokens=*" %%i in ('dir %1\*-min.js /B 2^>nul') do call del /f /q %~1\%%i
for /F "tokens=*" %%i in ('dir %1\*.js /B 2^>nul') do call %~dp0compiler_close.cmd %~1\%%i

for /F "tokens=*" %%i in ('dir %1\*-min.css /B 2^>nul') do call del /f /q %~1\%%i
for /F "tokens=*" %%i in ('dir %1\*.css /B 2^>nul') do call %~dp0compiler_close.cmd %~1\%%i
goto :EOF

:End
echo.
ENDLOCAL
pause
