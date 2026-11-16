{ pkgs, ... }: {
  home.packages = with pkgs; [
    ffmpeg-full
    gnumake
    xdg-desktop-portal-hyprland
  ];
}
