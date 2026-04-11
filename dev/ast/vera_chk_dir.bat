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
	set "vApp=%cd:\=" & set "vTmp=\!vApp!!vTmp!" & set "vApp=%" & set "vTmp=!vApp!!vTmp!"
	set "vApp=" & set "vRep="
	for %%i in ("!vTmp:\=","!") do (
		set "vTmp=%%~i"
		if not "!vApp!"=="" ( set "vApp=!vTmp!\!vApp!" ) else (
			set "vTmp=!vTmp:*%cApp%=!"
			if /i "%%~i"=="%cApp%!vTmp!" echo !vTmp:~0,1! | findstr /r "^[0-9a-zA-Z]" >nul & if errorlevel 1 set "vApp=%%~i"
			if "!vApp!"=="" ( set "vRep=_!vTmp!!vRep!" )
		)
	)
	if "!vApp!"=="" echo %sErr% '%cApp%' folder in "%cd%" %sNfe% & set /a errorlevel=3 & goto :done
	set "vBat=!vApp!\bin\%cApp%.bat"

%log% Check toolbox presence ^("!vBat!"^)
	if not exist "!vBat!" echo %sErr% "!vBat!" %sNfe% & set /a errorlevel=2 & goto :done
	call "!vBat!" set_consts "!vApp!" "%cApp%!vRep!__%cExe%"

%log% Check 'hubfs' presence ^(in "%cHub%"^)
	if not exist "%cHub%" echo %sErr% "%cHub%" %sNfe% & set /a errorlevel=5 & goto :done
	call "!vBat!" run_prepare "%~n0" %*

rem  - - - START - - -
rem Execute specific code here once the 'wm_app' is ready

if !vChk! gtr 0 (
	%log% Check dependencies...
	call "!vBat!" dependency_check "vera++"
	if not errorlevel 2 (
		call "!vBat!" dependency_check "xidel"
		if not errorlevel 2 (
			if !vChk! equ 2 (
				%log% Doing folder...
				call :do_cmd "%cd%"
			) else if !vChk! equ 1 (
				%log% Doing file...
REM				call :do_cmd "%~f1"
				echo %sErr% ONLY FOLDER
				echo %sUse% %~nx0 "folder"
			)
		) else (
			echo %sErr% "xidel" not found...
		)
	) else (
		echo %sErr% "vera++" not found...
	)
) else (
	echo %sInf% NO PARAM
	echo %sUse% %~nx0 "folder"
)

rem  - - - END - - - -

	call "!vBat!" run_cleanup

:done
	if %console% equ 0 pause
	exit /b !errorlevel!
goto :eof

rem  - - - SUBROUTINES - - - -
rem Add your own functions there

:lowcase
	set "ret=%1"
	for %%i in ("A=a" "B=b" "C=c" "D=d" "E=e" "F=f" "G=g" "H=h" "I=i" "J=j" "K=k" "L=l" "M=m" "N=n" "O=o" "P=p" "Q=q" "R=r" "S=s" "T=t" "U=u" "V=v" "W=w" "X=x" "Y=y" "Z=z") do call set "ret=!ret:%%~i!"
goto :eof

rem Execute command
:do_cmd
	rem Get current folder name
	for /f %%i in ("%~1") do set "lName=%%~nxi"

	rem Set default variables
	set "lExe=vera++"
REM	set "lDst=%cd%\.chk\%lExe%\%sDate%_%sTime%"
	set "lDst=%cd%\.chk\%lExe%"
	set "lOut=%lDst%\%lExe%_log"

	rem Create the folder (because Windows cannot do it automatically when writing a file)
	mkdir "%lDst%" %quiet%

	rem Project files (templates)
	set "lPrj="
	set "lPrj=!lPrj! .prj_exc_path.txt"
	set "lPrj=!lPrj! .prj_exc_warning.txt"
	set "lPrj=!lPrj! .prj_inc_defines.txt"
	set "lPrj=!lPrj! .prj_inc_extension.txt"
	set "lPrj=!lPrj! .prj_inc_path.txt"

	rem Copy and edit project files
	for %%a in (!lPrj!) do (
		if exist "%sd%\%%a" if not exist "%cd%\%%a" (
			copy /y "%sd%\%%a" "%cd%\%%a" %quiet%
			set /p lEdit="Would you like to edit '%%a' ? (Yes/No): "
			if not "!lEdit!"=="" (
				call :lowcase !lEdit!
				if "!ret!"=="y" set /a "lEdit=1"
				if "!ret!"=="yes" set /a "lEdit=1"
				if !lEdit! equ 1 (
					echo Edit '%%~nxa' before executing %lExe%...
REM					start "" /d "%cd%" "cmd" /c "%cd%\%%a"
					"cmd" /c "%cd%\%%a"
				)
			)
		)
	)

	set "lDir=/B /A:-D /ON /S"
	set "lLst=%lDst%\.vera.lst"
	set "lLsu=%lLst%.tmp"

	rem Set excluded paths file
	if "%lExc%"=="" set "lExc=%cd%\.prj_exc_path.txt"

	rem Delete temporary files
	del %lLst% %fquiet%
	del %lLsu% %fquiet%

	echo List selected files...
	for /f "delims=!" %%i in (%cd%\.prj_inc_extension.txt) do (
		dir "%cd%\*.%%i" %lDir% >> "%lLst%" 2>nul
	)

	rem If no path to exclude, start the process right now
	if not "%lExc%"=="" if exist "%lExc%" (
		echo Sort and exclude files...
		rem Remove the excluded paths from the list
		findstr /i /v /g:"%lExc%" "%lLst%" >> "%lLsu%"
		del "%lLst%" %fquiet%

		rem move %lLsu% %lLst% %quiet%
		sort "%lLsu%" > "%lLst%"
		del %lLsu% %fquiet%
	)

	rem Delete temporary files
	del "%lOut%.txt" %fquiet%

	echo Find exe location
	call "!vBat!" where "%lExe%.exe"
	for /f %%a in (!ret!) do (
		set "lLib=%%~dpa\..\lib\%lExe%"
	)
	rem Set parameter variables (profiles in %sd%\bin\vera++-xxx\lib\vera++\profiles)
