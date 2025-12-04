# wm_app_doc_wiki_tiddly__Bob

[TiddlyWiki5] server (portable) with many plugins included

* Home

https://github.com/wenuam/wm_app/tree/main/doc/wiki/tiddly

## TiddlyWiki

[TiddlyWiki5] is a [WikiText] [markdown] oriented non-linear [Wiki] server, with a catch : it is written in [JavaScript] and is self-embedded into one big (around 3+ MB) [HTML] file, hence allows to carry around the server and its data in one portable file.

The

To get the base [HTML] file, simply follow this link and click on the green "Download" button :

* https://tiddlywiki.com/#GettingStarted

You now have an up-to-date [TiddlyWiki5] locally, just open the [HTML] file to convince yourself.

To save your personal copy of [TiddlyWiki5], simply overwrite the [HTML] file or save into a new file.

Some browsers' extension even provide you with an autosave feature so it become almost transparent for the user and it's like editing a distant [Wiki] even though everything is stored locally :

* https://addons.mozilla.org/en-US/firefox/addon/timimi/ (Firefox 90+, needs to install binary host interface, see GitHub page)

[TiddlyWiki5]: https://tiddlywiki.com/
[WikiText]: https://tiddlywiki.com/static/WikiText.html
[markdown]: https://en.wikipedia.org/wiki/Markdown
[Wiki]: https://en.wikipedia.org/wiki/Wiki
[JavaScript]: https://developer.mozilla.org/en-US/docs/Web/JavaScript
[HTML]: https://developer.mozilla.org/en-US/docs/Web/HTML

### Version

There are two main branches of **TiddlyWiki** : [Classic] and [5]

Version [5] is a complete rewrite of the [Classic] version that continued to evolve separately. Both aren't compatible.

This repository focuses on version [5] and onward.

The project page for the [Classic] version is here :

* https://github.com/TiddlyWiki/TiddlyWikiClassic

[Classic]: https://tiddlywiki.com/static/TiddlyWikiClassic.html
[5]: https://github.com/Jermolene/TiddlyWiki5

### WikiText

The [WikiText] syntax is a bit complex and not as friendly like [GitHub markdown], yet it is syntax originated and used by [WikiPedia].

[GitHub markdown]: https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/quickstart-for-writing-on-github
[WikiPedia]: https://en.wikipedia.org/wiki/Help:Wikitext

### Tutorial

[TiddlyWiki5] pages/notes are called [Tiddlers] (go figure) and can contain [WikiText], code (plugins) or both. There are visible [Tiddlers] and hidden/system ones (server code, plugins, configuration data, etc). In general only the visible [Tiddlers] are available through the interface, the hidden/system ones can be only edited/deleted through setting/configuration pages.

[Tiddlers]: https://tiddlywiki.com/static/Tiddlers.html

There are many tutorials to learn how to use [TiddlyWiki5] :

* https://tiddlywiki.com/#Introduction%20Video
* https://www.youtube.com/playlist?list=PLzZCajspPU_UjFn0uy-J9URz0LP4zhxRK

The layout and theme may be modified, many things are configurable through the "gear" :gear: icon. Explore the tabs and settings pages to make yourself familiar with a typical [TiddlyWiki5] system.

### Plugins

The server can be extended with plugins ([officials] and [community] created, or [other]). Of course the size of the [HTML] file grows with each addition, data or plugin, making it a bit less "portable" (ie. through emails if not compressed).

Some plugins also have their own tutorials :

* https://www.youtube.com/playlist?list=PL1Jnk3P6K3KO4EEIlFpzqIWgJOcyN7i61 : TiddlyMap

[officials]: https://tiddlywiki.com/static/OfficialPlugins.html
[community]: https://tiddlywiki.com/static/Community%2520Plugins.html
[other]: https://tiddlywiki.com/static/Other%2520Resources.html

#### Installation

To install a plugin, in general you just have to *Drag'n Drop* the plugin "box" from one offline or online [TiddlyWiki5] containing it to your one to have the plugin copied into it. Other installation method requires messing with hidden/system [Tiddlers] (don't bother, it can go pretty technical).

The plugin "box" is composed of :

* Plugin name: plugin description
* $:/plugins/path
* ve.rs.ion

#### Installed

Here's a quick list of installed plugins that provide many features on-top of the many already provided by [TiddlyWiki5] :

* TiddlyWiki (5.3.3) : A non-linear personal web notebook
* Core (5.3.1) : TiddlyWiki5 core
* Bob (1.7.5) : A plugin that real-time syncing between wiki and server, among other things

