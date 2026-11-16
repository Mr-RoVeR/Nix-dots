{ pkgs, ... }:
{
  home.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake /home/rover/nixos-config#NixOS";
  };

  programs.starship.enable = true;
  home.packages = with pkgs; [ fish ];
}
