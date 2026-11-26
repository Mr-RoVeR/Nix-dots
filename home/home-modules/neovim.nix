{ pkgs, ... }:
let
  treesitterParsers = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
    p.lua
    p.vim
    p.vimdoc
    p.nix
    p.bash
    p.json
    p.yaml
    p.toml
    p.markdown
    p.markdown_inline
    p.html
    p.css
    p.javascript
    p.typescript
    p.tsx
    p.python
    p.c
    p.cpp
    p.rust
    p.svelte
  ]);
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      # Language servers
      lua-language-server
      nixd
      bash-language-server
      vscode-langservers-extracted
      basedpyright
      ruff
      typescript-language-server
      svelte-language-server
      rust-analyzer

      # Linters and formatters
      eslint_d
      pylint
      clippy
      stylua
      nixfmt
      black
      isort
      prettier
      rustfmt

      # Utilities
      ripgrep
      fd
      tree-sitter
      gcc
      gnumake
      git
      curl
      unzip
      nodejs
    ];
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Nix builds parsers, so Neovim does not need to compile/download them at runtime.
  xdg.dataFile."nvim/site/pack/nix/start/nvim-treesitter".source = treesitterParsers;
}
