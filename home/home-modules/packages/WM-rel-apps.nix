{ pkgs, ... }: {
  home.packages = with pkgs; [
    awww
    waybar
    rofimoji
    yazi
    grim
    slurp
    aria2
    yt-dlp
    hypridle
    libreoffice-fresh
    wl-clipboard
    dunst
    thunar
    iwd
    pavucontrol
    nwg-look
    nwg-bar
    kitty
    mpv

  ];
}
