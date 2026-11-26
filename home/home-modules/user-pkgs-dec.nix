{ pkgs, ... }:

{
  gtk = {
    enable = true;
    colorScheme = "dark";

    theme = {
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = [ "mauve" ];
      };
      name = "catppuccin-mocha-mauve-standard";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };

    font = {
      name = "Noto Sans";
      size = 10;
    };
  };

  home.pointerCursor = {
    enable = true;
    package = pkgs.catppuccin-cursors.latteLight;
    name = "catppuccin-latte-light-cursors";
    size = 18;

    gtk.enable = true;
    x11.enable = true;

    # Enable this if the cursor theme supports Hyprcursor.
    # hyprcursor.enable = true;
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style.name = "gtk3";
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi;

    plugins = with pkgs; [
      rofi-calc
    ];
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [ obs-pipewire-audio-capture ];
  };
}
