{ config, pkgs, ... }:

{
  # Home manager needs a bit of information about you and the 
  # paths it should manage.
  home.username = "jm";
  home.homeDirectory = "/home/jm";
  home.packages = [
    pkgs.btop
    pkgs.pfetch-rs
    pkgs.wezterm
    pkgs.zellij
    pkgs.taskwarrior3
    pkgs.vlc
    pkgs.ripgrep
  ];
  home.stateVersion = "24.11";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Nvidia
  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  #Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    # Enable this if you have graphical corruption issues or 
    # application crashes after waking from sleep
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    # Use the NVidia open source kernel module (not 'nouveau')
    # Experimental AF
    open = false;
    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
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
