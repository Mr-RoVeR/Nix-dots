{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

 nix.settings.experimental-features = [ "nix-command" "flakes" ];
 
 boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

 boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "NixOS";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = false;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  
  };

  services.libinput.enable = true;

  users.users."rover" = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "RoVeR";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      rustc
      cargo
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;
  programs.fish.enable = true ;
  nixpkgs.config.allowUnfree = true;

  
   environment.systemPackages = with pkgs; [
     wget
    git
   ];

  services.openssh.enable = true;
  system.stateVersion = "26.05"; # Did you read the comment?

}
