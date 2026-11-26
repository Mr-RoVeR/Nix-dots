{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      # Language servers
      lua-language-server
      nixd
      nil
      bash-language-server
      vscode-langservers-extracted
      basedpyright
      typescript-language-server
      svelte-language-server
      rust-analyzer

      # Diagnostics and formatting
      ruff
      eslint_d
      pylint
      stylua
      nixfmt
      black
      isort
      prettier

      # Tools used by Neovim plugins and pickers
      ripgrep
      fd
      tree-sitter
      gcc
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
}
