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

With minimal installation, can run a selection of online application everywhere, remotely. Slowly.

* Home

https://github.com/wenuam/wm_app

[wm_app]: https://github.com/wenuam/wm_app

## Usage

1. Install the latest version of [WinFsp] (you *MUST* have `admin`/`root` rights though)
1. Clone or download/extract this repository to have access to its whole structure
1. Explore the folder tree and run a `batch`/`bash` file to execute the corresponding cloud application
1. Wait a bit until the application starts (executed from `%HomeDrive%\Volumes\wm_app`)

Usually it is the AMD64 (aka x86_64, aka x64) binaries that are presented, unless no other option available.

Whenever possible, the Linux binaries are available alongside the Windows binaires, sharing common data files.

[WinFsp]: https://github.com/winfsp/winfsp/releases/latest

## Applications

List of currently available cloud applications :

| Application			| Version and date	| Type and path		|
| :---					| :---				| :---				|
| [Bob]					| 1.7.6_240311		| doc/wiki/tiddly	|
| [Dia]					| 0.97.2_120119		| img/2d/ed			|
| [ditaa]				| 0.11.0_180114		| img/2d/gen		|
| [FreePascal]			| 3.2.2_210519		| dev/lng/pas		|
| [Ghostscript]			| 10.06.0_250909	| doc/pdf/cnv		|
| [Git]					| 2.52.0_251117		| dev/scm/git		|
| [Graphviz]			| 14.0.5_251129		| img/2d/gen		|
| [ImageMagick]			| 7.1.2-8_251026	| img/2d/gen		|
| [Inkscape]			| 1.4.2_250513		| img/2d/ed			|
| [jdk]					| 25.0.1_250925		| dev/lng/jar		|
| [Lua]					| 5.4.8_250605		| dev/lng/lua		|
| [Miktex]				| 24.1_240128		| doc/latex/gen		|
| [mscgen]				| 8.6.3_250908		| img/2d/gen		|
| [my_basic]			| 1.2.2_250429		| dev/lng/bas		|
| [node]				| 25.2.1_251117		| dev/lng/js		|
| [Pandoc]				| 3.8.3_251201		| doc/cnv			|
| [PellesC]				| 13.00_250521		| dev/lng/c			|
| [pfm]					| 24X_241121		| sys/win/fs		|
| [Picat]				| 3.9.0_250823		| dev/lng/pi		|
| [PlantUML]			| 1.2025.10_251104	| img/2d/gen		|
| [PostgreSQL]			| 18.1.1_251112		| db/sql			|
| [QEMU]				| 10.1.0_250826		| sys/emu			|
| [Racket]				| 9.0.0_251121		| dev/lng/rkt		|
| [StrawberryPerl]		| 5.42.0.1_250801	| dev/lng/pl		|
| [SysinternalsSuite]	| 251120			| sys/win			|
| [Tabula]				| 1.2.1_180604		| doc/pdf/utl		|
| [Tesseract]			| 5.5.0_241111		| img/ocr			|
| [vlang]				| 0.4.12_250919		| dev/lng/v			|
| [WinLibs]				| 15.2.0r4_251202	| dev/lng/cpp		|
| [yEd]					| 3.25.1_250219		| img/2d/ed			|

[Bob]: https://github.com/wenuam/wm_app_doc_wiki_tiddly__Bob
[Dia]: https://github.com/wenuam/wm_app_img_2d_ed__Dia
[ditaa]: https://github.com/wenuam/wm_app_img_2d_gen__ditaa
[FreePascal]: https://github.com/wenuam/wm_app_dev_lng_pas__FreePascal
[Ghostscript]: https://github.com/wenuam/wm_app_doc_pdf_cnv__Ghostscript
[Git]: https://github.com/wenuam/wm_app_dev_scm_git__Git
[Graphviz]: https://github.com/wenuam/wm_app_img_2d_gen__Graphviz
[ImageMagick]: https://github.com/wenuam/wm_app_img_2d_gen__ImageMagick
[Inkscape]: https://github.com/wenuam/wm_app_img_2d_ed__Inkscape
[jdk]: https://github.com/wenuam/wm_app_dev_lng_jar__jdk
[Lua]: https://github.com/wenuam/wm_app_dev_lng_lua__Lua
[Miktex]: https://github.com/wenuam/wm_app_doc_tex_gen__Miktex
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

### Folders

Directory tree of a mounted **application** is as follow:

* :file_folder: `%HomeDrive%\Volumes`: all users
	* :file_folder: **wm_app**
		* :file_folder: **application**: actual mount point
			* :file_folder: `version` or `tag`
				* :hammer_and_wrench: The **application** files...
* :file_folder: `%AppData%`: user files (Roaming)
	* :file_folder: **wm_app**
		* :file_folder: **repository** (complete name starting with "wm_app")
			* :file_folder: **log**
				* :file_folder: **%year%-%month%**
					* :page_with_curl: The `wm_app_*-[version|tag]-%date%_%time%.[stdout|stderr|hubfs].log` files...

### Script

Each `batch`/`bash` file is a cloud application startup script.

It will mount a repository based on its path and filename (with optional version).

Say `wm_app/dev/lng/pi/Picat-3.6.8_240527.bat` will mount `wm_app_dev_lng_pi__Picat` into `%HomeDrive%\Volumes\wm_app\Picat` and run `%HomeDrive%\Volumes\wm_app\Picat\3.6.8_240527\Picat.exe`.

If no version is specified, say `wm_app/dev/lng/pi/Picat.bat`,  by default the `latest` tag will be used and run `%HomeDrive%\Volumes\wm_app\Picat\latest\Picat.exe`.

Beware, some system commands (ie. `where` in [Windows]) can execute *VERY* slowly (about 30 s) on mounted remote repositories. This may only happens during the startup phase so be patient. Get a coffee, touch some grass...

