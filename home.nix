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
		pkgs.zsh
		pkgs.gh
		pkgs.wl-clipboard
		pkgs.wofi
		pkgs.wofi-emoji
		pkgs.btop
		pkgs.pfetch-rs
		pkgs.alacritty
		pkgs.zellij
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
			defaultEditor = true;
			viAlias = true;
			vimAlias = true;
			colorschemes.ayu.enable = true;
			
		};
		alacritty = {
			enable = true;
			settings = {
				shell.program = "${pkgs.zsh}/bin/zsh";
				padding.x = 2;
				padding.y = 2;
			};
		};
	};
	# services.service here and beyond
}
