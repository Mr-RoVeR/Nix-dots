{ ... }:
{
  home.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake /home/rover/nixos-config#NixOS";
  };

  programs.bash.enable = true;
  programs.starship.enable = true;
}
