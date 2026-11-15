return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				local keymap = vim.keymap

				local keybinds = {
					{ "n", "gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references" },
					{ "n", "gD", vim.lsp.buf.declaration, "Go to declaration" },
					{ "n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions" },
					{ "n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations" },
					{ "n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions" },
					{ "n", "<leader>ca", vim.lsp.buf.code_action, "See available code actions" },
					{ "n", "<leader>rn", vim.lsp.buf.rename, "Smart rename" },
					{ "n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics" },
					{ "n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics" },
					{
						"n",
						"[d",
						function()
							vim.diagnostic.jump({ count = -1 })
						end,
						"Go to previous diagnostic",
					},
					{
						"n",
						"]d",
						function()
							vim.diagnostic.jump({ count = 1 })
						end,
						"Go to next diagnostic",
					},
					{ "n", "K", vim.lsp.buf.hover, "Show documentation for cursor" },
					{ "n", "<leader>rs", ":LspRestart<CR>", "Restart LSP" },
				}

				for _, bind in ipairs(keybinds) do
					opts.desc = bind[4]
					keymap.set(bind[1], bind[2], bind[3], opts)
				end
			end,
		})

		-- Paste your own icon glyphs back between the quotes
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
			},
		})

		-- Applied to every server
		vim.lsp.config("*", { capabilities = cmp_nvim_lsp.default_capabilities() })

		-- Server-specific settings
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					completion = { callSnippet = "Replace" },
				},
			},
		})

		-- The servers themselves come from Nix (nvimExtraPackages in neovim.nix), not Mason
		vim.lsp.enable({
			"lua_ls",
			"nixd",
			"bashls",
			"jsonls",
			"html",
			"cssls",
			"basedpyright",
			"ruff",
			"ts_ls",
			"svelte",
		})
	end,
}
