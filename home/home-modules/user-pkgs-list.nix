{ pkgs, ... }:
{
    home.packages = with pkgs; [
# editor-dev
        jq neovim nodejs python3 clang gnumake rustc cargo

# cli
            fish htop eza ripgrep ugrep unzip 
            fastfetch awww waybar rofimoji yazi
            nixd stylua

# fonts
            nerd-fonts.jetbrains-mono

# apps
            telegram-desktop qbittorrent mpv vesktop
            nwg-look nwg-bar kitty librewolf

#Sys
            xdg-desktop-portal-hyprland wl-clipboard dunst thunar iwd

#Engine
            godot_4
];
}
