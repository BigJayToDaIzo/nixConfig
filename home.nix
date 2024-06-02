{ config, pkgs, ... }:

{
  # Home manager needs a bit of information about you and the 
  # paths it should manage.
  home.username = "jm";
  home.homeDirectory = "/home/jm";

  home.packages = [
    pkg.btop
    pkg.pfetch
  ];

  

  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  # programs.program here and beyond

  # services.service here and beyond
}
