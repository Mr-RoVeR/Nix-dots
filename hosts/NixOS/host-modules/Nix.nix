{ ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  boot.resumeDevice = "/dev/disk/by-uuid/629066f5-060d-4a7f-a09d-1768c0c0fc41";
}
