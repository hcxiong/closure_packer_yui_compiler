@echo off
echo *******************************************************************************
echo *
echo *                Closure/Packer/YUI Compiler ѹ��JS/CSS�ļ�
echo *
echo *    �����ļ�����ӡ�-min�� �� filename.(js/css) -^> filename-min.(js/css)

REM �����ļ���׺��ֻѹ�� js/css�ļ�
if "%~x1" NEQ ".js" (
    if "%~x1" NEQ ".css" (
        echo *
        echo *
        echo *    ������ѡ�� .js �� .css �ļ���
        echo *
        goto End
    )
)

if "%~x1" EQU ".js" (
	goto JS
)
if "%~x1" EQU ".css" (
	goto CSS
)

:JS
set RESULT_FILE=%~n1-min%~x1
set RESULT_FILE_SIZE=%~z1

cd "%~dp1"
%~d1

"%~dp0compiler.jar" --js "%~nx1" --js_output_file "%RESULT_FILE%"
if %ERRORLEVEL% == 0 (
	echo *
	echo *
	echo *    Closure ѹ���ļ�%~nx1��%RESULT_FILE%�ɹ���
	echo *
	for %%a in ("%RESULT_FILE%") do (
		echo *    �ļ���С�� %~z1 bytes ѹ���� %%~za bytes
		set RESULT_FILE_SIZE=%%~za
	)
) else (
	echo *
	echo *
	echo *    Closure ���ļ� %~nx1 ����д����������ϸ���
	echo *
	goto End
)

"%~dp0packer.exe" "%RESULT_FILE%"
if %ERRORLEVEL% == 0 (
	echo *
	echo *
	echo *    Packer ѹ���ļ�%RESULT_FILE%��%RESULT_FILE% �ɹ���
	echo *
	for %%a in ("%RESULT_FILE%") do (
		echo *    �ļ���С�� %RESULT_FILE_SIZE% bytes ѹ���� %%~za bytes
		if %RESULT_FILE_SIZE% LSS %%~za ( goto GG )
	)
	echo *
) else (
	echo *
	echo *
	echo *    Packer ���ļ� %~nx1 ����д����������ϸ���
	echo *
	goto End
)

goto End

:CSS

cd "%~dp1"
%~d1

set RESULT_FILE=%~n1-min%~x1
"%~dp0yuicompressor-2.4.2.jar" --charset UTF-8 "%~nx1" -o "%RESULT_FILE%"
if %ERRORLEVEL% == 0 (
	echo *
	echo *
	echo *    YUICompressor ѹ���ļ�%~nx1��%RESULT_FILE%�ɹ���
	echo *
	for %%a in ("%RESULT_FILE%") do (
		echo *    �ļ���С�� %~z1 bytes ѹ���� %%~za bytes
	)
	echo *
) else (
	echo *
	echo *
	echo *    YUICompressor ���ļ� %~nx1 ����д����������ϸ���
	echo *
	goto End
)
goto End

:GG
"%~dp0compiler.jar" --js "%~nx1" --js_output_file "%RESULT_FILE%"
if %ERRORLEVEL% == 0 (
	echo *
	echo *
	echo *    Closure ����ѹ���ļ�%~nx1��%RESULT_FILE%�ɹ���
	echo *
	for %%a in ("%RESULT_FILE%") do (
		echo *    �ļ���С�� %~z1 bytes ѹ���� %%~za bytes
	)
	echo *
) else (
	echo *
	echo *
	echo *    �ļ� %~nx1 ����д����������ϸ���
	echo *
	goto End
)
goto End

:End
echo *******************************************************************************
echo.
ENDLOCAL
pause
