{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    virtualbox
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
    todoist
    spotify
    teams-for-linux
    cmake
    libgit2
    rustup
    lsd
    bat
  ];
}
