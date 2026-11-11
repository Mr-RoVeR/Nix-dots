{ ... }:
{ 
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;
  programs.dconf.enable = true;


  services.xserver.xkb = { layout = "us"; variant = ""; };

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
 
  services.libinput.enable = true;
  services.printing.enable = false;
}
