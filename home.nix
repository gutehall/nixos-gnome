{ config, pkgs, ... }:

{
  imports = [
      # ./zsh.nix 
      # ./vim.nix
  ];

  home.username = "mathias";
  home.homeDirectory = "/home/mathias";
  home.stateVersion = "24.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    vim
    virtualbox
    vagrant
    terraform
    packer
    ansible
    vscode
    slack
    git
    gh
    google-chrome
    zsh
    tilix
    unrar
    unzip
    curl
    wget
    gnupg
    htop
    btop
    tailscale
    docker
    # minecraft
    dropbox
    kubectl
    minikube
    lazygit
    spotify
    whatsapp-for-linux
    lsd
    bat
    awscli2
    eza
    drive
    tmux
    warp-terminal
    meslo-lg
    fira-code
    docker-compose
    tree
    qemu
    lazydocker
    azure-cli
    tfsec
    infracost
    transmission
    k9s
    helm
    argocd
    discord
    discordo
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.home-manager.enable = true;
}
