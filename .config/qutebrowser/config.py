config.load_autoconfig(False)

def padding(top, left, right, bottom):
    return {
        "top": top,
        "left": left,
        "right": right,
        "bottom": bottom
    }
c.content.javascript.clipboard = "access-paste"

c.completion.shrink = True
c.completion.scrollbar.padding = 0
c.completion.scrollbar.width = 6

c.tabs.position = "left"
c.tabs.show = "multiple"
c.tabs.last_close = "close"
c.tabs.width = 40
c.tabs.padding = {'top': 6, 'right': 8, 'bottom': 6, 'left': 8}

c.statusbar.show = "never"
c.statusbar.padding = {'top': 6, 'right': 8, 'bottom': 6, 'left': 8}

c.editor.command = ['st', '-c', 'neovim', '-e', 'nvim', '{}']
c.messages.timeout = 3000

c.fonts.default_family = 'IosevkaTermSlab Nerd Font'
c.fonts.prompts = '14pt IosevkaTermSlab Nerd Font'
c.fonts.default_size = '14pt'

config.source('qutewall.py')

config.bind(';m', 'hint links spawn mpv {hint-url}')
config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xf', 'config-cycle tabs.show always nevertabs.show always never')
config.bind('xd', 'config-cycle colors.webpage.darkmode.enabled true false')


player_div = 'document.querySelector("#movie_player")'

config.bind('(', f'jseval -q {player_div}.focus()')
config.bind(')', f'jseval -q {player_div}.blur()')

config.bind('ch', 'history-clear')


c.qt.args = ['disable-reading-from-canvas',
             'ppapi-widevine-path=/usr/lib/qt6/plugins/ppapi/libwidevinecdm.so']


c.content.blocking.adblock.lists = [
		"https://easylist.to/easylist/easylist.txt",
		"https://easylist.to/easylist/easyprivacy.txt",
		"https://easylist.to/easylist/fanboy-social.txt",
		"https://secure.fanboy.co.nz/fanboy-annoyance.txt",
		"https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt",
		#"https://gitlab.com/curben/urlhaus-filter/-/raw/master/urlhaus-filter.txt",
		"https://pgl.yoyo.org/adservers/serverlist.php?showintro=0;hostformat=hosts",
		"https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
		"https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
		"https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
		"https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
		"https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
		"https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
		"https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
		"https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
		"https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
		"https://www.i-dont-care-about-cookies.eu/abp/",
		"https://secure.fanboy.co.nz/fanboy-cookiemonster.txt",
		"https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"
]


# c.url.searchengines = {
#         "DEFAULT": "https://duckduckgo.com/?q={}",
#         "yt": "https://youtube.com/results?search_query={}",
#         "gh": "https://github.com/search?o=desc&q={}&s=stars",
# }


c.aliases = {
    "w": "session-save",
    "wq": "quit --save",
    "mpv": "spawn -d mpv --profile=H60 {url}",
}


c.content.blocking.enabled = True
c.content.blocking.method = "both"

c.content.autoplay = False

c.scrolling.smooth = False
c.qt.highdpi = False

c.content.notifications.enabled = 'ask'             # value: true, false, ask
c.content.notifications.presenter = 'libnotify'     # value: auto, qt, libnotify, systray, messages, herbe(experimental)
c.content.notifications.show_origin = True
c.downloads.remove_finished = 3000

config.bind('<Ctrl+h>', 'fake-key <left>', 'insert')
config.bind('<Ctrl+j>', 'fake-key <down>', 'insert')
config.bind('<Ctrl+k>', 'fake-key <up>', 'insert')
config.bind('<Ctrl+l>', 'fake-key <right>', 'insert')
config.bind('<Enter>', 'fake-key -g <enter>;; later 0.3s mode-leave', 'insert')

# Vim-style movement keys in command mode
config.bind('<Ctrl-j>', 'completion-item-focus --history next', mode='command')
config.bind('<Ctrl-k>', 'completion-item-focus --history prev', mode='command')

config.bind('<Alt-j>', 'completion-item-focus --history next', mode='command')
config.bind('<Alt-k>', 'completion-item-focus --history prev', mode='command')



config.bind('cm', 'clear-messages', mode='normal')
config.bind('xr', 'config-source', mode='normal')

c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.policy.images = "never"
c.downloads.open_dispatcher = "xdg-open '{}'"
c.qt.force_platformtheme='gtk3'

c.content.user_stylesheets = ["~/.config/qutebrowser/user.css"]
