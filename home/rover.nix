{ username, ... }:
{
  imports = [
    ./home-modules/user-pkgs.nix
    ./home-modules/user-pkgs-dec.nix
    ./home-modules/shell.nix
    ./home-modules/neovim.nix
    ./home-modules/git.nix
    ./home-modules/dotfiles.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";
  };
}
