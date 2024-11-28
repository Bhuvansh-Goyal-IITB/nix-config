local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Gruvbox dark, medium (base16)"

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 16

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.keys = {
	{
		key = "j",
		mods = "CTRL",
		action = wezterm.action.SendKey({ key = "j", mods = "CTRL" }),
	},
}

return config
