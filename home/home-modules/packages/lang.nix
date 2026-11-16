{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rustc
    cargo
    go
    nodejs
    python3
    clang

  ];

}
