{ config, pkgs, ... }:

# let
#   home-manager = builtins.fetchTarball {
#         url = "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
#     };  
# in

{
  imports = [
      ./zsh.nix
      ./packages.nix 
      ./config.nix
      ./xorg.nix
      ./vim.nix
  ];

  home.username = "mathias";
  home.homeDirectory = "/home/mathias";
  home.stateVersion = "23.11";

  home.file = {
    "./oh-my-zsh/themes/bullet-train.zsh-theme".source = ./sources/bullet-train.zsh-theme;
  };

  programs.home-manager.enable = true;
}
