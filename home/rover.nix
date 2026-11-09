{ pkgs, username, ... }: {
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";
    packages = with pkgs; [ htop ];
  };

  programs.git.enable = true;
  programs.bash.enable = true;
  programs.neovim = {
	enable = true;
	defaultEditor = true;
	viAlias = true;
	vimAlias = true;
	extraPackages = with pkgs; [ripgrep fd gcc ugrep python3 nodejs];
  };
}
