{ username, ... }:
{
  imports = [
    ./modules/user-pkgs.nix
    ./modules/shell.nix
    ./modules/git.nix
    ./modules/dotfiles.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";
  };
}
