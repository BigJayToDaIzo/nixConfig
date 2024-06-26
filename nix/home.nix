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
  home.packages = with pkgs; [
    pavucontrol
    rofi-wayland
    rofimoji
    asciiquarium
    dunst
    cbonsai
    pom
    peaclock
    fish
    fzf
    zoxide
    lazygit
    gh
    wl-clipboard
    btop
    pfetch-rs
    fastfetch
    alacritty
    zellij
    vlc
    ripgrep
    egl-wayland
    grim
    swappy
    slurp
    waybar
    taskwarrior3
    steam
    golangci-lint
    golangci-lint-langserver
  ];
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";
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
      input = {
	kb_layout = "us";
	kb_options = "caps:swapescape";
	follow_mouse = 0;
      };
      misc = {
	mouse_move_focuses_monitor = false;
	hide_cursor_on_key_press = true;
	# inactive_timeout = 10;
      };
      bind = [
	"$mod, Q, exec, alacritty"
	"$mod, C, killactive,"
	"$mod CTRL, M, exit,"
	"$mod, E, exec, alacritty -e yazi"
	"$mod, V, togglefloating,"
	"$mod, R, exec, rofi -show run"
	"$mod, F, fullscreen,"
	"$mod, Y, exec, firefox -new-instance -P Youtube"
	"$mod, Y, exec, firefox"
	"$mod, D, exec, firefox -new-instance -kiosk -P Discord"
	"$mod, P, exec, firefox -new-instance -private-window -P Private"
	"$mod CTRL ALT, L, exec, $lock"
	'',Print, exec, grim -g "$(slurp)" - | swappy -f -''
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
      workspace = [
	"1, monitor:HDMI-A-1, persistent:true, default:true"
	"2, monitor:HDMI-A-1, persistent:true"
	"3, monitor:HDMI-A-1"
	"4, monitor:HDMI-A-1, persistent:true"
	"5, monitor:DP-3, persistent:true, default:true"
	"6, monitor:DP-3, persistent:true"
	"7, monitor:DP-3"
	"8, monitor:DP-2, persistent:true, default:true"
	"9, monitor:DP-2, persistent:true"
	"0, monitor:DP-2"
      ];
      env = [
	"XCURSOR_SIZE,32"
	"ge to qt6ct if you have that"
	"QT_QPA_PLATFORMTHEME,qt6ct "
	"LIBVA_DRIVER_NAME, nvidia"
	"XDG_SESSION_TYPE, wayland"
	"GMB_BACKEND, nvidia-drm"
	"__GLX_VENDOR_LIBRARY_NAME, nvidia"
	"WLR_NO_HARDWARE_CURSORS, 1"
	"WLR_RENDERER_ALLOW_SOFTWARE, 1"
      ];
      exec-once = [
	"waybar"
	"dunst"
	"/usr/lib/polkit-kde-authentication-agent-1"
	"[workspace special:magic silent] alacritty -e lazygit -p ~/.config/"
	"[workspace 1 silent;fullscreen] alacritty -e zellij attach pomoTask"
	"[workspace 2 silent;fullscreen] alacritty -e btop"
	"[workspace 3 silent] pavucontrol"
	"[workspace 4] firefox -new-instance -kiosk -P Discord"
	"[workspace 5] alacritty"
	"[workspace 6 silent] alacritty -e zellij attach configs"
	"[workspace 8 silent] firefox -new-instance -P Youtube"
	"[workspace 9 silent] vlc"
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
    nixvim = {
      enable = true;
      enableMan = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      colorschemes.ayu.enable = true;
      colorschemes.ayu.settings.mirage = true;
      clipboard.register = "unnamedplus";
      keymaps = [
	{
	  action = "<cmd>Oil<CR>";
	  mode = "n";
	  key = "_";
	  options = {
	    silent = true;
	  };
	}
      ];
      opts = {
	number = true;
	relativenumber = true;
	shiftwidth = 2;
      };
      plugins = {
	autoclose.enable = true;
	bufferline = {
	  enable = true;
	};
	cmp.enable = true;
	comment.enable = true;
	conform-nvim.enable = true;
	fidget.enable = true;
	flash.enable = true;
	lazygit = {
	  enable = true;
	};
	lint = {
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
	lsp-status.enable = true;	
	mini = {
	  enable = true;
	};
	nix.enable = true;
	nix-develop.enable = true;
	oil = {
	  enable = true;
	};
	telescope = {
	  enable = true;
	};
	treesitter = {
	  enable = true;
	};
	which-key = {
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
    zellij = {
      enable = true;
      enableFishIntegration = true;
      settings = {};
    };
  };
  # services.service here and beyond
  services.taskwarrior-sync.enable = true;
}