* CodeMirror (5.3.3) : CodeMirror editor
* CodeMirror Enhanced (0.1.4) : Your must-have CodeMirror enhancement plugin!
* CodeMirror Themes (0.0.1) : Tons of codemirror themes for TiddlyWiki
* context-menu-plugin (0.8.1) : Configurable context menus for tiddlers
* ContextPlugin (2.1.0) : Context search - provides visual highlight of search results
* Core (5.3.3) : TiddlyWiki5 core
* edit-comptext (0.9.3) : Editor with some on-line completion capabilities
* FontAwesome (1.2.22) : FontAwesome embedded font support for TW5
* Highlight (5.3.3) : Highlight.js syntax highlighting
* hotzone (0.0.3) : HotZone – Be notified when tiddlers are scrolled into view
* KaTeX (5.3.3) : KaTeX library for mathematical typography
* Markdown (5.3.1) : Markdown parser based on markdown-it
* MarkdownMore (0.1.0) : Extends the official Markdown plugin
* Mermaid (0.3.7.1) : wrapper for the Mermaid diagramming library
* Mobile support for the Notebook theme (1.0.0) : JavaScript hooks for mobile devices support of the Notebook theme
* Muuri-Kanban (0.1.14) : A Kanban based on Muuri
* Prism (0.1.0) : Syntax highlight with PrismJS
* Projectify (0.14.0) : Simple project management for TiddlyWiki
* Relink (2.3.5) : Flexibility when relinking renamed tiddlers
* Section Editor (1.2.0) : Sectionize tiddler, create patchworks, and manage sections
* Shiraz (2.9.0) : Extended markups, styles, images, tables, and macros
* Shiraz Callout (0.8.0) : Admonitions for Shiraz
* Shiraz Formatter (0.6.0) : Editor buttons and snippets for Shiraz
* Sidebar Resizer (0.0.6) : Use the cursor to resize the width of the sidebar.
* SocialCalc (1.0.0) : Do *NOT* enable it, conflicting with another plugin
* Solution (1.3.0) : Create resource wiki using question and answer templates and tools
* Tamasha (0.6.0) : presentation and slideshow
* Tamasha Themes and Animations (0.1.0) : fonts, colors, and visual effects
* Task Manager for TiddlyTables (0.1.9)
* Three.js (1.0.0) : 3D JavaScript engine
* Three.js extras (1.0.0)
* Tiddler Commander (2.1.7) : Tiddler Commander
* tiddlymap (0.17.16+10020) : TiddlyMap – Map drawing and topic visualization for your wiki
* TiddlyTables (0.6.21)
* Timelines (1.4.0) : Graphical representation of a period of time
* Toc (1.6.0) : Table of contents and navigation builder
* Todolist (1.5.0) : Organize, prioritize, and plan your work
* topstoryview (0.2.0) : TopStoryView – Always scroll navigated tiddlers to the top
* Trashbin (1.3.0) : A trashbin tool for Tiddlywiki
* tw5-markdown (1.1.4) : Markdown
* TWederBob (0.2.0) : A plugin to add federation via Bob servers
* Utility (2.7.0) : Small tools for authors and developers
* vis (0.0.0) : Visjs – TiddlyWiki5 plugin for the vis.js library
* vis-network (9.1.3) : TiddlyWiki5 plugin for the vis-network library

Some plugins required manual installation/tweaking to get the latest update.

#### Collections

Many other plugins can be found at various **CPL**, aka "Central Plugin Library" :

* https://tiddly-gittly.github.io/TiddlyWiki-CPL/ : Chinese
* https://sycom.github.io/TiddlyWiki-Plugins/
* https://benwebber.github.io/tiddlywiki-plugins/
* https://tiddlywiki.abego-software.de/
* https://plugins.tiddlyhost.com/
* http://inmysocks.tiddlyspot.com/
* http://bjtools.tiddlyspot.com/
* https://twve.tiddlyspot.com/
* https://tiddlytools.com/

#### Development

You may want to create/modify plugins, this [Tiddlers] provides you with technical details :

* https://tiddlywiki.com/dev/

## Bob

[Bob] is a self-contained [Node.js] server into one (45+ MB) portable [Windows] application that can handle multiple users as well. Instead to save everything into one bigger and bigger [HTML] file, the [Tiddlers] are saved into an `IndexWiki/` subfolder, plugins into `Plugins/`, and so on.

While you loose the "portability" of one big [HTML] file, you gain the ability to serve your [Tiddlers] to multiple users, either locally or online (using the right IP/firewall settings). You can also access the [Tiddlers] files (visible, but also hidden/system ones) individually and even perform some operation on them if needed (ie. convert them to `LaTeX`).

[Bob]: https://github.com/OokTech/TW5-Bob
[Node.js]: https://nodejs.org/en
[Windows]: https://www.microsoft.com/en-us/windows

### Version

[Bob] is providing a specific [TiddlyWiki5] version that cannot be updated without changing the server binary. It's a drawback because it can lag a few versions behind. New server binaries can be found here :

* https://github.com/OokTech/TW5-BobEXE/releases (beware of the date and version number)

### Running

Since [Bob] is a local server, you may edit the `./IndexWiki/settings/settings.json` file from the mount point to change the settings to suit your needs :

* `ws-server/port` : default is **9080**
* `ws-server/host` : default is **0.0.0.0** aka **localhost**

Then launch `Bob.bat` from the [wm_app] repository (**NOT** `Bob.exe` from the mount point) for the [Node.js] server to be run and your default browser be opened on the right IP address.

You **may** have to allow your firewall to provide access to the port/traffic. If your browser timed out, reload the page once you granted [Bob] firewall access.

[wm_app]: https://github.com/wenuam/wm_app

### Saving

Unlike a the one big [HTML] file that needs a browser extension to save datas/plugins on itself without manual interaction, [Bob] handle the saving on the host filesystem automatically, hence the user don't have to worry about this. As soon as a [Tiddlers] is modified or a plugin added, it is immediately saved on the host.

Regular archiving of the [TiddlyWiki5] files can then be done either by save the whole [Bob] folder (simple and secure) or just the subfolders (`IndexWiki/` and `Plugins/` most notably). A [Git] repository can also serve as a mean to have [Tiddlers] versioning. Hence the user can fork this repository with a new/dedicated name for this very purpose.

[Git]: https://git-scm.com/

### Stopping

Just press a key or close the [Bob] window, the server is killed, the current opened [TiddlyWiki5] page will warn about the connection loss. Just restart [Bob] to regain connection. Beware of any data loss though.
