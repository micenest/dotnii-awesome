--  _____
--//_____\\
--||  |  ||
--||  |  || Beautiful theme.
--||  |  || ...doesn't necessarily means it's Beautiful.
--||  |  || Beautiful is the library name.
--||  |  || but who knows? maybe it is Beautiful.
--||__|__|| :^)
--\\#####//
-- \\###//
--  \\_//

local thmAssets = require("beautiful.theme_assets")
local xrsrc = require("beautiful.xresources")
local xrdb = xrsrc.get_current_theme()
local dpi = xrsrc.apply_dpi
local uvrs = require('config.usercfg')
local grs = require("gears")
local theme = {}

theme.font          = "Inter Medium 10" or "Sans 10"
theme.alt_font		= "Inter Bold 11" or "Sans 10"
theme.bg_normal     = "#180c0c"
theme.bg_focus      = "#ff6e78"
theme.bg_urgent     = "#ff99a2"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = theme.bg_focus
theme.fg_focus      = theme.bg_normal
theme.fg_urgent     = theme.bg_normal
theme.fg_minimize   = theme.bg_focus

theme.useless_gap   = 4
theme.gap_single_client  = true
theme.border_width  = dpi(2)
theme.border_normal = theme.bg_minimize
theme.border_focus  = theme.bg_focus or "#ffffff"
theme.border_marked = theme.bg_minimize

local taglist_square_size = dpi(0)
theme.taglist_squares_sel = thmAssets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = thmAssets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

theme.notification_font = theme.font
theme.notification_bg = theme.bg_normal
theme.notification_fg = theme.fg_normal
theme.notification_max_width = dpi(450)
theme.notification_max_height = dpi(75)
theme.notification_icon_size = dpi(42)
theme.notification_shape = function(c, w, h) grs.shape.rounded_rect(c, w, h, dpi(5)) end

theme.menu_submenu_icon = uvrs.iconDir .. "reenii.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)
theme.menu_border_color = theme.border_normal
theme.menu_border_width = theme.border_width

theme.taglist_disable_icon = true 

theme.wallpaper = uvrs.picsDir .. "wp/light experiment.png"

-- TODO: work on the layout icons!
-- there's so many layouts to do...
-- but they're gonna be fun for sure!

-- Define the icon theme.for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "Papirus-Dark"

return theme
