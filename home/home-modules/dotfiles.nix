{ config, ... }:
let
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "/home/rover/nixos-config/dots/nvim";
  dots = "${config.home.homeDirectory}/nixos-config/dots";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dots}/${path}";
in
{
  xdg.configFile = {
    "dunst".source = link "dunst";
    "fastfetch".source = link "fastfetch";
    "fish".source = link "fish";
    "hypr".source = link "hypr";
    "kitty".source = link "kitty";
    "nwg-bar".source = link "nwg-bar";
    "nwg-look".source = link "nwg-look";
    "rofi".source = link "rofi";
    "strawberry".source = link "strawberry";
    "waybar".source = link "waybar";
  };

}
