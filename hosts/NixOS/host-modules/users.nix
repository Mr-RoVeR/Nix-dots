{ pkgs, ... }:
{

  users.users.rover = {
    isNormalUser = true;
    description = "RoVeR";
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
