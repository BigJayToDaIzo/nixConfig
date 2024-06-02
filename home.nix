{ config, pkgs, ... }:

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
{
  # Home manager needs a bit of information about you and the 
  # paths it should manage.
  home.username = "jm";
  home.homeDirectory = "/home/jm";
  home.packages = [
    pkgs.wl-clipboard-rs
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
  home.stateVersion = "24.11";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Window Manager Shenannigens
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind = 
    [
    	"mod, q, exec, $terminal"
	"mod, c, killactive,"
	"mod, CTRL, M, exec, $quit"
	"mod, e, exec, $quit"
	"mod, v, togglefloating,"
	"mod, r, exec, $meun"
	"mod, f, fullscreen,"
    ];
  };
  # programs.program here and beyond
  # services.service here and beyond
}
