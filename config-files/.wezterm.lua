local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Gruvbox dark, medium (base16)"

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.font_size = 18

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
