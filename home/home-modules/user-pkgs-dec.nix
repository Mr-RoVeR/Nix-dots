{pkgs, ...}:
{

    gtk = {
        enable = true;
        theme = {
            package = pkgs.catppuccin-gtk.override { variant = "mocha"; accents = [ "mauve" ]; };
            name = "catppuccin-mocha-mauve-standard";
        };
        iconTheme = {
            package = pkgs.papirus-icon-theme;
            name = "Papirus-Dark";
        };
    };

    home.pointerCursor = {
        enable = true;
        package = pkgs.catppuccin-cursors.mochaDark;
        name = "catppuccin-mocha-dark-cursors";
        size = 18;
        gtk.enable = true;
        x11.enable = true;
    };

    qt = {
        enable = true;
        platformTheme.name = "gtk3";
        style.name = "gtk3";
    };

    dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

    programs.rofi = {
        enable = true;
        package = pkgs.rofi;
            plugins = with pkgs; [
            rofi-calc
            ];
    };
}
