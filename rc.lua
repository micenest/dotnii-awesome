-- section 1                     ||
-- default configs and libraries ||
-- ______________________________//

-- we load only the user configs because they are by default the standard configs, which can be afterwards changed by your likings.
local uvrs = require('config.usercfg')
-- default awesome libraries
local nty = require('naughty')
local btf = require('beautiful')
local spw = require('awful.spawn')
-- helpful functions
local fct = require('functions')

-- section 2 ||
-- signals   ||
-- __________//

btf.init(uvrs.themeDir .. "theme.lua")
nty.connect_signal("request::display_error", startup_error)
client.connect_signal("manage", sig_manage)
spw('picom')
-- section 3     ||
-- load the rest ||
-- ______________//

local layout = require('layout')
local keys = require('keys')
local widgets = require('widgets')
