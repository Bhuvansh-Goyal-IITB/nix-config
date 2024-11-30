local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_schemes = {
	["Gruvbox Material Dark"] = {
		foreground = "#D4BE98",
		background = "#282828",
		cursor_bg = "#D4BE98",
		cursor_fg = "#282828",
		cursor_border = "#D4BE98",
		selection_fg = "#282828",
		selection_bg = "#D4BE98",
		scrollbar_thumb = "#665c54",
		split = "#665c54",
		ansi = {
			"#3C3836",
			"#EA6962",
			"#A9B665",
			"#E78A4E",
			"#7DAEA3",
			"#D3869B",
			"#89B482",
			"#D4BE98",
		},
		brights = {
			"#665C54",
			"#EA6962",
			"#A9B665",
			"#E3A84E",
			"#7DAEA3",
			"#D3869B",
			"#89B482",
			"#DFBF8E",
		},
	},
}
config.color_scheme = "Gruvbox Material Dark"

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

-- config.font = wezterm.font("Hack Nerd Font")
-- config.font_size = 14

-- config.font = wezterm.font("MesloLGM Nerd Font")
-- config.font_size = 16

-- config.font = wezterm.font("JetBrainsMono Nerd Font")
-- config.font_size = 20

-- config.font = wezterm.font("IosevkaTerm Nerd Font")
-- config.font_size = 16

-- config.font = wezterm.font("FiraCode Nerd Font")
-- config.font_size = 16

config.font = wezterm.font("Liga SFMono Nerd Font")
config.font_size = 18

config.front_end = "OpenGL"
config.enable_kitty_keyboard = true

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.keys = {
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

return config
