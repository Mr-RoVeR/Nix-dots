{ username, ... }:
{
  imports = [
    ./user-pkgs.nix
    ./shell.nix
    ./git.nix
    ./dotfiles.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";
  };
}
