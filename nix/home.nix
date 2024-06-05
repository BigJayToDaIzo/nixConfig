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
    pkgs.fish
    pkgs.fzf
    pkgs.zoxide
    pkgs.lazygit
    pkgs.gh
    pkgs.wl-clipboard
    pkgs.btop
    pkgs.pfetch-rs
    pkgs.fastfetch
    pkgs.kitty
    pkgs.alacritty
    pkgs.zellij
    pkgs.taskwarrior3
    pkgs.vlc
    pkgs.ripgrep
    pkgs.egl-wayland
  ];
  home.stateVersion = "24.05";

  # Fonts stuff
  fonts.fontconfig.defaultFonts.emoji = ["Symbols Nerd Font Mono"];

  # Window Manager (other in config, move here)
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind = [
      "$mod, F, exec, firefox"
      "$mod, Q, exec, kitty"
      "$mod, C, killactive,"
      "$mod CTRL, M, exit,"
     ",Print, exec, grim -g '$(slurp)' - | swappy -f -"
    ]
    ++ (
      # workspaces
      # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
      builtins.concatLists (builtins.genList (
	x: let
	  ws = let
	    c = (x + 1) / 10;
	  in
	    builtins.toString (x + 1 - (c * 10));
	in [
	  "$mod, ${ws}, workspace, ${toString (x + 1)}"
	  "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
	]) 10)
    ); 
  };

  # programs.program here and beyond
  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
    alacritty = {
      enable = true;
      settings = {
	window = {
	  padding = { x = 5; y = 5; };
	  dynamic_padding = true;
	  decorations_theme_variant = "Dark";
	  resize_increments = true;
	};
	font = {
	  size = 15;
	};
	selection = {
	  save_to_clipboard = true;
	};
	cursor = {
	  style = {
	    shape = "Beam";
	    blinking = "On";
	  };
	  vi_mode_style = {
	    shape = "Block"; 
	    blinking = "On";
	  };
	};
      };
    };
    starship = {
      enable = true;
      enableFishIntegration = true;
      enableTransience = true;
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
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
  # services.service here and beyond
}