[Windows]: https://www.microsoft.com/windows

### Environment variables

- `console`: is set to 0, the `batch`/`bash` file will wait for user input at exit.

> [!NOTE]
> The toggle is set at the beginning of the `batch`/`bash` file when ran from the graphic interface, so the console/terminal doesn't closes automatically at the application's exit. You may change its value with the configuration file (see below).

- `cli`: compose the command line to run with the name of other environment variables (may also use those defined in the configuration file, see below).

> [!NOTE]
> The application is typically run this way: `application %1 %2 %3 %4 %5 %6 %7 cli` (with `%1 - %7` being the parameters passed to the `batch`/`bash` file).

- `debug`: if set (regardless of its content, unused), the script will output debug strings during the startup and clean-up phases.

- `deferred`: if set, optional [wm_app] dependencies will be unmounted after specified *SECONDS*.

It can be useful to leave a dependency used by another [wm_app] mounted for a little while, long enough to start the other application, hence not having to remount it just after having unmounted it.

When the other application is launched with its `batch`/`bash` file, the deferred unmount is cancelled, for the time being.

When no more application is using a dependency, and no deferred unmount is pending, it is effectively unmounted.

- `detached`: if set (regardless of its content, unused), the application will run in a separate process (unstable).

- `exe`: if set, the `batch`/`bash` file will run the requested executable instead of the one based on the name of the repository.

> [!TIP]
> This is quite useful when the executable is not located at the root of the repository (.ie in the `./bin` folder instead). You may change its value with the configuration file (see below).

- `log`: if set to `stdout` and/or `stderr`, will redirect corresponding output to log files (see [Folders](#folders) above).

> [!NOTE]
> By default the application's output are not logged (ie. console wouldn't be able to interact with the user).

### Configuration file

* A configuration file can be located alongside the `batch`/`bash` file.

Its filename shall reflect the `batch`/`bash` filename, including the version number, or "more", separated with dashes.

First will be loaded the `base.cfg` file, then the `base-version.cfg` file, finally the `base-version-more.cfg` file, if available.

This way it will replace generic settings with gradually more specific, depending on the use case.

Say `Picat-3.6.8_240527.bat` will try to load `Picat.cfg` first, then `Picat-3.6.8_240527.cfg`.

Hence you can set common settings for all versions in the generic `base.cfg` configuration file.

The `base-version-more.cfg` configuration is for "more" specific use cases, like setting virtual environnements and such.

For this though, the `batch`/`bash` filename shall reflect the expected configuration file to load.

Thus `Picat-3.6.8_240527-sat_demo.bat` will also load `Picat-3.6.8_240527-sat_demo.cfg`, if present.

If it is not based on an available `version`, it will use the `latest` tag by default, use this with care though.

That's to say `Picat-sat_demo.bat` will mount `wm_app_dev_lng_pi__Picat/latest`, yet load `Picat-sat_demo.cfg`, not `Picat-latest-sat_demo.cfg`.

* As for the configuration file's content, the format is pretty straightforward:

```text
./bin
path=../test
wm_app_dev_lng_pi__Picat
wm_app_dev_lng_pi__Picat/3.6.8_240527
wm_app_dev_lng_pi__Picat/3.6.8_240527/Picat.exe
exe=bin/Picat.exe
test=2
console=
deferred=30
```

If a line doesn't set a variable, it is assumed to set the `path` variable by default.

If a `path` variable is set, it will be appended to the `path` environnement variable (at the end).

Relative paths (starting with `.`/`..`) are resolved from the common mount point (ie. `%HomeDrive%\Volumes\wm_app`).

> [!NOTE]
> This allows to set specific environment variables based on its repository mount point (ie. `JAVA_HOME`).

If the path starts with "wm_app" is it assumed being a [wm_app] dependency to be mounted automatically *BEFORE* the application starts. Can be quite long depending on network speed and planets alignment. Get coffee, touch grass...

> [!IMPORTANT]
> Dependencies' configuration files are not loaded from their respective [wm_app] folder, its up to the executed `batch`/`bash` file to set everything right using its own configuration file.

If no version is specified (ie. just `wm_app_dev_lng_pi__Picat`), the `latest` one will be appended to the `path` environnement variable (ie. `%HomeDrive%\Volumes\wm_app\Picat\latest`).

If a specific executable name is specified (ie. `.../Picat.exe`) and one is already accessible amongst the `path` environnement variable, its path will be removed in order to leave only the specified executable available.

> [!WARNING]
> This way it is possible to supersede an installed or another mounted executable (ie. an incompatible `java` version) without having to worry about the `path` environnement variable's resolution precedence. All applications and dependencies will use the specified executable though. So be careful, even if it is only during the `batch`/`bash` file's session lifetime.

Variables are initialized with the configuration file's content (ie. `test` will be set to 2, `console` unset, etc).

Hence it is possible to set the `deferred` environnement variable this way, as it'll be used only at the application's exit.

> [!CAUTION]
> Still, beware of the values' syntax and format, `batch`/`bash` files' inner evaluation mechanism may come into play and interfere. Coffee, grass, the usual routine...

### Command override

Some internal commands are buggy on remote mount points (.ie `where` in [Windows]) so a similar one has been coded to be able to tweak its internals.

### Command deprecation

Some internal commands are pending deprecation (.ie `wmic` in [Windows]) so they will be replaced with a proper alternative in the future.

When I say *PROPER* I mean "fast", "efficient", "lightweight", "readable", "maintainable", "long-lasting", not randomly engineered aberrations "fixing" dummy Kanban tickets to please clueless bosses. As the proverb goes [“if it ain't broke, don't fix it”](https://www.youtube.com/watch?v=YjYz3EQ5fOo)...
