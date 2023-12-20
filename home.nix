{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in

{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home.username = "mathias";
  home.homeDirectory = "/home/mathias";
  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  home.file = {
    "./oh-my-zsh/themes/bullet-train.zsh-theme".source = ./sources/bullet-train.zsh-theme;
  };

  imports = [
    ./zsh.nix
    ./packages.nix 
    ./config.nix
    ./xorg.nix
  ];
}
