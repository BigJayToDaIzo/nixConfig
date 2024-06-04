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
    pkgs.lazygit
    pkgs.gh
    pkgs.wl-clipboard
    pkgs.btop
    pkgs.pfetch-rs
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
      enableMan = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      colorscheme = "desert";
      opts = {
	number = true;
	relativenumber = true;
	shiftwidth = 2;
      };
      plugins = {
	mini = {
	  enable = true;
	};
	neo-tree = {
	  enable = true;
	  
	};
	bufferline = {
	  enable = true;
	};
	treesitter = {
	  enable = true;
	};
	lualine = {
	  enable = true;
	  globalstatus = true;
	};
      };
    };
  };
  # services.service here and beyond
}
