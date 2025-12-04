@echo off
if "%~dp0" neq "!wm_guid!\" (set "wm_guid=%tmp%\wm.%~nx0.%~z0" & (if not exist "!wm_guid!\%~nx0" (mkdir "!wm_guid!" 2>nul & find "" /v<"%~f0" >"!wm_guid!\%~nx0")) & call "!wm_guid!\%~nx0" %* & rmdir /s /q "!wm_guid!" 2>nul & exit /b)

rem 'wm_app' toolbox, by wenuam 2025
rem Run the runner first to set vars

	set begin=set "vLvl=^!vLvl^!^!vLvl:~0,1^!" ^&
	set end=set "vLvl=^!vLvl:~0,-1^!" ^& exit /b

if "%~1"=="" ( goto :eof ) else ( goto :%~1 )

:set_consts %1 self, %2 wm_app path, %3 repository name (wm_app_*)
%begin% %log% Set COMMON constants
	set "quiet=1>nul 2>nul" & set "fquiet=/f /q !quiet!"
	set "sd=%cd%"

	rem Convert current time and date in ISO format
	for /f "tokens=1,2,3,4 delims=/ " %%a in ("%date%") do set "sDate=%%d%%c%%b%%a"
	for /f "tokens=1,2,3,4 delims=:," %%a in ("%time%") do set "sTime=%%a%%b%%c%%d"
	set "sDate=%sDate: =0%" & set "sTime=%sTime: =0%"

	set "sInf=  INFO:" & set "sUse=  USAGE^>"
	set /a "aDep=-1"

(set lf=^
%=line feed definition, do NOT indent it=%
)
	set "sBlf=Broken line feed definition, script might fail"
	for /f "delims=" %%n in ("!lf!") do echo %sErr% %sBlf%
	if "!lf!" neq "!lf:~0,1!" echo %sErr% %sBlf%

	rem Do *NOT* execute 'cWmic' in a 'for /f' context, otherwise you'll get the hidden subprocess' id
	set "cWmic=wmic process where "name='wmic.exe' and commandline like '%%_%%random%%%%random%%%%random%%_%%'" get parentprocessid"
	set "cLog=%AppData%\%cApp%\%~3\log\%sDate:~0,4%-%sDate:~4,2%"
	set "cVol=%HomeDrive%\Volumes\%cApp%"
	set "cUrl=github.com/wenuam"
	set "cHub=%~2\bin\hubfs.exe"
	set "cRep=%~3"

	mkdir "%cLog%" %quiet%

	if defined debug ( set "cDbg=-o debug" ) else ( set "cDbg=" )
%end%

:run_prepare %1 self, %2 calling script full name, %3+ calling script parameters (aka %1+)
%begin% %log% Preparing to run
	rem Set code page to UTF-8 (/!\ this file MUST be in UTF-8)
	for /f "tokens=2 delims=:." %%x in ('chcp') do set "cp=%%x"
	chcp 65001 >nul

	rem Mount repository first (may not exist if 'helper' script with dependencies)
	echo Mounting remote repositories ^(may take a while^)...
	call :clean_path ""
	call :repo_mount "" "%cRep%"

	rem Load configuration files (executable to run, parameters, dependencies)
	call :config_load "" "%cExe%" "%cExe%-%cVer%"
	if not "%cExe%"=="%~n2" if not "%cExe%-%cVer%"=="%~n2" call :config_load "" "%~n2"
	call :clean_path ""

	echo About to run application ^(setting last things up^)...
	call :check_param "" %3
	call :enforce_cd ""
	call :run_app "" %2 %3 %4 %5 %6 %7 %8 %9
%end%

