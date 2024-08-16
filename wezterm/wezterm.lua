local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Eighties (base16)'
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = false
config.font_size = 14.0
config.native_macos_fullscreen_mode = true
config.window_decorations = "RESIZE"

-- No Padding
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
