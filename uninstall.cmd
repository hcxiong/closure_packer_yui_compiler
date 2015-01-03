@echo off

if exist "%userprofile%\Documents\Visual Studio 2005\Addins\JsCssCompiler.dll" (
	del /q "%userprofile%\Documents\Visual Studio 2005\Addins\JsCssCompiler.dll"
	del /q "%userprofile%\Documents\Visual Studio 2005\Addins\JsCssCompiler.AddIn"
)
if exist "%userprofile%\Documents\Visual Studio 2008\Addins\JsCssCompiler.dll" (
	del /q "%userprofile%\Documents\Visual Studio 2008\Addins\JsCssCompiler.dll"
	del /q "%userprofile%\Documents\Visual Studio 2008\Addins\JsCssCompiler.AddIn"
)
if exist "%userprofile%\Documents\Visual Studio 2010\Addins\JsCssCompiler.dll" (
	del /q "%userprofile%\Documents\Visual Studio 2010\Addins\JsCssCompiler.dll"
	del /q "%userprofile%\Documents\Visual Studio 2010\Addins\JsCssCompiler.AddIn"
)

if exist "%userprofile%\My Documents\Visual Studio 2005\Addins\JsCssCompiler.dll" (
	del /q "%userprofile%\My Documents\Visual Studio 2005\Addins\JsCssCompiler.dll"
	del /q "%userprofile%\My Documents\Visual Studio 2005\Addins\JsCssCompiler.AddIn"
)
if exist "%userprofile%\My Documents\Visual Studio 2008\Addins\JsCssCompiler.dll" (
	del /q "%userprofile%\My Documents\Visual Studio 2008\Addins\JsCssCompiler.dll"
	del /q "%userprofile%\My Documents\Visual Studio 2008\Addins\JsCssCompiler.AddIn"
)
if exist "%userprofile%\My Documents\Visual Studio 2010\Addins\JsCssCompiler.dll" (
	del /q "%userprofile%\My Documents\Visual Studio 2010\Addins\JsCssCompiler.dll"
	del /q "%userprofile%\My Documents\Visual Studio 2010\Addins\JsCssCompiler.AddIn"
)

pushd "%~dp0"
rundll32 setupapi.dll,InstallHinfSection DefaultUnInstall 128 .\install.inf
popd

echo.
echo Successfully uninstalled.
echo.
pause
