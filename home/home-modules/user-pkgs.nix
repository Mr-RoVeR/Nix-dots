{ pkgs, ... }:
{
  imports = [
    ./packages/cli.nix
    ./packages/engine.nix
    ./packages/fonts.nix
    ./packages/internet.nix
    ./packages/lang.nix
    ./packages/utilities.nix
    ./packages/WM-rel-apps.nix

  ];
}
