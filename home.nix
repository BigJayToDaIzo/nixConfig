{ config, pkgs, ... }:

{
  # Home manager needs a bit of information about you and the 
  # paths it should manage.
  home.username = "jm";
  home.homeDirectory = "/home/jm";
  home.packages = [
    pkgs.wl-clipboard
    pkgs.wofi
    pkgs.wofi-emoji
    pkgs.btop
    pkgs.pfetch-rs
    pkgs.zellij
    pkgs.kitty
    pkgs.taskwarrior3
    pkgs.vlc
    pkgs.ripgrep
  ];
  home.stateVersion = "24.05";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Window Manager Shenannigens
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind = 
    [
    	"$mod, q, exec, kitty"
	"$mod, c, killactive,"
	"$mod, CTRL, M, exit,"
	"$mod, v, togglefloating,"
	"$mod, r, exec, wofi"
	"$mod, f, fullscreen,"
    ];

  };
  # programs.program here and beyond
  # services.service here and beyond

}
