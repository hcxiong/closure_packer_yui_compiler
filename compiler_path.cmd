@echo off 
echo *******************************************************************************
echo *
echo *       Closure/Packer/YUI Compiler 压缩目录、子目录下的所有JS/CSS文件
echo *
echo *    生成文件名后加“-min” 如 filename.(js/css) -^> filename-min.(js/css)
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