:run_app %1 self, %2 calling script full name, %3+ calling script parameters (aka %1-%7)
%begin%
	rem Look for executable to run
	if "%cVer%"=="" set "cVer=latest"
	set "vDir=%cVol%\%cExe%\!cVer!" & set "vExe=" & set "vJre="
	if defined exe (
		rem Specific executable (might be in %path%)
		set "vExe=!vDir!\!exe!"
	) else (
		rem Fetch executable from script filename
		for %%a in (.jar %pathext:;= %) do if "!vExe!"=="" if exist "!vDir!\%cExe%%%a" set "vExe=!vDir!\%cExe%%%a"
	)
	if not "!vExe!"=="" (
		for %%g in ("!vExe!") do set "vDir=%%~dpg" & set "vExe=%%~nxg" & set "vExt=%%~xg"
		if "!vDir:~-1!"=="\" set "vDir=!vDir:~0,-1!"
		rem Command line construction
		set "vCli=%3 %4 %5 %6 %7 %8 %9"
		for %%n in (!cli!) do if not "!%%n!"=="" set "vCli=!vCli! !%%n!"
		for /l %%n in (0,1,2) do set "vCli=!vCli:  = !"
		if "!vCli:~0,1!"==" " set "vCli=!vCli:~1!"
		if "!vCli:~-1!"==" " set "vCli=!vCli:~0,-1!"
		rem Logging redirection
		set "vLog="
		set "vTmp=%cLog%\%cRep%-!cVer!-%sDate%_%sTime%"
		for %%n in (!log!) do (
			if "%%n"=="stdout" set vLog=!vLog! 1^>"!vTmp!.stdout.txt"
			if "%%n"=="stderr" set vLog=!vLog! 2^>"!vTmp!.stderr.txt"
		)
		%log% Run application ^("!vExe!" "!vCli!"^)
		rem Check Java archive
		if /i "!vExt!"==".jar" (
			if defined where (
				rem Beware, 'where' is very slow and may even fail on remote mount points
				for /f "delims=!" %%a in ('where java.exe') do set "vJre=%%~dpa"
			) else (
				rem Sturdier yet slower version of 'where'
				call :where "" java.exe
				for %%a in (!ret!) do set "vJre=%%~dpa"
			)
			if not "!vJre!"=="" (
				call :expand "" "!vJre!\.."
				set "JAVA_HOME=!ret!"
				if defined detached (
					start "!vExe!" /d "!vDir!" "cmd" /c java !vCli! -jar "!vExe!" !vLog!
				) else (
					pushd "!vDir!"
						java !vCli! -jar "!vExe!" !vLog!
					popd
				)
			) else (
				%log% %sErr% No Java engine found/installed
			)
		) else (
			if defined detached (
				start "!vExe!" /d "!vDir!" "cmd" /c "!vExe!" !vCli! !vLog!
			) else (
				pushd "!vDir!"
					"!vExe!" !vCli! !vLog!
				popd
			)
		)
	) else (
		%log% %sInf% No executable found for "%cExe%" ^(in "!vDir!"^)
	)
%end%

:run_cleanup %1 self
%begin% %log% Cleanup after run
	if not defined detached (
		rem Unmount dependencies
		for /l %%i in (!aDep!,-1,0) do call :repo_unmount "" "!aDep[%%i]!"

		rem Unmount repository
		call :repo_unmount "" "%cRep%"
	)

	rem Restore saved code page
	chcp %cp% >nul
%end%

:repo_mount %1 self, %2 repository name
%begin%
	set "vExe=%~2" & set "vExe=!vExe:*__=!"
	set "vVol=%cVol%\!vExe!"
	rem There is a bug in batch making both 'exist' and '~a' to fail on link
	set "vDir=" & pushd "!vVol!" 2>nul && popd || set "vDir=1"
	if defined vDir (
		%log% Mount repository ^(in "!vVol!"^)
		for %%i in (def pid) do del "%cVol%\%~2.%%i*" %fquiet%
		for %%i in ("!vVol!\..") do mkdir "%%~fi" %quiet%
		rem Connect to the repository (versions[/tags/commits] are [hidden] subfolders)
		set vCmd=!cWmic!^>"%cVol%\%~2.pid"
		set vCmd=!vCmd! ^& ^( for /f "skip=1" %%a in ^('type "%cVol%\%~2.pid"'^) do set /a vPid=%%a ^) 1^>nul
REM		set vCmd=!vCmd! ^& title %~2~pid=^^!vPid^^!
		set vCmd=!vCmd! ^& del "%cVol%\%~2.pid" /f /q !quiet!
		set vCmd=!vCmd! ^& echo:1^>"%cVol%\%~2.pid_^!vPid^!"
		set vCmd=!vCmd! ^& "%cHub%" %cDbg% "%cUrl%/%~2" "!vVol!" 1^>"%cLog%\%~2-all-%sDate%_%sTime%.hubfs.log" 2^>^&1
		set vCmd=!vCmd! ^& del "%cVol%\%~2.pid_^!vPid^!" /f /q !quiet!
		start "%~2~pid" /b cmd /v:on /c " !vCmd! "
	) else (
		for %%i in ("def" "pid") do del "%cVol%\%~2.%%i" !fquiet!
		rem Remove pending deferred unmount (move on top if race condition)
		for /f %%i in ('dir /b /on /a:-d "%cVol%\%~2.def_*" 2^>nul') do (
			set "vPid=%%~xi"
			taskkill /f /t /pid !vPid:*.def_=! !quiet!
			del "%cVol%\%%i" !fquiet!
		)
		rem Increase refcount
		for /f %%i in ('dir /b /on /a:-d "%cVol%\%~2.pid_*" 2^>nul') do (
			set /p vRef=<"%cVol%\%%i"
			set /a "vRef+=1"
			echo:!vRef!>"%cVol%\%%i"
		)
	)
	rem Check if repository is mounted
	set /a vCnt=10
