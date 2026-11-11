{ config, ... }:
let
  dots = "${config.home.homeDirectory}/nixos-config/dots";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dots}/${path}";
in
{
  xdg.configFile = {
    "nvim".source = link "nvim";
    "fish".source = link "fish";
    "fastfetch".source = link "fastfetch";
    "dunst".source = link "dunst";
    "nwg-bar".source = link "nwg-bar";
    "nwg-look".source = link "nwg-look";
    "strawberry".source = link "strawberry";
    "kitty".source = link "kitty";
    "hypr".source = link "hypr";
    "rofi".source = link "rofi";
    "waybar".source = link "waybar";
  };
}
