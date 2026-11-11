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
  };
}
