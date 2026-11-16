{ pkgs, ... }: {
  home.packages = with pkgs; [
    jq
    htop
    eza
    ripgrep
    ugrep
    unzip
    tree
    fastfetch
  ];
}
