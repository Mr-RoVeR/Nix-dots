return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	config = function()
		local transparent = true
		local float_bg = transparent and "none" or "surface"

		require("rose-pine").setup({
			variant = "main", -- main | moon | dawn | auto
			dark_variant = "main",
			dim_inactive_windows = false,
			extend_background_behind_borders = true,

			enable = {
				terminal = true,
				legacy_highlights = false,
				migrations = true,
			},

			styles = {
				bold = true,
				italic = true,
				transparency = transparent,
			},

			groups = {
				border = "highlight_high",
			},

			highlight_groups = {
				-- readability tweaks
				Comment = { fg = "subtle", italic = true },
				CursorLine = { bg = "highlight_low" },
				CursorLineNr = { fg = "gold", bold = true },
				LineNr = { fg = "muted" },
				Visual = { bg = "iris", blend = 25 },
				MatchParen = { fg = "gold", bg = "gold", blend = 20 },

				-- floats and pickers follow the transparency toggle
				FloatBorder = { fg = "highlight_high", bg = float_bg },
				TelescopeBorder = { fg = "highlight_high", bg = float_bg },
				TelescopeNormal = { bg = float_bg },

				-- statusline blends in when transparent
				StatusLine = { fg = "subtle", bg = transparent and "none" or "surface" },
				StatusLineNC = { fg = "muted", bg = transparent and "none" or "surface" },
			},
		})

		vim.cmd("colorscheme rose-pine")
	end,
}
