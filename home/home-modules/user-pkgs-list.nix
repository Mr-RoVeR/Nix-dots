{ pkgs, ... }:
{
    home.packages = with pkgs; [
# editor-dev
        jq nodejs python3 clang gnumake rustc cargo

# cli
            fish htop eza ripgrep ugrep unzip tree
            fastfetch nixd stylua ffmpeg-full

# fonts
            nerd-fonts.jetbrains-mono lohit-fonts.kannada

# apps
            telegram-desktop qbittorrent mpv vesktop
            nwg-look nwg-bar kitty librewolf

#Sys
            xdg-desktop-portal-hyprland wl-clipboard dunst thunar iwd pavucontrol

#Engine
            godot_4

#Hyprland 
            awww waybar rofimoji yazi grim slurp aria2 yt-dlp
            hypridle
];
}