:repo_mount_loop
	ping localhost -n 2 %quiet%
	set /a vCnt-=1
	rem Check if 'hubfs' exited prematurely (all '.pid' files removed)
	for /f %%a in ('dir /b "%cVol%\%~2.pid*" 2^>nul ^| find /v /c ""') do set /a vPid=%%a
	pushd "!vVol!" 2>nul && popd || if !vPid! gtr 0 goto :repo_mount_loop
%end%

:repo_unmount %1 self, %2 repository name
%begin%
	set "vExe=%~2" & set "vExe=!vExe:*__=!"
	set "vVol=%cVol%\!vExe!"
	rem Decrease refcount
	for /f %%i in ('dir /b /on /a:-d "%cVol%\%~2.pid_*" 2^>nul') do (
		set "vPid=%%~xi"
		set /p vRef=<"%cVol%\%%i"
		set /a "vRef-=1"
		echo:!vRef!>"%cVol%\%%i"
		if !vRef! leq 0 (
			%log% Unmount repository ^(in "!vVol!"^)
			set vCmd=taskkill /f /t /pid !vPid:*.pid_=! !quiet! ^& ping localhost -n 1 !quiet! ^& del "%cVol%\%%i" /f /q !quiet!
			if defined deferred (
				set /a deferred=!deferred!
				if !deferred! gtr 0 (
					%log%   Deferred ^(in !deferred! seconds^)
					set vDef=!cWmic!^>"%cVol%\%~2.def"
					set vDef=!vDef! ^& ^( for /f "skip=1" %%a in ^('type "%cVol%\%~2.def"'^) do set /a vPid=%%a ^) 1^>nul
REM					set vDef=!vDef! ^& title %~2~def=^^!vPid^^!
					set vDef=!vDef! ^& del "%cVol%\%~2.def" /f /q !quiet!
					set vDef=!vDef! ^& echo:!deferred!^>"%cVol%\%~2.def_^!vPid^!"
					set vDef=!vDef! ^& timeout /t !deferred! /nobreak !quiet!
					set vCmd=!vDef! ^& !vCmd!
					set vCmd=!vCmd! ^& del "%cVol%\%~2.def_^!vPid^!" /f /q !quiet!
				)
			)
			start "%~2~def" /b cmd /v:on /c " !vCmd! "
		)
	)
%end%

