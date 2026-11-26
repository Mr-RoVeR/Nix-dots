return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.diagnostic.config({
      virtual_text = { spacing = 2, source = "if_many" },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    vim.lsp.config("*", { capabilities = capabilities })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true),
          },
          completion = { callSnippet = "Replace" },
        },
      },
    })

    vim.lsp.config("nixd", {
      settings = {
        nixd = {
          formatting = { command = { "nixfmt" } },
        },
      },
    })

    vim.lsp.config("basedpyright", {
      settings = {
        basedpyright = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true,
          },
        },
      },
    })

    vim.lsp.enable({
      "lua_ls",
      "nixd",
      "bashls",
      "jsonls",
      "html",
      "cssls",
      "basedpyright",
      "ts_ls",
      "svelte",
      "rust_analyzer",
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local maps = {
          { "gR", "<cmd>Telescope lsp_references<CR>", "LSP references" },
          { "gD", vim.lsp.buf.declaration, "Go to declaration" },
          { "gd", "<cmd>Telescope lsp_definitions<CR>", "LSP definitions" },
          { "gi", "<cmd>Telescope lsp_implementations<CR>", "LSP implementations" },
          { "gt", "<cmd>Telescope lsp_type_definitions<CR>", "LSP type definitions" },
          { "<leader>ca", vim.lsp.buf.code_action, "Code action" },
          { "<leader>rn", vim.lsp.buf.rename, "Rename symbol" },
          { "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Buffer diagnostics" },
          { "<leader>d", vim.diagnostic.open_float, "Line diagnostics" },
          { "[d", function() vim.diagnostic.jump({ count = -1 }) end, "Previous diagnostic" },
          { "]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic" },
          { "K", vim.lsp.buf.hover, "Hover documentation" },
          { "<leader>rs", "<cmd>LspRestart<CR>", "Restart LSP" },
        }
        for _, item in ipairs(maps) do
          vim.keymap.set("n", item[1], item[2], vim.tbl_extend("force", opts, { desc = item[3] }))
        end
      end,
    })
  end,
}
