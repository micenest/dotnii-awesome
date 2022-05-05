--  _______
--//   ||  \\
--||   ||__|| tik tok (not the app).
--||       || time goes by.
--\\_______//
--
local awf = require('awful')
local grs = require('gears')
local wib = require('wibox')
local btf = require('beautiful')
local xrc = require('beautiful.xresources')
local xdb = xrc.get_current_theme()
local dpi = xrc.apply_dpi

function clock(s)
  s.bar1 = wib ({
    width = 120,
    height = dpi(30),
    position = 'top',
    ontop = false,
    border_width = dpi(0),
    border_color = btf.bg_focus,
    visible = true,
    bg = btf.bg_normal,
    border_color = btf.bg_focus,
    border_width = dpi(2),
    shape = function(c, w, h) grs.shape.rounded_rect(c, w , h, dpi(5)) end
  })
  s.bar1:struts ({
    top = dpi(80)
  })
  awf.placement.top_left(s.bar1, {margins = { top = dpi(25), left = dpi(8) }})
  s.clock = wib.widget.textclock('<span font="Inter Bold 16" color="#FFE678">%H:%M:%S</span>', 1)
  s.bar1:setup {
    layout = wib.layout.align.horizontal,
    expand = "none",
    nil,
    {
      layout = wib.layout.fixed.horizontal,
      s.clock
    },
    nil
  }
end
