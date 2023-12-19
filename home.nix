{ config, pkgs, ... }:

rec {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "mathias";
  home.homeDirectory = "/home/mathisa";
  home.packages = with pkgs; [
    #pkgs.virtualbox
    vagrant
    packer
    vscode
    slack
    git
    gh
    google-chrome
    zsh
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
	
  ];

  programs.git = {
    enable = true;
    userName = "gutehall";
    userEmail = "mathias@dm3.io";
  };

    #settings = { ignorecase = true; };
    extraConfig = ''
      set mouse=a
      set ignorecase
      set pastetoggle=<F2>
      set clipboard+=unnamedplus
    '';
  };
  xdg.mimeApps.defaultApplications = { "text/html" = ["chromium-browser.desktop"];};
  programs.tmux.enable = true;
  programs.tmux.keyMode = "vi";
  programs.tmux.sensibleOnTop = true;
  programs.tmux.shortcut = "a";
  programs.tmux.terminal = "screen-256color";
  programs.tmux.secureSocket = false;
  programs.tmux.extraConfig = ''

  # Make mouse useful in copy mode
  setw -g mouse on
  set-option -s set-clipboard off
  bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -se c -i"
  '';

  programs.bash.enable = true;
  programs.bash.initExtra = ''
    set -o vi
    alias grep="grep --color=auto"
    # https://github.com/rycee/home-manager/pull/797#issuecomment-538464993
    source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
    '';
  };
}