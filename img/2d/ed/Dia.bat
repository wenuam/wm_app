@echo off & setlocal EnableExtensions EnableDelayedExpansion
if "%~dp0" neq "!guid!\" (set "guid=%tmp%\wm.%~nx0.%~z0" & set "cd=%~dp0" & (if not exist "!guid!\%~nx0" (mkdir "!guid!" 2>nul & find "" /v<"%~f0" >"!guid!\%~nx0")) & call "!guid!\%~nx0" %* & rmdir /s /q "!guid!" 2>nul & exit /b) else (if "%cd:~-1%"=="\" set "cd=%cd:~0,-1%")

title '%~n0' runner, by wenuam 2025
	set "cApp=wm_app" & set "vLvl=>"
	set "sErr=  ERROR:" & set "sNfe=not found, exiting..."
	set log=echo:%debug%^|findstr /r /c:"."^>nul ^&^& echo ^^!vLvl^^!

%log% Running "%cd%\%~nx0"
	echo %cmdcmdline% | find /i "%cd%\%~nx0" >nul &	set /a "console=!errorlevel!"
	for /f "tokens=1,2* delims=-" %%i in ("%~n0") do set "cExe=%%i" & set "cVer=%%j"

%log% Look for '%cApp%' folder ^(in "%cd%"^)
	set "vApp=" & set "vRep="
	for %%i in ("%cd:\=","%") do (
		set "vTmp=%%~i"
		if "!vRep!"=="" ( set "vApp=!vApp!\!vTmp!" ) else ( set "vRep=!vRep!_!vTmp!" )
		set "vTmp=!vTmp:*%cApp%=!"
		if /i "%%~i"=="%cApp%!vTmp!" echo !vTmp:~0,1! | findstr /r "^[0-9a-zA-Z]" >nul & if errorlevel 1 set "vRep=_"
	)
	if "!vRep!"=="" echo %sErr% '%cApp%' folder in "%cd%" %sNfe% & set /a errorlevel=3 & goto :done
	set "vApp=!vApp:~1!" & set "vRep=!vRep:~2!" & set "vBat=!vApp!\bin\%cApp%.bat"

%log% Check toolbox presence ^("!vBat!"^)
	if not exist "!vBat!" echo %sErr% "!vBat!" %sNfe% & set /a errorlevel=2 & goto :done
	call "!vBat!" set_consts "!vApp!" "%cApp%_!vRep!__%cExe%"

%log% Check 'hubfs' presence ^(in "%cHub%"^)
	if not exist "%cHub%" echo %sErr% "%cHub%" %sNfe% & set /a errorlevel=5 & goto :done
	call "!vBat!" run_prepare "%~n0" %*

rem  - - - START - - -
rem Execute specific code here once the 'wm_app' is ready


rem  - - - END - - - -

	call "!vBat!" run_cleanup

:done
	if %console% equ 0 pause
	exit /b !errorlevel!
goto :eof

rem  - - - SUBROUTINES - - - -
rem Add your own functions there
