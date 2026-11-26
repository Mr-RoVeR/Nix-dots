{ pkgs, ... }:
let
  nvimExtraPackages = with pkgs; [

    # LSP
    lua-language-server
    nil
    nixd
    bash-language-server
    vscode-langservers-extracted
    basedpyright
    ruff
    typescript-language-server
    svelte-language-server
    rust-analyzer

    # Linters
    eslint_d
    pylint
    clippy

    # Formatters
    stylua
    nixfmt
    black
    prettier

    # Utilities
    ripgrep
    fd
    tree-sitter
    gcc
    git
    curl
    unzip
  ];

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
    p.black
  ]);
  customNeovim = pkgs.symlinkJoin {
    name = "neovim-wrapped";
    paths = [ pkgs.neovim-unwrapped ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/nvim \
        --prefix PATH : ${pkgs.lib.makeBinPath nvimExtraPackages}
      ln -s $out/bin/nvim $out/bin/vi
      ln -s $out/bin/nvim $out/bin/vim
    '';
  };
in
{
  home.packages = [ customNeovim ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  xdg.dataFile."nvim/site/pack/nix/start/nvim-treesitter".source = treesitterParsers;
}
