{ pkgs, ... }:
{
    programs.firefox.enable = true;
    environment.systemPackages = with pkgs; [
        wget git nix-search-cli papirus-icon-theme hyprpolkitagent
        brightnessctl nwg-displays
    ];
}
