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

if !vChk! gtr 0 (
	%log% Check dependencies...
	call "!vBat!" dependency_check gswin64c
	if not errorlevel 2 (
		call "!vBat!" dependency_check magick
		if not errorlevel 2 (
			if !vChk! equ 2 (
				%log% Doing folder...
REM				call :do_cmd "%cd%"
			) else if !vChk! equ 1 (
				%log% Doing file...
				rem Check file 1
				if exist "%~f1" (
					rem Check file 1 extension
					if /i "%~x1"==".pdf" (
						rem Check file 2
						if exist "%~f2" (
							rem Check file 2 extension
							if /i "%~x2"==".pdf" (
								if /i not "%~f1"=="%~f2" (
									call :pdf2png_diff "%~f1" "%~f2"
								) else (
									echo %sErr% Do NOT compare the same PDF file ^("%~nx1" / "%~nx2"^)
								)
							) else (
								echo %sErr% File 2 NOT a PDF file ^("%~nx2"^)
							)
						) else (
							echo %sErr% File 2 do not exist ^("%~f2"^)
						)
					) else (
						echo %sErr% File 1 NOT a PDF file ^("%~nx1"^)
					)
				) else (
					echo %sErr% File 1 do not exist ^("%~f1"^)
				)
			) else (
				echo Doing nothing...
REM				call :do_cmd
			)
		) else (
			echo %sErr% "magick" not found...
		)
	) else (
		echo %sErr% "gswin64c" not found...
	)
) else (
	echo %sInf% NO PARAM
	echo %sUse% %~nx0 "file1.pdf" "file2.pdf"
)

rem  - - - END - - - -

	call "!vBat!" run_cleanup

:done
	if %console% equ 0 pause
	exit /b !errorlevel!
goto :eof

rem  - - - SUBROUTINES - - - -
rem Add your own functions there

:pdf2png_diff %1 left file, %2 right file
%begin% %log% Converting and comparing files... ^("%~nx1" vs. "%~nx2"^)
	rem Set default var
	set "vExe=gswin64c"

    rem Page count command-line template
	set "vTmp=%vExe%"
	set "vTmp=!vTmp! -dNOSAFER"
	set "vTmp=!vTmp! -sFileName="_par1_""
	set "vTmp=!vTmp! -c"
	set "vTmp=!vTmp! "FileName ^(r^) file runpdfbegin pdfpagecount = quit""

	rem Get file 1/left page count
	set "vCmd=!vTmp:_par1_=%~f1!"
	for /f %%a in ('!vCmd!') do set /a "vPc1=%%a"
	if "!vPc1!"=="" (
		echo %sErr% Can't get page count for "%~nx1"
	) else (
		rem Get file 2/right page count
		set "vCmd=!vTmp:_par1_=%~f2!"
		for /f %%a in ('!vCmd!') do set /a "vPc2=%%a"
		if "!vPc2!"=="" (
			echo %sErr% Can't get page count for "%~nx2"
		) else (
			echo File 1 "%~nx1" : !vPc1! pages
			echo File 2 "%~nx2" : !vPc2! pages

			rem Get minimum page count
			if !vPc1! gtr !vPc2! (
				set /a "vPc1=!vPc2!"
				set "vPc2=file 2"
			) else if !vPc2! gtr !vPc1! (
				set "vPc2=file 1"
			) else (
				set "vPc2=same size"
			)

			echo ^> Limiting to !vPc1! pages ^(!vPc2!^)

			rem Page diff command-line template
			set "vTmp=%vExe%"
			set "vTmp=!vTmp! -dQUIET"
			set "vTmp=!vTmp! -dBATCH"
REM			set "vTmp=!vTmp! -dSAFER"
			set "vTmp=!vTmp! -dNOSAFER"
			set "vTmp=!vTmp! -dNOPAUSE"
			set "vTmp=!vTmp! -sDEVICE=pngalpha"
			set "vTmp=!vTmp! -dTextAlphaBits=4"
			set "vTmp=!vTmp! -dGraphicsAlphaBits=4"
			set "vTmp=!vTmp! -r300"
			set "vTmp=!vTmp! -dFirstPage=_par1_"
			set "vTmp=!vTmp! -dLastPage=_par1_"
			set "vTmp=!vTmp! -sOutputFile=_par2_"

			rem Files/commands to process
			set "vPrj="
			set "vPrj=!vPrj! "%~1""
			set "vPrj=!vPrj! "%~2""
			set "vPrj=!vPrj! diff"

			rem For all files/commands to process
			for %%a in (!vPrj!) do (
				rem Reset overwrite flag
				rem  0 : blocked
				rem  1 : granted (if not exist)
				rem  2 : granted (ask)
				rem  3 : granted (always)
				set /a "vFlag=2"

				echo.

				rem Action to perform
				if not "%%a"=="diff" (
					echo Converting "%%~nxa" into PNG files...
				) else (
					echo Comparing "%~nx1" / "%~nx2"...
				)

				rem For all pages
				for /l %%b in (1,1,!vPc1!) do (
					rem Output file (according to action)
					if not "%%a"=="diff" (
						rem Generate source image (beware of naming)
						set "vOut=%%~na_p%%b.png"
					) else (
						set "vOut=diff_p%%b.png"
					)
					echo   page %%b : "!vOut!"

					rem Check output file existence
					if exist "!vOut!" (
						if !vFlag! equ 2 (
							rem Reset variable (just pressing return keeps last value)
							set "vOver="
							rem Ask what to do ([Return] will ask again)
							set /p "vOver=^!   Overwite '!vOut!' once ([Return]) or all (Yes/No): "
							if not "!vOver!"=="" (
								set /a "vFlag=0"

								if /i "!vOver!"=="y" set /a "vFlag=3"
								if /i "!vOver!"=="yes" set /a "vFlag=3"
							)
						) else if !vFlag! equ 1 (
							rem Exist but was unblocked before
							set /a "vFlag=0"
						)
					) else if !vFlag! equ 0 (
						rem Do not exist yet was blocked before
						set /a "vFlag=1"
					)

					if !vFlag! geq 1 (
						rem Perform action
						if not "%%a"=="diff" (
							rem Customize command line
							for /f "tokens=1,*" %%c in ("%%b "!vOut!"") do (
								rem Page number
								set "vCmd=!vTmp:_par1_=%%c!"
								rem Output file
								set "vCmd=!vCmd:_par2_=%%d!"
							)

							rem Convert page from input pdf
							!vCmd! "%%~fa"
						) else (
							rem Generate diff image (beware of naming)
							magick compare "%~n1_p%%b.png" "%~n2_p%%b.png" "!vOut!"
							echo;
						)
					)
				)
			)
		)
	)
%end%
