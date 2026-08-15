# wm_app

<!-- - [Usage](#usage) -->
<!-- - [Applications](#applications) -->
<!-- - [Inner working](#inner-working) -->
<!-- 	- [Folders](#folders) -->
<!-- 	- [Script](#script) -->
<!-- 	- [Environment variables](#environment-variables) -->
<!-- 	- [Configuration file](#configuration-file) -->
<!-- 	- [Command override](#command-override) -->

<!-- ![wm_app image](./wm_app.png "wm_app image") -->
<img src="./wm_app.png" alt="wm_app image" width="225" />

	Cloud Application Repository

Can run a selection of online application everywhere, remotely.

Without installing them locally (but the file system abstractors).

* Home

https://github.com/wenuam/wm_app

[wm_app]: https://github.com/wenuam/wm_app

## Usage

1. Install the latest version of [WinFsp] (you *MUST* have `admin`/`root` rights though)
1. Clone or download/extract this repository to have access to its whole structure
1. Explore the folder tree and run a `batch`/`bash` file to execute the corresponding cloud application
1. Wait a bit until the application starts (executed from `%HomeDrive%\Volumes\wm_app`)

Usually it is the **AMD64** (aka **x86_64**, aka **x64**) binaries that are presented, unless no other option available.

Whenever possible, the **Linux** binaries are available alongside the **Windows** binaries, sharing common data files.

[WinFsp]: https://github.com/winfsp/winfsp/releases/latest

## Applications

List of currently available cloud applications :

| Application			| Version and date		| Type and path		| CFS	| Linux binaries	|
| :---					| :---					| :---				| :--:	| :---				|
| [ArduinoIDE]			| 2.3.7_251217			| dev/sdk/mcu		| X		| 					|
| [Bob]					| 1.7.6_240311			| doc/wiki/tiddly	| 		| 					|
| [ctags]				| 6.2.20260329.0_260329	| dev/ast			| 		| 					|
| [Dia]					| 0.97.2_120119			| img/2d/ed			| 		| 					|
| [ditaa]				| 0.11.0_180114			| img/2d/gen		| 		| 					|
| [Erlang]				| 28.3.2_260220			| dev/lng/erl		| 		| 					|
| [FreePascal]			| 3.2.2_210519			| dev/lng/pas		| 		| 					|
| [Ghostscript]			| 10.06.0_250909		| doc/pdf/cnv		| 		| 					|
| [Git]					| 2.52.0_251117			| dev/scm/git		| 		| 					|
| [Graphviz]			| 14.0.5_251129			| img/2d/gen		| 		| 					|
| [ImageMagick]			| 7.1.2-8_251026		| img/2d/gen		| 		| 					|
| [Inkscape]			| 1.4.2_250513			| img/2d/ed			| 		| 					|
| [jdk]					| 25.0.1_250925			| dev/lng/jar		| X		| 					|
| [Lua]					| 5.4.8_250605			| dev/lng/lua		| 		| 					|
| [Miktex]				| 25.12_251231			| doc/tex/gen		| 		| 					|
| [Modula2]				| 0.11.0_180114			| dev/lng/m2		| 		| 					|
| [mscgen]				| 8.6.3_250908			| img/2d/gen		| 		| 					|
| [my_basic]			| 1.2.2_250429			| dev/lng/bas		| 		| 					|
| [node]				| 25.2.1_251117			| dev/lng/js		| 		| 					|
| [Pandoc]				| 3.8.3_251201			| doc/cnv			| X		| 					|
| [PellesC]				| 14.00_260407			| dev/lng/c			| 		| 					|
| [pfm]					| 24X_241121			| sys/win/fs		| 		| 					|
| [Picat]				| 3.9.11_260716			| dev/lng/pi		| 		| Almost all		|
| [PlantUML]			| 1.2025.10_251104		| img/2d/gen		| 		| 					|
| [PostgreSQL]			| 18.1.1_251112			| db/sql			| X		| 					|
| [QEMU]				| 10.2.0_251224			| sys/emu			| 		| 					|
| [Racket]				| 9.0.0_251121			| dev/lng/rkt		| 		| 					|
| [StrawberryPerl]		| 5.42.0.1_250801		| dev/lng/pl		| 		| 					|
| [SysinternalsSuite]	| 251120				| sys/win			| 		| 					|
| [Tabula]				| 1.2.1_180604			| doc/pdf/utl		| 		| 					|
| [Tesseract]			| 5.5.0_241111			| img/ocr			| 		| 					|
| [vera]				| 1.3.0_150123			| dev/ast			| 		| 					|
| [vlang]				| 0.4.12_250919			| dev/lng/v			| 		| 					|
| [WinLibs]				| 15.2.0r4_251202		| dev/lng/cpp		| 		| 					|
| [yEd]					| 3.25.1_250219			| img/2d/ed			| 		| 					|
| [xidel]				| 0.9.9.8842_230616		| dev/ast			| 		| 					|

[ArduinoIDE]: https://github.com/wenuam/wm_app_dev_sdk_mcu__ArduinoIDE
[Bob]: https://github.com/wenuam/wm_app_doc_wiki_tiddly__Bob
[ctags]: https://github.com/wenuam/wm_app_dev_ast__ctags
[Dia]: https://github.com/wenuam/wm_app_img_2d_ed__Dia
[ditaa]: https://github.com/wenuam/wm_app_img_2d_gen__ditaa
[Erlang]: https://github.com/wenuam/wm_app_dev_lng_erl__Erlang
[FreePascal]: https://github.com/wenuam/wm_app_dev_lng_pas__FreePascal
[Ghostscript]: https://github.com/wenuam/wm_app_doc_pdf_cnv__Ghostscript
[Git]: https://github.com/wenuam/wm_app_dev_scm_git__Git
[Graphviz]: https://github.com/wenuam/wm_app_img_2d_gen__Graphviz
[ImageMagick]: https://github.com/wenuam/wm_app_img_2d_gen__ImageMagick
[Inkscape]: https://github.com/wenuam/wm_app_img_2d_ed__Inkscape
[jdk]: https://github.com/wenuam/wm_app_dev_lng_jar__jdk
[Lua]: https://github.com/wenuam/wm_app_dev_lng_lua__Lua
[Miktex]: https://github.com/wenuam/wm_app_doc_tex_gen__Miktex
[Modula2]: https://github.com/wenuam/wm_app_dev_lng_m2__Modula2
[mscgen]: https://github.com/wenuam/wm_app_img_2d_gen__mscgen
[my_basic]: https://github.com/wenuam/wm_app_dev_lng_bas__my_basic
[node]: https://github.com/wenuam/wm_app_dev_lng_js__node
[Pandoc]: https://github.com/wenuam/wm_app_doc_cnv__Pandoc
[PellesC]: https://github.com/wenuam/wm_app_dev_lng_c__PellesC
[pfm]: https://github.com/wenuam/wm_app_sys_win_fs__pfm
[Picat]: https://github.com/wenuam/wm_app_dev_lng_pi__Picat
[PlantUML]: https://github.com/wenuam/wm_app_img_2d_gen__PlantUML
[PostgreSQL]: https://github.com/wenuam/wm_app_db_sql__PostgreSQL
[QEMU]: https://github.com/wenuam/wm_app_sys_emu__QEMU
[Racket]: https://github.com/wenuam/wm_app_dev_lng_rkt__Racket
[StrawberryPerl]: https://github.com/wenuam/wm_app_dev_lng_pl__StrawberryPerl
[SysinternalsSuite]: https://github.com/wenuam/wm_app_sys_win_utl__SysinternalsSuite
[Tabula]: https://github.com/wenuam/wm_app_doc_pdf_utl__Tabula
[Tesseract]: https://github.com/wenuam/wm_app_img_ocr__Tesseract
[vera]: https://github.com/wenuam/wm_app_dev_ast__vera
[vlang]: https://github.com/wenuam/wm_app_dev_lng_v__vlang
[WinLibs]: https://github.com/wenuam/wm_app_dev_lng_cpp__WinLibs
[yEd]: https://github.com/wenuam/wm_app_img_2d_ed__yEd
[xidel]: https://github.com/wenuam/wm_app_dev_ast__xidel

<details>

TO PUSH:

| Application			| Version and date		| Type and path		| CFS	| Linux binaries	|
| :---					| :---					| :---				| :---	| :---				|
| [cloc]				| 2.08_260125			| dev/utl			| 		| 					|
| [CPAchecker]			| 4.2.2_251201			| dev/utl			| 		| 					|
| [Cppcheck]			| 2.20.0_260302			| dev/utl			| 		| 					|
| [Doxygen]				| 1.16.1_260111			| dev/doc/gen		| X		| 					|
| [DrMemory]			| 2.6.0_230921			| dev/utl			| 		| 					|
| [Jenkins]				| 2.558.0_260407		| dev/cicd			| X		| 					|
| [SonarQube]			| 26.4.0.121862_260410	| dev/chk			| X		| 					|
| [VSCode]				| 1.115.0_260408		| dev/ed/ide		| X		| 					|

TO DO:

Cleaner:

| Application			| Version and date		| Type and path		| CFS	| Linux binaries	|
| :---					| :---					| :---				| :---	| :---				|
| [AdwCleaner]			| ...					| sys/clr			| 		| 					|
| [AppBuster]			| ...					| sys/clr			| 		| 					|
| [CCleaner]			| ...					| sys/clr			| 		| 					|
| [CleanTemp]			| ...					| sys/clr			| 		| 					|
| [LastActivityView]	| ...					| sys/clr			| 		| 					|
| [PrivaZer]			| ...					| sys/clr			| 		| 					|
| [RogueKiller]			| ...					| sys/clr			| 		| 					|
| [Shellbag]			| ...					| sys/clr			| 		| 					|
| [ShutUp10]			| ...					| sys/clr			| 		| 					|
| [UCheck]				| ...					| sys/clr			| 		| 					|

Coding:

| Application			| Version and date		| Type and path		| CFS	| Linux binaries	|
| :---					| :---					| :---				| :---	| :---				|
| [Elm]					| ...					| dev/lng/elm		| 		| 					|
| [mingw64]				| ...					| dev/lng/c			| 		| 					|
| [msys64]				| ...					| dev/lng/c			| 		| 					|
| [Python]				| ...					| dev/lng/py		| 		| 					|
| [Sourcetrail]			| ...					| dev/ast			| 		| 					|
| [Spyder]				| ...					| dev/lng/py		| 		| 					|
| [tinycc]				| ...					| dev/lng/c			| 		| 					|
| [TortoiseGit]			| ...					| dev/scm/git		| 		| 					|

Document:

| Application			| Version and date		| Type and path		| CFS	| Linux binaries	|
| :---					| :---					| :---				| :---	| :---				|
| [LibreOffice]			| ...					| doc/odt/clr		| 		| 					|
| [pdf4qt]				| ...					| doc/pdf/clr		| 		| 					|
| [PDFtk]				| ...					| doc/pdf/clr		| 		| 					|
| [SumatraPDF]			| ...					| doc/pdf/clr		| 		| 					|
| [texmaker]			| ...					| doc/tex/clr		| 		| 					|
| [TeXnicCenter]		| ...					| doc/tex/clr		| 		| 					|
| [texstudio]			| ...					| doc/tex/clr		| 		| 					|
| [XpdfReader]			| ...					| doc/pdf/clr		| 		| 					|

Editor:

| Application			| Version and date		| Type and path		| CFS	| Linux binaries	|
| :---					| :---					| :---				| :---	| :---				|
| [WordpadXP]			| ...					| sys/win/clr		| 		| 					|
| [Accessoires]			| ...					| sys/win/clr		| 		| 					|
| [LEd]					| ...					| sys/win/clr		| 		| 					|
| [lite]				| ...					| sys/win/clr		| 		| 					|
| [MindForger]			| ...					| sys/win/clr		| 		| 					|
| [Notepad++]			| ...					| sys/win/clr		| 		| 					|
| [Notepad2-mod]		| ...					| sys/win/clr		| 		| 					|
| [TextAnalysisTool.NET] | ...					| sys/win/clr		| 		| 					|
| [TreeSheets]			| ...					| sys/win/clr		| 		| 					|
| [WinMerge]			| ...					| sys/win/clr		| 		| 					|

Game:

| Application			| Version and date		| Type and path		| CFS	| Linux binaries	|
| :---					| :---					| :---				| :---	| :---				|
| [castlotw]			| ...					| gam/rpg			| 		| 					|
| [MMCE]				| ...					| gam/3d			| 		| 					|

Image:

| Application			| Version and date		| Type and path		| CFS	| Linux binaries	|
| :---					| :---					| :---				| :---	| :---				|
| [Blender]				| ...					| img/3d/ed			| 		| 					|
| [IrfanView]			| ...					| img/2d/ed			| 		| 					|
| [openscad]			| ...					| img/2d/ed			| 		| 					|
| [paint.net]			| ...					| img/2d/ed			| 		| 					|
| [wings3d]				| ...					| img/3d/ed			| 		| 					|

Internet:

| Application			| Version and date		| Type and path		| CFS	| Linux binaries	|
| :---					| :---					| :---				| :---	| :---				|
| [Chrome]				| ...					| net/web/clr		| 		| 					|
| [curl]				| ...					| net/url/clr		| 		| 					|
| [FileZilla]			| ...					| net/ftp/clr		| 		| 					|
| [Firefox]				| ...					| net/web/clr		| 		| 					|
| [TightVNC]			| ...					| net/vnc/clr		| 		| 					|
| [TTYEmulator]			| ...					| net/tty/clr		| 		| 					|
| [UltraVNC]			| ...					| net/vnc/clr		| 		| 					|
| [wget]				| ...					| net/url/clr		| 		| 					|

Manager:

| Application			| Version and date		| Type and path		| CFS	| Linux binaries	|
| :---					| :---					| :---				| :---	| :---				|
| [TotalCommander]		| ...					| sys/win/clr		| 		| 					|

Sound:

| Application			| Version and date		| Type and path		| CFS	| Linux binaries	|
| :---					| :---					| :---				| :---	| :---				|
| [Audacity]			| ...					| sys/win/clr		| 		| 					|

System:

| Application			| Version and date		| Type and path		| CFS	| Linux binaries	|
| :---					| :---					| :---				| :---	| :---				|
| [7Zip]				| ...					| sys/win/clr		| 		| 					|
| [bug.n]				| ...					| sys/win/clr		| 		| 					|
| [CapsUnlock]			| ...					| sys/win/clr		| 		| 					|
| [CrossHair]			| ...					| sys/win/clr		| 		| 					|
| [CrystalDiskMark]		| ...					| sys/win/clr		| 		| 					|
| [DirectShutdown]		| ...					| sys/win/clr		| 		| 					|
| [DragLock]			| ...					| sys/win/clr		| 		| 					|
| [expanso]				| ...					| sys/win/clr		| 		| 					|
| [flux]				| ...					| sys/win/clr		| 		| 					|
| [JoyToKey]			| ...					| sys/win/clr		| 		| 					|
| [KeyboardStatus]		| ...					| sys/win/clr		| 		| 					|
| [MyDefrag]			| ...					| sys/win/clr		| 		| 					|
| [NumLocker]			| ...					| sys/win/clr		| 		| 					|
| [PureText]			| ...					| sys/win/clr		| 		| 					|
| [ReallySlickScreensavers] | ...				| sys/win/clr		| 		| 					|
| [StayFocused]			| ...					| sys/win/clr		| 		| 					|
| [SuperFastClicker]	| ...					| sys/win/clr		| 		| 					|
| [SysExporter]			| ...					| sys/win/clr		| 		| 					|
| [UsbDeview]			| ...					| sys/win/clr		| 		| 					|
| [UsbTreeView]			| ...					| sys/win/clr		| 		| 					|
| [WinAeroTweaker]		| ...					| sys/win/clr		| 		| 					|

Video:

| Application			| Version and date		| Type and path		| CFS	| Linux binaries	|
| :---					| :---					| :---				| :---	| :---				|
| [A's Video Converter]	| ...					| sys/win/clr		| 		| 					|
| [K-Lite Codec Pack]	| ...					| sys/win/clr		| 		| 					|
| [LICEcap]				| ...					| sys/win/clr		| 		| 					|
| [mpv]					| ...					| sys/win/clr		| 		| 					|
| [OBS-Studio]			| ...					| sys/win/clr		| 		| 					|
| [Subtitle Edit]		| ...					| sys/win/clr		| 		| 					|

</details>

## Inner working

[WinFsp] is a [FUSE] equivalent for [Windows] which allows to mount various kind of file systems. One particular is [HubFS] which allows to mount a [GitHub] repository as a folder, with all its branches and tags as subfolders.

[FUSE]: https://github.com/libfuse/libfuse
[Windows]: https://www.microsoft.com/windows
[HubFS]: https://github.com/winfsp/hubfs
[GitHub]: https://github.com

With a based naming convention and carefully crafted directory tree architecture, it is possible to "automate" the mounting and execution of an application, with optional configuration file and dependencies.

Just select the application (i.e. `Picat`) and go into the right folder (`dev/lng/pi`) to run the launcher script (`Picat.bat`). Wait a bit for the remote repository to be mounted, the application cached then executed like it was installed on the computer.

Yet it is not. That's all the "magic" of it.

It's like a virtual "Docker" that is ephemeral as it won't stay on the disk once the application is closed. It won't require a lengthy creation of a local image file since the application files are remote and are made available through mount points.

Some still have to be "cached" locally to be run with acceptable performance though, so it's a compromise between having a cluttered hard disk with barely used applications of various versions (even obsolete) and an always up-to-date online alternative.

### Script

Each `batch`/`bash` file is a "cloud" application startup script.

It will mount a repository based on its path and filename (with optional version).

Say `wm_app/dev/lng/pi/Picat-3.6.8_240527.bat` will mount `wm_app_dev_lng_pi__Picat` into `%HomeDrive%\Volumes\wm_app\wm_app_dev_lng_pi__Picat` and run `%HomeDrive%\Volumes\wm_app\wm_app_dev_lng_pi__Picat\3.6.8_240527\Picat.exe`.

If no version is specified, say `wm_app/dev/lng/pi/Picat.bat`,  by default the `latest` tag will be used and run `%HomeDrive%\Volumes\wm_app\wm_app_dev_lng_pi__Picat\latest\Picat.exe`.

Beware, some system commands (i.e. `where` in **Windows**) can execute *VERY* slowly (about 30 s) on mounted remote repositories because **HubFS** tends to preload everything first, instead of just the requested files. This may only happens during the first startup phase so be patient, subsequent runs will use the cached data. *Get a coffee, touch some grass...*

### Folders

Directory tree of a mounted **wm_app_dir_tree__Application** is as follow:

* :file_folder: `%HomeDrive%\Volumes`: all users
	* :file_folder: `wm_app`
		* :file_folder: **wm_app_dir_tree__Application** (actual mount point)
			* :file_folder: `version_date` or `tag` (as subfolders)
				* :hammer_and_wrench: The **Application** files...

In case of [CFS] container used because some application files are too big (no [LFS] support in **HubFS**) a second directory tree is mounted as follow:

[CFS]: https://github.com/wenuam/wm_app_sys_win_fs__pfm
[LFS]: https://git-lfs.com/

* :file_folder: `%HomeDrive%\Volumes`: all users (same as before)
	* :file_folder: **wm_app_dir_tree__Application-version_date** (second mount point, specific version)
		* :hammer_and_wrench: The **Application** files...

Log files (application's `stdout` and `stderr`, **HubFS**'s or [CFS]/**PtcFS**'s) are located here:

* :file_folder: `%AppData%`: user files (Roaming)
	* :file_folder: `wm_app`
		* :file_folder: **wm_app_dir_tree__Application** (the executed **Application**)
			* :file_folder: `log`
				* :file_folder: **%year%-%month%**
					* :page_with_curl: The `wm_app_dir_tree__Application-[version_date|tag]-%sDate%_%sTime%.[stdout|stderr|hubfs|ptcfs].log` files...

The log files may also include other mounted **wm_app** dependencies' as well.

### Environment variables

- `console`: is set to 0, the `batch`/`bash` file will wait for user input at exit.

> [!NOTE]
> The toggle is set at the beginning of the `batch`/`bash` file when ran from the graphic interface, so the console/terminal doesn't closes automatically at the application's exit. You may change its value with the configuration file (see [Configuration file](#configuration-file) below).

- `cli`: compose the command line to run with the name of other environment variables (may also use those defined in the configuration file, see below).

> [!NOTE]
> The application is typically run this way: `application %1 %2 %3 %4 %5 %6 %7 cli` (with `%1 - %7` being the parameters passed to the `batch`/`bash` file).

- `debug`: if set (regardless of its content) the script will output debug strings during the startup and clean-up phases.

- `deferred`: if set, optional [wm_app] dependencies will be unmounted after specified *SECONDS*.

It can be useful to leave a dependency used by another [wm_app] mounted for a little while, long enough to start the other application, hence not having to remount it just after having unmounted it (save some time).

When the other application is launched with its `batch`/`bash` file, the deferred unmount is cancelled, for the time being.

When no more application is using a dependency, and no deferred unmount is pending, it is effectively unmounted.

- `detached`: if set (regardless of its content) the application will run in a separate process (unstable, WIP).

- `exe`: if set, the `batch`/`bash` file will run the requested executable instead of the one based on the name of the repository (i.e. `wm_app_dev_lng_pi__Picat` will try to run `Picat.exe`).

> [!TIP]
> This one is quite useful when the executable is not located at the root of the repository (i.e. in the `./bin` folder instead). You may change its value with the configuration file (see [Configuration file](#configuration-file) below).

> [!TIP]
> You may want to set it to `cmd` or `./bin/cmd` to open a console instead the target application. Useful when there are other (command line) programs in the same folder (i.e. [ImageMagick]).

- `log`: if set to `stdout` and/or `stderr`, will redirect corresponding output to log files (see [Folders](#folders) above).

> [!NOTE]
> By default the application's output are not logged (i.e. console wouldn't be able to interact with the user).

### Configuration file

* A configuration file can be located alongside the `batch`/`bash` file.

Its filename shall reflect the `batch`/`bash` filename, including the version number and date, or "more", separated with `-` dashes (*not* underscores `_`).

First will be loaded the `base.cfg` file, then the `base-version.cfg` file, finally the `base-version-more.cfg` file, if available.

This way it will replace generic settings with gradually more specific, depending on the use case.

Say `Picat-3.6.8_240527.bat` will try to load `Picat.cfg` first, then `Picat-3.6.8_240527.cfg`.

Hence you can set common settings for all versions in the generic `base.cfg` configuration file.

The `base-version-more.cfg` configuration is for "more" specific use cases, like setting virtual environments and such.

For this though, the `batch`/`bash` filename shall reflect the expected configuration file to load.

Thus `Picat-3.6.8_240527-sat_demo.bat` will also load `Picat-3.6.8_240527-sat_demo.cfg`, if present.

If it is not based on an available `version`, it will use the `latest` tag by default, use this with care though as the settings might not be compatible with the `latest` version.

That's to say `Picat-sat_demo.bat` will mount `wm_app_dev_lng_pi__Picat/latest`, yet load `Picat-sat_demo.cfg`, not `Picat-latest-sat_demo.cfg`.

* As for the configuration file's content, the format is pretty straightforward:

```text
./bin
path=../test
exe=bin/Picat.exe

wm_app_dev_lng_pi__Picat
wm_app_dev_lng_pi__Picat/3.6.8_240527
wm_app_dev_lng_pi__Picat/3.6.8_240527/Picat.exe

test=2
console=
deferred=30
```

If a line doesn't set a variable (i.e. `./bin`) it is assumed to set the `path` variable by default.

If a `path` variable is set, it will be appended to the `path` environment variable (at the end).

Relative paths (starting with `.`/`..`) are resolved *from* the application's executable folder (i.e. usually `%HomeDrive%\Volumes\wm_app\wm_app_dir_tree__Application\latest`).

If the path starts with "**wm_app_**" is it assumed being a [wm_app] dependency to be mounted automatically *BEFORE* the application starts. Can be quite long depending on network speed and planets alignment. *Get coffee, touch grass...*

> [!IMPORTANT]
> Dependencies' own configuration files are not loaded from their respective [wm_app] folder, its up to the executed `batch`/`bash` file to set everything right (virtual environment settings, etc) using its own configuration file.

If no version is specified (i.e. just `wm_app_dev_lng_pi__Picat`), the `latest` one will be appended to the `path` environment variable (i.e. `%HomeDrive%\Volumes\wm_app\wm_app_dev_lng_pi__Picat\latest`).

If a specific executable name is specified (i.e. `wm_app_dev_lng_pi__Picat/3.6.8_240527/Picat.exe`) and one is already accessible amongst the `path` environment variable, its path will be removed in order to leave only the specified executable available.

> [!WARNING]
> This way it is possible to supersede an installed or another mounted executable (i.e. an incompatible `java` version) without having to worry about the `path` environment variable's resolution precedence. All applications and dependencies will use the specified executable though. So be careful, even if it is only during the `batch`/`bash` file's session lifetime.

The other variables are initialized with the configuration file's content (i.e. `test` will be set to 2, `console` unset, etc). They can be used by the application and the script through the usual syntax for environment variables (i.e. `%test%` on **Windows**, `$test` or `${test}` on **Linux**).

Hence it is possible to set the `deferred` environment variable this way, as it'll be used only at the application's exit.

> [!CAUTION]
> Still, beware of the values' syntax and format, `batch`/`bash` files' inner evaluation mechanism may come into play and interfere. *Coffee, grass, the usual routine...*

### Command override

Some internal commands are buggy on remote mount points (i.e. `where` in [Windows]) so a similar one has been coded to be able to tweak its internals.
