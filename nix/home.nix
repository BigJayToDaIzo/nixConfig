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
    pkgs.grim
    pkgs.swappy
    pkgs.slurp
  ];
  home.stateVersion = "24.05";

  # Fonts stuff
  fonts.fontconfig.defaultFonts.emoji = ["Symbols Nerd Font Mono"];

  # Window Manager (other in config, move here)
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
	"$mod, Q, exec, alacritty"
	"$mod, C, killactive,"
	"$mod CTRL, M, exit,"
	# "$mod, E, exec, $filemanager"
	"$mod, V, togglefloating,"
	# "$mod, R, exec, $menu"
	"$mod, F, fullscreen,"
	# "$mod, Y, exec, firefox -new-instance -P Youtube"
	"$mod, Y, exec, firefox"
	# "$mod, D, exec, firefox -new-instance -kiosk -P Discord"
	# "$mod, P, exec, firefox -new-instance -private-window -P Private"
	"$mod CTRL ALT, L, exec, $lock"
	",Print, exec, grim -g '$(slurp)' - | swappy -f -"
	# "$mod, T, togglesplit, # dwindle
	# "$mod, P, pseudo, # dwindle"
	# Move focus with main"$mod + arrow keys
	"$mod, h, movefocus, l"
	"$mod, l, movefocus, r"
	"$mod, k, movefocus, u"
	"$mod, j, movefocus, d"
	# Move windows"
	"$mod SHIFT, h, movewindow, l"
	"$mod SHIFT, l, movewindow, r"
	"$mod SHIFT, k, movewindow, u"
	"$mod SHIFT, j, movewindow, d"
	# Switch workspaces with main"$mod + [0-9]
	"$mod, 1, workspace, 1"
	"$mod, 2, workspace, 2"
	"$mod, 3, workspace, 3"
	"$mod, 4, workspace, 4"
	"$mod, 5, workspace, 5"
	"$mod, 6, workspace, 6"
	"$mod, 7, workspace, 7"
	"$mod, 8, workspace, 8"
	"$mod, 9, workspace, 9"
	"$mod, 0, workspace, 10"
	# Move active window to a workspace with mod + SHIFT + [0-9]
	"$mod SHIFT, 1, movetoworkspace, 1"
	"$mod SHIFT, 2, movetoworkspace, 2"
	"$mod SHIFT, 3, movetoworkspace, 3"
	"$mod SHIFT, 4, movetoworkspace, 4"
	"$mod SHIFT, 5, movetoworkspace, 5"
	"$mod SHIFT, 6, movetoworkspace, 6"
	"$mod SHIFT, 7, movetoworkspace, 7"
	"$mod SHIFT, 8, movetoworkspace, 8"
	"$mod SHIFT, 9, movetoworkspace, 9"
	"$mod SHIFT, 0, movetoworkspace, 10"
	# Example special workspace (scratchpad)
	"$mod, S, togglespecialworkspace, magic"
	"$mod SHIFT, S, movetoworkspace, special:magic"
	# Scroll through existing workspaces with main"$mod + scroll
	"$mod, mouse_down, workspace, e+1"
	"$mod, mouse_up, workspace, e-1"
      ];
      bindm = [
	"$mod, mouse:272, movewindow"
	"$mod, mouse:273, resizewindow"
      ];
      binde = [
	"$mod CTRL, h, resizeactive, -10 0"
	"$mod CTRL, j, resizeactive, 0 10"
	"$mod CTRL, k, resizeactive, 0 -10"
	"$mod CTRL, l, resizeactive, 10 0"
      ];	
      monitor = [
	"DP-2,2560x1440@144,0x-1440,auto"
	"DP-3,preferred,0x0,auto"
	"HDMI-A-1,preferred,-1920x360,auto"
      ];
    };
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
    starship = {
      enable = true;
      enableFishIntegration = true;
      enableTransience = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;

    };
  };
  # services.service here and beyond
}
