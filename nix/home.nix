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
    pkgs.autorandr
    pkgs.lazygit
    pkgs.gh
    pkgs.wl-clipboard
    pkgs.btop
    pkgs.pfetch-rs
    pkgs.kitty
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
    kitty = {
      enable = true;
      font.name = "0xProto Nerd Font Mono";
      font.size = 14;
      settings = {

      };
    };
    nixvim = {
      enable = true;
      enableMan = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      colorschemes.ayu.enable = true;
      colorschemes.ayu.settings.mirage = true;
      opts = {
	number = true;
	relativenumber = true;
	shiftwidth = 2;
     };
      plugins = {
	bufferline = {
	  enable = true;
	};
	lazygit = {
	  enable = true;
	};
	lualine = {
	  enable = true;
	  globalstatus = true;
	};
	lsp = {
	  enable = true;
	  servers = {
	    nil-ls.enable = true;
	    golangci-lint-ls.enable = true;
	    gopls.enable = true;
	    html.enable = true;
	    htmx.enable = true;
	    lua-ls.enable = true;
	    nixd.enable = true;

	  };
	};
	lsp-format.enable = true;
	mini = {
	  enable = true;
	};
	neo-tree = {
	  enable = true;
	  
	};
	treesitter = {
	  enable = true;
	};
      };
    };
  };
  # services.service here and beyond
}
