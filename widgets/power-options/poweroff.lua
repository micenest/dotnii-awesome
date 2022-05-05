local wib = require('wibox')
local awf = require('awful')
local grs = require('gears')
local btf = require('beautiful') 
local fnc = require('functions')
local xrc = btf.xresources
local dpi = xrc.apply_dpi
function poweroff(s)
		s.pwoff = wib({
        width = 120,
        height = 120,
        position = 'top',
        ontop = true,
        visible = true,
        border_width = dpi(2),
        border_color = btf.bg_focus,
        bg = btf.bg_normal,
        shape = function(c, w, h) grs.shape.rounded_rect(c, w , h, dpi(3)) end
    })
    s.pwoff.fg = colorswap()
    awf.placement.centered(s.pwoff, {margins={top = dpi(100)}})
    s.pwotx = wib.widget {
      markup = '⏻',
      font = 'Iosevka Nerd Font Mono 48',
      align = 'center',
      widget = wib.widget.textbox
    }
    s.pwodi = wib.widget {
      markup = 'poweroff',
      font = 'Inter Bold 12',
      align = 'center',
      widget = wib.widget.textbox
    }
    s.pwoff:setup {
      layout = wib.layout.align.vertical,
      expand = 'none',
      nil,
      {
        layout = wib.layout.fixed.vertical,
        s.pwotx
      },
      s.pwodi
    }
    s.pwoff:buttons({
        awf.button({  }, 1, function() awf.spawn("poweroff") end)
    })
end
