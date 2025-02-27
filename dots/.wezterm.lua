local wezterm = require("wezterm")

local config = wezterm.config_builder()

------- _____Start_____ -------

------- Theme and text -----
config.color_scheme = "ChallengerDeep"
config.font = wezterm.font("JetBrains Mono")
config.text_background_opacity = 1

config.window_background_opacity = 0.67

------- Tab Bar ------
config.enable_tab_bar = false

config.window_frame = {
	font = wezterm.font({ family = "JetBrains Mono", weight = "Bold" }),
	font_size = 10.5,
	active_titlebar_bg = "#161626",
}

config.colors = {
	tab_bar = {
		inactive_tab_edge = "#744fb3",
	},
}

------ Startup -------
config.default_prog = { "bash" }

return config
