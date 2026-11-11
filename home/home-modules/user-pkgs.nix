{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # editor / dev
    neovim nodejs python3 clang gnumake rustc cargo

    # cli
    fish htop eza ripgrep ugrep unzip fastfetch

    # fonts
    nerd-fonts.jetbrains-mono

    # apps
    telegram-desktop qbittorrent mpv 
  ];
}
