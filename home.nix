{ config, pkgs, ... }:

{
  # Home manager needs a bit of information about you and the 
  # paths it should manage.
  home.username = "jm";
  home.homeDirectory = "/home/jm";

  home.packages = [
    pkgs.btop
    pkgs.pfetch-rs
  ];

  

  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  # programs.program here and beyond

  # services.service here and beyond
}
