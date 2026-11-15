{ ... }:
{ 
  programs.hyprlock.enable = true;
  programs.dconf.enable = true;
  
  services.xserver.xkb = { layout = "us"; variant = ""; };
 
  services.libinput.enable = true;
  services.printing.enable = false;

  programs.hyprland.enable = true;
  
}
