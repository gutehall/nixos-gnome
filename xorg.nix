{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.libinput.enable = true;
  
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
}