:config_load %1 self, %2+ configuration filenames
%begin%
:config_load_loop
	set "vCfg=%cd%\%~2.cfg"
	if exist "!vCfg!" (
		%log% Load configuration files ^("!vCfg!"^)
		for /f "usebackq tokens=1* delims=?=" %%i in ("!vCfg!") do (
			rem Retrieve parameters
			if "%%j"=="" (
				rem Default is path to append
				set "vVar=path"
				set "ret=%%i"
			) else (
				set "vVar=%%~i"
				set "ret=%%j"
			)
			rem Check variable not commented out (name with invalid characters)
			echo(!vVar!|findstr /i /r /x "[0-9a-z_+]*" >nul) && (
				rem Check relative path (. or ..)
				if "!ret:~0,1!"=="." call :expand "" "%cVol%\!ret!"
				rem Check if 'wm_app' dependency to mount
				if /i "!ret!"=="%cApp%!ret:*%cApp%=!" (
					set "ret=!ret:/=\!"
					for /f "tokens=1,2* delims=\" %%a in ("!ret!") do set "vWid=%%a" & set "vVer=%%b" & set "vTmp=%%c"
					call :repo_mount "" "!vWid!"
					set /a "aDep+=1" & set "aDep[!aDep!]=!vWid!"
					rem Don't check version/tag exists, "trust the user"
					if "!vVer!"=="" set "ret=!vWid!\latest"
					call :expand "" "%cVol%\!ret:*__=!"
				)
				if /i "!vVar!"=="path" (
					if "!ret:~-1!"=="\" set "ret=!ret:~0,-1!"
					rem There is a bug in batch making both 'exist' and '~a' to fail on link
					set "vDir=" & pushd "!ret!" 2>nul && popd || set "vDir=1"
					if defined vDir (
						rem Executable (relative, absolute or mounted repository)
						for %%g in ("!ret!") do (
							set "vDir=%%~dpg" & if "!vDir:~-1!"=="\" set "vDir=!vDir:~0,-1!"
							set "vExe=%%~ng"
							set "vExt=%%~xg"
						)
						rem If executable with extension (not "failed" folder detection)
						if not "!vExt!"=="" (
							%log% %sInf% Checking for available "!vExe!!vExt!" to supersede...
							if defined where (
								rem Beware, 'where' is very slow on remote mount points
								for /f "delims=" %%a in ('where $path:"!vExe!!vExt!" 2^>nul') do (
									set "vExe=%%~dpa" & if "!vExe:~-1!"=="\" set "vExe=!vExe:~0,-1!"
									if not "!vDir!"=="!vExe!" (
										%log% %sInf% Found "!vExe!" to remove
										call set "path=%%path:!vExe!=%%"
									)
								)
							) else (
								call :where "" "!vExe!!vExt!"
								for %%a in (!ret!) do (
									set "vExe=%%~dpa" & if "!vExe:~-1!"=="\" set "vExe=!vExe:~0,-1!"
									if not "!vDir!"=="!vExe!" (
										%log% %sInf% Found "!vExe!" to remove
										call set "path=%%path:!vExe!=%%"
									)
								)
							)
							set "ret=!vDir!"
						)
					)
					rem Append path
					set "path=!path!;!ret!"
				) else (
					if "!vVar:~-1!"=="+" (
						rem Append parameter
						set "vVar=!vVar:~0,-1!"
						call set "!vVar!=%%!vVar!%% !ret!"
					) else (
						call set "!vVar!=!ret!"
					)
					for %%n in (!vVar!) do if "!%%n:~0,1!"==" " set "%%n=!%%n:~1!"
				)
			)
		)
	)
	rem Get next parameter
	shift
	if not "%~2"=="" goto :config_load_loop
%end%

:clean_path %1 self
%begin% %log% Clean 'path' environment variable
	for /l %%l in (0,1,2) do (
		set "path=!path:;%%SystemRoot;=;!"
		set "path=!path:\\=\!"
		set "path=!path:\;=;!"
		set "path=!path:;;=;!"
		set "path=!path: ;=;!"
		set "path=!path:; =;!"
		if "!path:~0,1!"==";" set "path=!path:~1!"
		if "!path:~-1!"==";" set "path=!path:~0,-1!"
	)
%end%

:expand %1 self, %2 string to expand
%begin%
	set "ret=%~f2"
%end%

:check_param %1 self, %2 parameter to check
%begin% %log% Check parameter ^("%~2"^)
	if not "%~2"=="" (
		if exist "%~f2\" (
			%log% %sInf% IS DIR ^(set cd="%~f2"^)
			set /a "vChk=2"
			set "cd=%~f2"
		) else if exist "%~f2" (
			%log% %sInf% IS FILE ^(set cd="%~dp2"^)
			set /a "vChk=1"
			set "cd=%~dp2"
		) else (
			%log% %sInf% UNKNOWN
			set /a "vChk=0"
		)
	) else (
		%log% %sInf% EMPTY
		set /a "vChk=-1"
	)
%end%

:enforce_cd %1 self
%begin%
	rem i.e. for Total Commander, if placed into a menu bar
	if "%cd:~-1%"=="\" set "cd=%cd:~0,-1%"
	%log% Enforce current dir ^("%cd%"^)
	cd /d "%cd%"
%end%

:dependency_check %1 self, %2 dependency to check
%begin% %log% Check dependency exist ^("%~2"^)
	rem Beware, 'where' is very slow on remote mount points
	if defined where (
		where /q "%~2" || %end% 2
	) else (
		call :where "" "%~2"
		if "!ret!"=="" %end% 2
	)
%end%

:where %1 self, %2 file to find
%begin%
	set "ret="
	rem Get the filename
	for %%a in ("%~2") do (
		%log% Look for file ^("%%~a"^)
		rem Get the extension (if specified)
		set "lExt=%%~xa"
		rem Default is executable extensions list (including "weird" ones)
		if "!lExt!"=="" set "lExt=%pathext%"
		rem Sanitize path (from protected folders)
		set "lDir=;!path:;%SystemRoot%;=;!"
		for %%c in ("!lDir:;=" "!") do (
			rem Inject path into extension list (replacing separator)
			set "lTmp=;!lExt!"
			set "lTmp=!lTmp:;=" "%%~c\%%~na!""
			set "lTmp=!lTmp:~2!"
			rem You can fetch multiple extensions at once (provided they are in the same folder)
			if not "%%~c"=="" for /f "delims=" %%d in ('dir /b /s !lTmp! 2^>nul') do (
				set "ret=!ret!;"%%~d""
			)
		)
		rem Convert to space separated list of paths
		if "!ret:~0,1!"==";" set "ret=!ret:~1!"
		if not "!ret!"=="" set "ret=!ret:;= !"
	)
