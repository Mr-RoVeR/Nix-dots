{... }:

{
  imports =
    [ ./host-modules/boot.nix
      ./host-modules/Nix.nix
      ./host-modules/network.nix
      ./host-modules/locale.nix
      ./host-modules/desktop.nix
      ./host-modules/audio.nix
      ./host-modules/users.nix
      ./host-modules/host-pkgs.nix
      ./host-modules/power.nix
      ./hardware-configuration.nix
    ];
  services.openssh.enable = true;
  system.stateVersion = "26.05";

}
