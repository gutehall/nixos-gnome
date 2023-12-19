{ config, pkgs, ... }:

rec {
  programs.home-manager.enable = true;

  home.username = "mathias";
  home.homeDirectory = "/home/mathias";
  home.stateVersion = "23.11";
  home.packages = with pkgs; [
    #virtualbox
    vagrant
    packer
    ansible
    vscode
    slack
    git
    gh
    google-chrome
    zsh
    blackbox-terminal
    wgnord
    wireguard-tools
    openresolv
    gnomeExtensions.gnordvpn-local
    wireguard-go
    unzip
    wget
    gnupg
    htop
    btop
    tailscale
    docker
    minecraft
    dropbox
    kubectl
    minikube
    lazygit
    cmake
    libgit2
    rustup
  ];

  home.file = {
    ".zshrc".source = "./sources/zshrc";
  };
  
  programs.zsh.enable = true;

  programs.git = {
    enable = true;
    userName = "gutehall";
    userEmail = "mathias@dm3.io";
  };
}
