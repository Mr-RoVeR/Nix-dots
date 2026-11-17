{ pkgs, ... }:
{
  programs.hyprlock.enable = true;
  programs.dconf.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.libinput.enable = true;
  services.printing.enable = false;

  programs.fish.enable = true;
  programs.hyprland.enable = true;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ intel-media-driver ];
  };
}
