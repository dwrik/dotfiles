local wezterm = require 'wezterm'
local action = wezterm.action
local config = {}

-- colorscheme
config.color_scheme = 'NvimDark'

-- font
config.font_size = 15
config.line_height = 1.1
config.font = wezterm.font('JetBrains Mono', { weight = 'DemiBold' })
config.adjust_window_size_when_changing_font_size = true

-- tab bar
config.enable_tab_bar = false

-- window
config.window_decorations = 'RESIZE'
config.window_padding = {
    left   = 26,
    right  = 14,
    top    = 24,
    bottom = 0,
}

-- keybinds
config.keys = {
    { key = 'k',     mods = 'CMD',       action = action.ScrollByLine(-3), }, -- scroll up
    { key = 'j',     mods = 'CMD',       action = action.ScrollByLine(3),  }, -- scroll down
    { key = 'Space', mods = 'CMD|SHIFT', action = action.ActivateCopyMode  }, -- vi bindings mode
    { key = 'o',     mods = 'CMD|SHIFT', action = action.QuickSelect       }, -- quick select mode
}

return config
