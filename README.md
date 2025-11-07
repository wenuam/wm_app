# wm_app

- [Usage](#usage)
- [Folders](#folders)
- [Applications](#applications)

<!-- ![wm_app image](./wm_app.png "wm_app image") -->
<img src="./wm_app.png" alt="wm_app image" width="225" />

Cloud Application Repository

With minimal installation, can run a selection of online application everywhere.

## Usage
<!--a name="usage"/-->

1. Install the latest version of [WinFsp] (you must have `admin`/`root` rights)
1. Explore the folder tree and run the `batch`/`bash` file to execute the cloud application
1. Wait a bit until the application is cached locally (executed from `%HomeDrive%\Volumes\wm_app`)

[WinFsp]: https://github.com/winfsp/winfsp/releases/latest

## Folders
<!--a name="folders"/-->

Directory tree of a mounted **application** is as follow:

* `%HomeDrive%\Volumes`: all users
	* **wm_app**
		* **application**: actual mount point
			* `version` or `tag`
				* The files...
* `%AppData%`: user files (Roaming)
	* **wm_app**
		* **application**
			* The `application-[version|tag]-date_time.[stdout|stderr|hubfs].log` files...

## Applications
<!--a name="applications"/-->

List of currently available applications :

| Application         | Version and date | Type and path |
| :---                | :---             | :---          |
| [jdk]               | 25.0.1_250925    | dev/lng/jar   |
| [Pgsql]             | 18.0.2_251008    | db/sql        |
| [Picat]             | 3.9.0_250823     | dev/lng/pi    |
| [SysinternalsSuite] | 251013           | sys/win       |
| [yEd]               | 3.25.1_250219    | img/2d/ed     |

[jdk]: https://github.com/wenuam/wm_app_dev_lng_jar__jdk
[Pgsql]: https://github.com/wenuam/wm_app_db_sql__Pgsql
[Picat]: https://github.com/wenuam/wm_app_dev_lng_pi__Picat
[SysinternalsSuite]: https://github.com/wenuam/wm_app_sys_win__SysinternalsSuite
[yEd]: https://github.com/wenuam/wm_app_img_2d_ed__yEd