REM	set "lPar=--profile %lName% --show-rule"
REM	set "lPar=--profile default --show-rule"
	set "lPar=--profile fast --show-rule"

	set "lCmd="
	set "lCmd=!lCmd! --input-format=xml"
REM	set "lCmd=!lCmd! --input-format=xml-strict"
REM	set "lCmd=!lCmd! --output-format=adhoc"
REM	set "lCmd=!lCmd! --template-file=extract_expression.txt"
REM	set "lCmd=!lCmd! --output-separator=?"
	rem                                                    %4                         %3            %2                 %1          repeat    repeat
REM	set "lCmd=!lCmd! --extract=^"^<checkstyle^>^<file name={$file:=.}^>^<error source={$id:=.} line={$line:=.} message={$msg:=.}/^>*^</file^>*^</checkstyle^>^""
REM	set "lCmd=!lCmd! --extract=^"^<checkstyle^>^<file name={$file:=.}^>^<error message={$msg:=.} line={$line:=.} source={$id:=.}/^>*^</file^>*^</checkstyle^>^""
REM	set "lCmd=!lCmd! --extract=^"^<checkstyle^>^<file name={$file}^>^<error message={$msg} line={$line} source={$id}/^>*^</file^>*^</checkstyle^>^""
	set "lCmd=!lCmd! --extract=^"for $x in //file for $y in $x/error return `{$x/@name}:{$y/@line}: {$y/@source}: {$y/@message}`^""

	if exist "%lLst%" (
		if not ""=="" (
			rem Looping file per file
			echo Check %lExe% on...
			rem Apply selected command on listed source files
			for /f "delims=!" %%i in (%lLst%) do (
				echo   %%~nxi
				"%lExe%" -r !lLib! %lPar% "%%i">>"%lOut%.txt"
			)
		) else (
			rem XML
			echo Check %lExe% on %cd%...
			"%lExe%" -c "%lOut%.xml" -r !lLib! %lPar% -i "%lLst%">"%lOut%.txt"

			rem XML data extraction (Xidel to be around)
			echo Extract data from XML...
			xidel "%lOut%.xml" !lCmd! --output-format^=adhoc 1>"%lOut%.txt" 2>nul

			if not ""=="" (
				if exist "%lOut%.tmp" (
					rem Format conversion
					echo Convert data into TXT...

					rem Delete temporary files
					del "%lOut%.txt" %fquiet%
					del "%lOut%.xxx" %fquiet%

					for /f "tokens=1,* delims=:" %%i in (%lOut%.tmp) do (
						rem Read second token from 'findstr' ('linenum:string' : %%i:%%j)
REM						echo i:"%%i"
REM						echo j:"%%j"

						if "%%i"=="id " (
							set "id=%%j"
							set "id=!id:~2!"
						)

						if "%%i"=="line " (
							set "line=%%j"
							set "line=!line:~2!"
						)

						if "%%i"=="msg " (
							set "msg=%%j"
							set "msg=!msg:~2!"

							rem Write line ('msg' must be last of group)
							echo :!line!: !id!: !msg!>>"%lOut%.xxx"
						)

						if "%%i"=="file " (
							rem Write file ('file' must be last of lines)
							set "file=%%j"
							set "file=!file:~2!"
REM							echo file:!file!
							if exist "%lOut%.xxx" (
								for /f "delims=!" %%x in (%lOut%.xxx) do (
									rem Compose final line (with filename)
									echo !file!%%x>>"%lOut%.txt"
								)
								del "%lOut%.xxx" %fquiet%
							)
						)
					)

					del "%lOut%.tmp" %fquiet%
				)
			)
		)

		if not "1"=="" (
			if exist "%lOut%.txt" (
				echo Cleanup final TXT...
				if not ""=="" (
					rem Sort lines (beware, not lexicographical)
					sort "%lOut%.txt" > "%lOut%.sort"
				) else (
					rem Copy already sorted file (hopefully it is)
					copy /y "%lOut%.txt" "%lOut%.sort" %quiet%
				)

				if exist "%lOut%.sort" (
					del "%lOut%.txt" %fquiet%

					set "lPre="

					rem Remove duplicate lines
					for /f "delims=" %%i in (%lOut%.sort) do (
						set "lCur=%%i"
						if not "!lCur!"=="!lPre!" (
							set "lPre=!lCur!"
							echo !lCur!>>"%lOut%.txt"
						)
					)
				)

				del "%lOut%.sort" %fquiet%
			)
		)
	)

	rem Deleting source files list
	del %lLst% %fquiet%
goto :eof
