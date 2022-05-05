local awf = require('awful')
-- here, you load your menubar modules!
-- keep in mind that if you want to add/remove a bar,
-- you have to also remove/add the bar's global function inside the bars
-- function below.
local clb = require('widgets.menubar.clock')
local tgl = require('widgets.menubar.taglist')
function barstop(s)
  clock(s)
  tags(s)
end
awf.screen.connect_for_each_screen(barstop)
