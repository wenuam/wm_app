# wm_app

<!-- - [Usage](#usage) -->
<!-- - [Applications](#applications) -->
<!-- - [Inner working](#inner-working) -->
<!-- 	- [Folders](#folders) -->
<!-- 	- [Script](#script) -->
<!-- 	- [Environment variables](#environment-variables) -->
<!-- 	- [Configuration file](#configuration-file) -->
<!-- 	- [Command override](#command-override) -->
<!-- 	- [Command deprecation](#command-deprecation) -->

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

| Application			| Version and date	| Type and path		| Linux binaries	|
| :---					| :---				| :---				| :---				|
| [ArduinoIDE]			| 2.3.7_251217		| dev/sdk/mcu		| 					|
| [Bob]					| 1.7.6_240311		| doc/wiki/tiddly	| 					|
| [Dia]					| 0.97.2_120119		| img/2d/ed			| 					|
| [ditaa]				| 0.11.0_180114		| img/2d/gen		| 					|
| [Erlang]				| 28.3.2_260220		| dev/lng/erl		| 					|
| [FreePascal]			| 3.2.2_210519		| dev/lng/pas		| 					|
| [Ghostscript]			| 10.06.0_250909	| doc/pdf/cnv		| 					|
| [Git]					| 2.52.0_251117		| dev/scm/git		| 					|
| [Graphviz]			| 14.0.5_251129		| img/2d/gen		| 					|
| [ImageMagick]			| 7.1.2-8_251026	| img/2d/gen		| 					|
| [Inkscape]			| 1.4.2_250513		| img/2d/ed			| 					|
| [jdk]					| 25.0.1_250925		| dev/lng/jar		| 					|
| [Lua]					| 5.4.8_250605		| dev/lng/lua		| 					|
| [Miktex]				| 25.12_251231		| doc/latex/gen		| 					|
| [Modula2]				| 0.11.0_180114		| dev/lng/m2		| 					|
| [mscgen]				| 8.6.3_250908		| img/2d/gen		| 					|
| [my_basic]			| 1.2.2_250429		| dev/lng/bas		| 					|
| [node]				| 25.2.1_251117		| dev/lng/js		| 					|
| [Pandoc]				| 3.8.3_251201		| doc/cnv			| 					|
| [PellesC]				| 13.00_250521		| dev/lng/c			| 					|
| [pfm]					| 24X_241121		| sys/win/fs		| 					|
| [Picat]				| 3.9.5_260114		| dev/lng/pi		| Almost all		|
| [PlantUML]			| 1.2025.10_251104	| img/2d/gen		| 					|
| [PostgreSQL]			| 18.1.1_251112		| db/sql			| 					|
| [QEMU]				| 10.2.0_251224		| sys/emu			| 					|
| [Racket]				| 9.0.0_251121		| dev/lng/rkt		| 					|
| [StrawberryPerl]		| 5.42.0.1_250801	| dev/lng/pl		| 					|
| [SysinternalsSuite]	| 251120			| sys/win			| 					|
| [Tabula]				| 1.2.1_180604		| doc/pdf/utl		| 					|
| [Tesseract]			| 5.5.0_241111		| img/ocr			| 					|
| [vlang]				| 0.4.12_250919		| dev/lng/v			| 					|
| [WinLibs]				| 15.2.0r4_251202	| dev/lng/cpp		| 					|
| [yEd]					| 3.25.1_250219		| img/2d/ed			| 					|

[ArduinoIDE]: https://github.com/wenuam/wm_app_dev_sdk_mcu__ArduinoIDE
[Bob]: https://github.com/wenuam/wm_app_doc_wiki_tiddly__Bob
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
[vlang]: https://github.com/wenuam/wm_app_dev_lng_v__vlang
[WinLibs]: https://github.com/wenuam/wm_app_dev_lng_cpp__WinLibs
[yEd]: https://github.com/wenuam/wm_app_img_2d_ed__yEd

## Inner working

[WinFsp] is a [FUSE] equivalent for [Windows] which allows to mount various kind of file systems. One particular is [HubFS] which allows to mount a [GitHub] repository as a folder, with all its branches and tags as subfolders.

[FUSE]: https://github.com/libfuse/libfuse
[Windows]: https://www.microsoft.com/windows
[HubFS]: https://github.com/winfsp/hubfs
[GitHub]: https://github.com

With a based naming convention and carefully crafted directory tree architecture, it is possible to "automate" the mounting and execution of an application, with optional configuration file and dependencies.

Just select the application (i.e. `Picat`) and go into the right folder (`dev/lng/pi`) to run the launcher script (`Picat.bat`). Wait a bit for the remote repository to be mounted and the application executed like it was installed on the computer.

Yet it is not. That's all the "magic" of it.

It's like a virtual "Docker" that is ephemeral as it won't stay on the disk once the application is closed. It won't require a lengthy creation of a local image file since the application files are remote and are made available through mount points.

Some still have to be "cached" locally to be run with acceptable performance though, so it's a compromise between having a cluttered hard disk with barely used applications of various versions (even obsolete) and an always up-to-date online alternative.

### Script

Each `batch`/`bash` file is a cloud application startup script.

It will mount a repository based on its path and filename (with optional version).

Say `wm_app/dev/lng/pi/Picat-3.6.8_240527.bat` will mount `wm_app_dev_lng_pi__Picat` into `%HomeDrive%\Volumes\wm_app\Picat` and run `%HomeDrive%\Volumes\wm_app\Picat\3.6.8_240527\Picat.exe`.

If no version is specified, say `wm_app/dev/lng/pi/Picat.bat`,  by default the `latest` tag will be used and run `%HomeDrive%\Volumes\wm_app\Picat\latest\Picat.exe`.

Beware, some system commands (i.e. `where` in **Windows**) can execute *VERY* slowly (about 30 s) on mounted remote repositories because **HubFS** tends to preload everything instead of just the requested files. This may only happens during the startup phase so be patient. *Get a coffee, touch some grass...*

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

- `debug`: if set (regardless of its content, unused) the script will output debug strings during the startup and clean-up phases.

- `deferred`: if set, optional [wm_app] dependencies will be unmounted after specified *SECONDS*.

It can be useful to leave a dependency used by another [wm_app] mounted for a little while, long enough to start the other application, hence not having to remount it just after having unmounted it.

When the other application is launched with its `batch`/`bash` file, the deferred unmount is cancelled, for the time being.

When no more application is using a dependency, and no deferred unmount is pending, it is effectively unmounted.

- `detached`: if set (regardless of its content, unused), the application will run in a separate process (unstable).

- `exe`: if set, the `batch`/`bash` file will run the requested executable instead of the one based on the name of the repository (i.e. `wm_app_dev_lng_pi__Picat` will try to run `Picat.exe`).

> [!TIP]
> This one is quite useful when the executable is not located at the root of the repository (i.e. in the `./bin` folder instead). You may change its value with the configuration file (see [Configuration file](#configuration-file) below).

- `log`: if set to `stdout` and/or `stderr`, will redirect corresponding output to log files (see [Folders](#folders) above).

> [!NOTE]
> By default the application's output are not logged (i.e. console wouldn't be able to interact with the user).

### Configuration file

* A configuration file can be located alongside the `batch`/`bash` file.

Its filename shall reflect the `batch`/`bash` filename, including the version number (or "more") separated with `-` dashes (*not* underscores `_`).

First will be loaded the `base.cfg` file, then the `base-version.cfg` file, finally the `base-version-more.cfg` file, if available.

This way it will replace generic settings with gradually more specific, depending on the use case.

Say `Picat-3.6.8_240527.bat` will try to load `Picat.cfg` first, then `Picat-3.6.8_240527.cfg`.

Hence you can set common settings for all versions in the generic `base.cfg` configuration file.

The `base-version-more.cfg` configuration is for "more" specific use cases, like setting virtual environments and such.

For this though, the `batch`/`bash` filename shall reflect the expected configuration file to load.

Thus `Picat-3.6.8_240527-sat_demo.bat` will also load `Picat-3.6.8_240527-sat_demo.cfg`, if present.

If it is not based on an available `version`, it will use the `latest` tag by default, use this with care though.

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

Relative paths (starting with `.`/`..`) are resolved from the **wm_app** mount point (i.e. `%HomeDrive%\Volumes\wm_app`).

> [!NOTE]
> This allows to set specific environment variables from a common directory (i.e. for dependencies like `JAVA_HOME`).

> [!WARNING]
> There is an *exception* for the `exe` environment variable that is resolved *from* the application's executable folder (i.e. usually `%HomeDrive%\Volumes\wm_app\wm_app_dir_tree__Application\latest`). This allows to specify another executable to run instead of the default one (see `exe` in [Environment variables](#environment-variables) above).

If the path starts with "**wm_app_**" is it assumed being a [wm_app] dependency to be mounted automatically *BEFORE* the application starts. Can be quite long depending on network speed and planets alignment. *Get coffee, touch grass...*

> [!IMPORTANT]
> Dependencies' own configuration files are not loaded from their respective [wm_app] folder, its up to the executed `batch`/`bash` file to set everything right (virtual environment settings, etc) using its own configuration file.

If no version is specified (i.e. just `wm_app_dev_lng_pi__Picat`), the `latest` one will be appended to the `path` environment variable (i.e. `%HomeDrive%\Volumes\wm_app\wm_app_dev_lng_pi__Picat\latest`).

If a specific executable name is specified (i.e. `wm_app_dev_lng_pi__Picat/3.6.8_240527/Picat.exe`) and one is already accessible amongst the `path` environment variable, its path will be removed in order to leave only the specified executable available.

> [!WARNING]
> This way it is possible to supersede an installed or another mounted executable (i.e. an incompatible `java` version) without having to worry about the `path` environment variable's resolution precedence. All applications and dependencies will use the specified executable though. So be careful, even if it is only during the `batch`/`bash` file's session lifetime.

The other variables are initialized with the configuration file's content (i.e. `test` will be set to 2, `console` unset, etc). They can be used by the application and the script through the usual syntax for environment variables (i.e. `%test%` on **Windows**, `$test` on **Linux**).

Hence it is possible to set the `deferred` environment variable this way, as it'll be used only at the application's exit.

> [!CAUTION]
> Still, beware of the values' syntax and format, `batch`/`bash` files' inner evaluation mechanism may come into play and interfere. *Coffee, grass, the usual routine...*

### Command override

Some internal commands are buggy on remote mount points (i.e. `where` in [Windows]) so a similar one has been coded to be able to tweak its internals.

### Command deprecation

Some internal commands are pending deprecation (i.e. `wmic` in [Windows]) so they will be replaced with a proper alternative in the future.

When I say *PROPER* I mean "fast", "efficient", "lightweight", "readable", "maintainable", "long-lasting", not randomly engineered aberrations "fixing" dummy **Kanban** tickets to please clueless bosses. As the proverb goes [“if it ain't broke, don't fix it”](https://www.youtube.com/watch?v=YjYz3EQ5fOo)...
