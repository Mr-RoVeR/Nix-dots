{ pkgs, ... }: {
  home.packages = with pkgs; [
    ffmpeg-full
    gnumake
    gvfs
    xdg-desktop-portal-hyprland
  ];
}
