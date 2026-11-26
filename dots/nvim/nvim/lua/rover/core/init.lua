require("rover.core.options")
require("rover.core.keymaps")

-- nvim-treesitter and its parsers are supplied by Home Manager/Nix.
local ok, configs = pcall(require, "nvim-treesitter.configs")
if ok then
  configs.setup({
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    indent = { enable = true },
  })
end
