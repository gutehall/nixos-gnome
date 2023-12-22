{ config, pkgs, ... }:

# let
#   home-manager = builtins.fetchTarball {
#         url = "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
#     };  
# in

{
  imports = [
      ./zsh.nix 
      ./config.nix
      ./vim.nix
      ./dconf.nix
  ];

  home.username = "mathias";
  home.homeDirectory = "/home/mathias";
  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    vim
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
    zsh-powerlevel10k
    zsh-history-substring-search
    zsh-fzf-tab
    zsh-syntax-highlighting
    zsh-autosuggestions
    blackbox-terminal
    unrar
    unzip
    curl
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
    awscli2
    eza
    drive
    oh-my-zsh
    tmux
  ];

  home.file = {
    "./oh-my-zsh/themes/bullet-train.zsh-theme".source = ./sources/bullet-train.zsh-theme;
  };

  programs.home-manager.enable = true;
}
