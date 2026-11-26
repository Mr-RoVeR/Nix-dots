local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local result = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    error("Failed to install lazy.nvim: " .. result)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "rover.plugins" },
  { import = "rover.plugins.lsp" },
}, {
  checker = { enabled = false },
  change_detection = { notify = false },
})