%end%

rem  - - - TOOLBOX - - - -

:clean_filename %1 self, %2 filename to clean
%begin%
	set "ret=%~2"
	%log% Clean filename ^("!ret!"^)
	set "vTmp="
:clean_filename_loop
	rem Remove asterix
	for /f "tokens=1* delims=*" %%a in ("!ret!") do (
		set "vTmp=!vTmp!-%%a" & set "ret=%%b"
	)
	if defined ret goto :clean_filename_loop
	set "ret=!vTmp:~1!"
	if "!ret!"=="" set "ret=%~2"
	for %%a in ("""'" "/_" ":_" "<_" ">_" "?_" "\_" "|_") do set "vTmp=%%~a" & call set "ret=%%ret:!vTmp:~0,1!=!vTmp:~-1!%%"
%end%

:accent_remove %1 self, %2 string to clean
%begin%
	set "ret=%~2"
	%log% Remove accent ^("!ret!"^)
	rem First character of a group is replaced with remaining characters (mismatch for 'Ç' and 'Ö')
	for %%a in (¡_ ¿_ áa ÁA àa ÀA âa ÂA äa ÄA ãa ÃA åa ÅA æae ÆAE çc ÇC ðo ÐD ée ÉE èe ÈE êe ÊE ëe ËE íi ÍI ìi ÌI îi ÎI ïi ÏI ñn ÑN óo ÓO òo ÒO ôo ÔO öo ÖO õo ÕO øo ØO œoe ŒOE ßSS úu ÚU ùu ÙU ûu ÛU üu ÜU ýy ÝY ÿy ŸY) do set "vTmp=%%~a" & call set "ret=%%ret:!vTmp:~0,1!=!vTmp:~1!%%"
%end%

:expand_path_attr %1 self, %2 string to expand (contains $[...]), %3 string to inject
%begin%
	rem Beware of spaces and/or double quotes, it gets "exploded"
	set "ret=%2"
REM	set "ret=%~f2"
	%log% Expand path and attributes ^("!ret!" with "%~3"^)
	set "ret=!ret:$[FULL]=%~f3!"
	set "ret=!ret:$[DISK]=%~d3!"
	set "ret=!ret:$[FOLD]=%~p3!"
	set "ret=!ret:$[PATH]=%~dp3!"
	rem Remove language "extension" of subtitles
	set "ret=!ret:$[LANG]=%~dpn3!"
	set "ret=!ret:$[NAME]=%~n3!"
	set "ret=!ret:$[DOSN]=%~s3!"
	set "ret=!ret:$[EXT]=%~x3!"
	set "ret=!ret:$[FILE]=%~nx3!"
	rem Attributes as a string
	set "ret=!ret:$[ATTR]=%~a3!"
	set "ret=!ret:$[TIME]=%~t3!"
	set "ret=!ret:$[SIZE]=%~z3!"
	rem Remove double characters
	set "ret=!ret:\\=\!"
	set "ret=!ret:""="!"
%end%

:string_length_get %1 self, %2 string to get length
%begin%
	set "vTmp=%~2"
	%log% Get string length ^(of "!vTmp!"^)
	set /a "ret=0"
	rem 13 steps "4096 down to 1" offset check, max offset is 8191
	for /l %%i in (12,-1,0) do for /f %%j in ('set /a "!ret!+(1<<%%i)"') do if not "!vTmp:~%%j,1!"=="" set /a "ret=%%j"
%end%

:window_name_get %1 self, %2 window filter
%begin% %log% Get window name ^(from "%~2"^)
	rem Only works for non hidden window (ie. not started with 'start /b')
	rem Title may begin with "Administrateur : " or similar if in admin mode
	set "ret="
	for /f "tokens=2 delims=," %%a in ('tasklist /fi "WINDOWTITLE eq %~2*" /fo:csv /nh') do (
		rem Using a 2-stage approach because 'tasklist' is dead slow when using WINDOWTITLE and /v
		for /f "tokens=9 delims=," %%b in ('tasklist /fi "PID eq %%~a" /fo:csv /nh /v') do set "ret=%%~b"
	)
%end%
