{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  home-manager.users.mathias.imports = [ ./home.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Stockholm";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  
  environment.gnome.excludePackages = (with pkgs; [
  gnome-photos
  gnome-tour
]) ++ (with pkgs.gnome; [
  cheese
  gnome-music
  gnome-terminal
  gnome-console
  gnome-calendar
  gnome-help
  gnome-contacts
  gnome-weather
  gedit
  epiphany 
  geary 
  evince 
  gnome-characters
  totem 
  tali 
  iagno 
  hitori 
  atomixcontacts
]);

  services.xserver = {
    layout = "se";
    xkbVariant = "";
  };

  console.keyMap = "sv-latin1";

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth = {
    enable = true;
    config = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
  services.blueman.enable = true;
  };

  services.xserver.libinput.enable = true;

   users.users.mathias = {
     isNormalUser = true;
     description = "mathias";
     extraGroups = [ "networkmanager" "wheel" ];
     packages = with pkgs; [
     ];
   };

  programs.zsh.enable = true;
  users.users.mathias.shell = pkgs.zsh;

  environment.systemPackages = [
    pkgs.vimPlugins.Vundle-vim
    pkgs.vimPlugins.vim-localvimrc
    pkgs.zsh-autosuggestions
    pkgs.zsh-syntax-highlighting
    pkgs.vimPlugins.zenburn
    gnomeExtensions.appindicator

      ((vim_configurable.override {  }).customize{
      name = "vim";
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [ vim-nix ];
        opt = [];
      };
      vimrcConfig.customRC = ''
        set nocompatible
        filetype off

        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()

        Plugin 'VundleVim/Vundle.vim'

        Plugin 'preservim/nerdtree'

        call vundle#end()
        filetype plugin indent on

        set runtimepath+=~/.vim_runtime

        colors zenburn

        source ~/.vim_runtime/vimrcs/basic.vim
        source ~/.vim_runtime/vimrcs/filetypes.vim
        source ~/.vim_runtime/vimrcs/plugins_config.vim
        source ~/.vim_runtime/vimrcs/extended.vim

        try
        source ~/.vim_runtime/my_configs.vim
        catch
        endtry

        call pathogen#infect()
        syntax on
        filetype plugin indent on

        autocmd vimenter * NERDTree
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
        let g:NERDTreeWinPos = "left"
        map <C-n> :NERDTreeToggle<CR>
        let NERDTreeShowHidden=1

        nnoremap <C-Left> :tabprevious<CR>
        nnoremap <C-Right> :tabnext<CR>
        nnoremap <C-j> :tabprevious<CR>
        nnoremap <C-k> :tabnext<CR>
      '';
    }
   )
  ];

  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];

  system.stateVersion = "23.11";

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.guest.enable = true;

  powerManagement.enable = true; 
}
