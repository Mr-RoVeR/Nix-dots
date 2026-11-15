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

    # Linters
    eslint_d
    pylint

    # Formatters
    stylua
    nixfmt
    prettier
    black

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
  ]);

  # Wrap unwrapped Neovim directly: avoids rplugin.vim bug AND .config/nvim/init.lua collision
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
  # 1. Install the wrapped Neovim binary
  home.packages = [ customNeovim ];

  # 2. Set default editor environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # 3. Link Treesitter parsers into ~/.local/share/nvim/site (outside ~/.config/nvim)
  xdg.dataFile."nvim/site/pack/nix/start/nvim-treesitter".source = treesitterParsers;
}
