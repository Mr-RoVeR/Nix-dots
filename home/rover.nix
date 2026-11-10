{ config, pkgs, username, ... }:
let
dots = "${config.home.homeDirectory}/dots";
link = path: config.lib.file.mkOutOfStoreSymlink "${dots}/${path}";
in
{
    home = {
        inherit username;
        homeDirectory = "/home/${username}";
        stateVersion = "26.05";
        packages = with pkgs; [ neovim htop nerd-fonts.jetbrains-mono eza ripgrep ugrep nodejs python3 fish clang gnumake unzip starship fastfetch telegram-desktop];
        shellAliases = {
            rebuild = "sudo nixos-rebuild switch --flake /home/rover/nixos-config#NixOS";
        };
    };

    programs.git.enable = true;
    programs.bash.enable = true;
    programs.starship.enable = true;
    programs.gh = {
        enable = true;
        settings.git_protocol = "ssh";
    };
    xdg.configFile = {
        "nvim".source = link "nvim";
        "fish".source = link "fish";
        "fastfetch".source = link "fastfetch";
    };
}
