{ pkgs, ... }: {
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    lohit-fonts.kannada
    corefonts

  ];
}
