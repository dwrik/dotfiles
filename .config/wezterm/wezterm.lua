local wezterm = require 'wezterm'
local config = {}

-- fonts
config.font_size = 13
config.adjust_window_size_when_changing_font_size = true

-- tab bar
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- window
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 60
config.window_padding = {
  left = 26,
  right = 20,
  top = 22,
  bottom = 0,
}

-- size
config.initial_cols = 140
config.initial_rows = 40

-- color scheme (auto switch dark/light mode)
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end
function color_scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'BlulocoDark'
  else
    return 'BlulocoLight'
  end
end
config.color_scheme = color_scheme_for_appearance(get_appearance())

return config

