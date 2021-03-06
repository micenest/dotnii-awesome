--
--      ______
--     /      \
--    /        \
--  __| __  __ |__
-- /  \/  \/  \/  \ helpful functions!
-- \__/\__/\__/\__/ all the good stuff from beautiful
--    |  ^  ^  |    amongst some extra stuff is located here.
--    \________/
--       |  |
--      /    \
--     |      |
local btf = require('beautiful')
local grs = require('gears')

function set_wallpaper(s)
  if btf.wallpaper then
    if type(btf.wallpaper) == "function" then
      wp = btf.wallpaper(s)
    end
    grs.wallpaper.maximized(btf.wallpaper, s, true)
  end
end

function startup_error(m, s)
  local nty = require('naughty')
  nty.notify {
		 urgency = "critical",
		 title   = "oh hey, an error happened"..(s and " during startup. you might want to have a look." or ". you might want to have a look."),
     bg = btf.bg_focus,
     fg = btf.bg_normal,
     font = "Lustra Text Bold 10",
		 message = m
  }
end

function sig_manage(c)
    client.focus = c
    c:raise()
end

function colorswap()
  local xrc = require('beautiful.xresources')
  local xdb = xrc.get_current_theme()
  if not cs then
    cs = xdb.color3
	else
		cs = xdb['color' .. math.random(1, 6)]
  end
  return cs
end
