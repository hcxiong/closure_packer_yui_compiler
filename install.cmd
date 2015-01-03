@echo off

pushd "%~dp0"

if exist "%userprofile%\Documents\" (
	if exist "%userprofile%\Documents\Visual Studio 2005\" (
		if not exist "%userprofile%\Documents\Visual Studio 2005\Addins\" md "%userprofile%\Documents\Visual Studio 2005\Addins\"
		copy /y ".\JsCssCompiler.dll" "%userprofile%\Documents\Visual Studio 2005\Addins\JsCssCompiler.dll" > nul
		copy /y ".\JsCssCompiler2005.AddIn" "%userprofile%\Documents\Visual Studio 2005\Addins\JsCssCompiler.AddIn" > nul
	)
	if exist "%userprofile%\Documents\Visual Studio 2008\" (
		if not exist "%userprofile%\Documents\Visual Studio 2008\Addins\" md "%userprofile%\Documents\Visual Studio 2008\Addins\"
		copy /y ".\JsCssCompiler.dll" "%userprofile%\Documents\Visual Studio 2008\Addins\JsCssCompiler.dll" > nul
		copy /y ".\JsCssCompiler2008.AddIn" "%userprofile%\Documents\Visual Studio 2008\Addins\JsCssCompiler.AddIn" > nul
	)
	if exist "%userprofile%\Documents\Visual Studio 2010\" (
		if not exist "%userprofile%\Documents\Visual Studio 2010\Addins\" md "%userprofile%\Documents\Visual Studio 2010\Addins\"
		copy /y ".\JsCssCompiler.dll" "%userprofile%\Documents\Visual Studio 2010\Addins\JsCssCompiler.dll" > nul
		copy /y ".\JsCssCompiler2010.AddIn" "%userprofile%\Documents\Visual Studio 2010\Addins\JsCssCompiler.AddIn" > nul
	)
)

if exist "%userprofile%\My Documents\" (
	if exist "%userprofile%\My Documents\Visual Studio 2005\" (
		if not exist "%userprofile%\My Documents\Visual Studio 2005\Addins\" md "%userprofile%\My Documents\Visual Studio 2005\Addins\"
		copy /y ".\JsCssCompiler.dll" "%userprofile%\My Documents\Visual Studio 2005\Addins\JsCssCompiler.dll" > nul
		copy /y ".\JsCssCompiler2005.AddIn" "%userprofile%\My Documents\Visual Studio 2005\Addins\JsCssCompiler.AddIn" > nul
	)
	if exist "%userprofile%\My Documents\Visual Studio 2008\" (
		if not exist "%userprofile%\My Documents\Visual Studio 2008\Addins\" md "%userprofile%\My Documents\Visual Studio 2008\Addins\"
		copy /y ".\JsCssCompiler.dll" "%userprofile%\My Documents\Visual Studio 2008\Addins\JsCssCompiler.dll" > nul
		copy /y ".\JsCssCompiler2008.AddIn" "%userprofile%\My Documents\Visual Studio 2008\Addins\JsCssCompiler.AddIn" > nul
	)
	if exist "%userprofile%\My Documents\Visual Studio 2010\" (
		if not exist "%userprofile%\My Documents\Visual Studio 2010\Addins\" md "%userprofile%\My Documents\Visual Studio 2010\Addins\"
		copy /y ".\JsCssCompiler.dll" "%userprofile%\My Documents\Visual Studio 2010\Addins\JsCssCompiler.dll" > nul
		copy /y ".\JsCssCompiler2010.AddIn" "%userprofile%\My Documents\Visual Studio 2010\Addins\JsCssCompiler.AddIn" > nul
	)
)

rundll32 setupapi.dll,InstallHinfSection DefaultInstall 128 .\install.inf
popd

echo.
echo Successfully installed.
echo.
pause
