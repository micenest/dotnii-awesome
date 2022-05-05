--  _________________________
-- /                         \
-- | [1] | 2 | 3 | 4 | 5 | 6 |
-- \_________________________/
local awf = require('awful')
local btf = require('beautiful')
local wib = require('wibox')
local grs = require('gears')
local fnt = require('functions')
local xrc = require('beautiful.xresources')
local dpi = xrc.apply_dpi

function tags(s)
  s.prmpt = awf.widget.prompt()
  s.bar4 = wib({
      width = 280,
      height = 30,
      position = 'top',
      ontop = false,
      visible = true,
      bg = btf.bg_normal,
      border_color = btf.bg_focus,
      border_width = dpi(2),
      shape = function(c, w, h) grs.shape.rounded_rect(c, w , h, dpi(5)) end
  })
  awf.placement.top_right(s.bar4, {margins = { top = dpi(23), right = dpi(7) }})
  s.taglist = awf.widget.taglist {
    screen = s,
    filter = awf.widget.taglist.filter.all,
    style = {
      spacing = 5,
      font = btf.font,
      fg_occupied = "#EEE",
      fg_empty = "#EEE",
      bg_focus = btf.bg_focus,
      shape = function(c, w, h) grs.shape.rounded_rect(c, w , h, dpi(25)) end,
    },
		widget_template = {
				{
						{
								{id = 'text_role', widget = wib.widget.textbox},
								layout = wib.layout.fixed.horizontal
            },
            left = 5,
            right = 5,
            widget = wib.container.margin
				},
				id = 'background_role',
				widget = wib.container.background
		}
  }
  s.margin = wib.widget({
      top = 2,
      bottom = 2,
      left = 2,
      s.taglist,
      widget = wib.container.margin
  })
  s.bar4:setup {
    layout = wib.layout.align.horizontal,
    expand = "none",
    {
				layout = wib.layout.fixed.horizontal,
				s.margin,
    },
    nil
  }
end
