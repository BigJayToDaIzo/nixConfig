{ config, pkgs, nixvim, ... }:

{
	imports =
	[ # Include the results of the hardware scan.
		nixvim.homeManagerModules.nixvim
	];
	# Home manager needs a bit of information about you and the 
	# paths it should manage.
	home.username = "jm";
	home.homeDirectory = "/home/jm";
	home.packages = [
		pkgs.gh
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

	# programs.program here and beyond
	# Let Home Manager install and manage itself.
	programs = {
		home-manager.enable = true;
		starship = {
			enable = true;
		};
		nixvim = {
			enable = true;

		};
	};
	# services.service here and beyond


	# Inputs n shts?
}
