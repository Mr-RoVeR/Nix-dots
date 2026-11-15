hl.window_rule({
	match = { class = ".*" },
	suppress_event = "maximize",
})
hl.window_rule({
	match = { class = "^(kitty)$" },
	tile = true,
})
hl.window_rule({
	match = { class = "^(org\\.pulseaudio\\.pavucontrol)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(nm-connection-editor)$" },
	float = true,
})
hl.window_rule({
	match = { class = "^(kitty-btop)$" },
	float = true,
	size = { 1400, 800 },
	center = true,
})
hl.window_rule({
	match = { class = "^(blueman-manager)$" },
	float = true,
})
hl.window_rule({
	match = { class = "^(Blueman-manager)$" },
	float = true,
})
