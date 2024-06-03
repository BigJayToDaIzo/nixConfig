{ config, pkgs, ... }:

{
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

  # Window Manager Shenannigens

  # programs.program here and beyond
  # Let Home Manager install and manage itself.
  programs = {
  	home-manager.enable = true;
	starship = {
	enable = true;
	settings = {
		"$schema" = 'https://starship.rs/config-schema.json'

		format = """
		$sudo$os$env_var$hostname$directory$all$cmd_duration$fill$time
		$status$character
		"""

		# Must add ALL the package possiblities by hand because $all is forcing a newline

		add_newline = false

		palette = 'super_dank_af'

		[palettes.super_dank_af]
		user_fg = '#bc33d8'
		clock_fg = '#ffa75d'
		time_fg = '#fcf77c'
		char_success_fg = '#07be61'
		char_poobie_fg = '#be0c07'
		directory_fg = '#f089fc'
		package_fg = '#82eefd'
		package_bg = '#727f72'
		iced_out_os = '#09ecf8'

		# Less neon color palette
		[palettes.super_dank_mellow]

		[character]
		success_symbol = '[󱞩](char_success_fg)'
		error_symbol = '[](char_poobie_fg)'
		vimcmd_symbol = '[](time_fg)'
		vimcmd_replace_one_symbol = '[](time_fg)'
		vimcmd_replace_symbol = '[](char_poobie_fg)'
		vimcmd_visual_symbol = '[](user_fg)'

		[cmd_duration]
		format = '[\[󱎫 $duration\]](time_fg)'

		[directory]
		style = 'directory_fg'
		read_only = ' '
		read_only_style = 'char_poobie_fg'
		home_symbol = '󰋜 '

		[env_var.USER]
		format = '[$env_value.](user_fg)'

		[fill]
		symbol = ' '

		[git_branch]
		symbol = ' '
		format = '[ \[$symbol$branch\]](char_success_fg)'

		[git_commit]
		tag_symbol = ''

		[git_metrics]
		disabled = false
		format = '(([\[](time_fg)[+$added](char_success_fg))([-$deleted](time_fg))[\]](time_fg))'

		[git_status]
		conflicted = '󱃟'
		stashed = '󰘓'
		untracked = '󰡯'
		format = '([\[$all_status$ahead_behind\]](clock_fg))'

		[hostname]
		ssh_only = false
		ssh_symbol = '󰣀 '
		format = '[$hostname($ssh_symbol)@](user_fg)'

		[line_break]
		disabled = true

		[memory_usage]
		threshold = 50
		disabled = false
		format = '[  $ram( | $swap)](char_poobie_fg)'

		[os]
		disabled = false
		format = '[$symbol](iced_out_os)'

		[os.symbols]
		Arch = ' '
		NixOS = ' '
		Ubuntu = ' '
		Windows = ' '

		[sudo]
		disabled = false
		format = '[󰒃 ](char_poobie_fg)'

		[status]
		disabled = false
		format = '[\[$status\]](char_poobie_fg)'

		[time]
		disabled = false
		format = '[[󰥔 ](clock_fg)$time ](time_fg)'

		[aws]
		format = '[\[$symbol($profile)(\($region\))(\[$duration\])\]](package_fg)'

		[bun]
		format = '[\[$symbol($version)]\]](package_fg)'

		[c]
		symbol = '𝗖'
		format = '[\[$symbol($version(-$name))\]](package_fg)'

		[cmake]
		format = '[\[$symbol($version)\]](package_fg)'

		[container]
		symbol = '󰏗'
		format = '[\[$symbol \[$name\]](package_fg)'

		[cobol]
		format = '[\[$symbol($version)\]](package_fg)'

		[conda]
		format = '[\[$symbol$environment\]](package_fg)'

		[crystal]
		format = '[\[$symbol($version)\]](package_fg)'

		[daml]
		format = '[\[$symbol($version)\]](package_fg)'

		[dart]
		format = '[\[$symbol($version)\]](package_fg)'

		[deno]
		format = '[\[$symbol($version)\]](package_fg)'

		[docker_context]
		format = '[\[$symbol$context\]](package_fg)'

		[dotnet]
		format = '[\[$symbol($version)(🎯 $tfm)\]](package_fg)'

		[elixir]
		format = '[\[$symbol($version \(OTP $otp_version\))\]](package_fg)'

		[elm]
		format = '[\[$symbol($version)\]](package_fg)'

		[erlang]
		format = '[\[$symbol($version)\]](package_fg)'

		[fennel]
		format = '[\[$symbol($version)\]](package_fg)'

		[fossil_branch]
		format = '[\[$symbol$branch\]](package_fg)'

		[gcloud]
		format = '[\[$symbol$account(@$domain)(\($region\))\]](package_fg)'

		[golang]
		symbol = ' '
		format = '[\[$symbol($version)\]](fg:package_fg)'

		[gradle]
		format = '[\[$symbol($version)\]](package_fg)'

		[guix_shell]
		format = '[\[$symbol]\](package_fg)'

		[haskell]
		format = '[\[$symbol($version)\]](package_fg)'

		[haxe]
		format = '[\[$symbol($version)\]](package_fg)'

		[helm]
		format = '[\[$symbol($version)\]](package_fg)'

		[hg_branch]
		format = '[\[$symbol$branch\]](package_fg)'

		[java]
		format = '[\[$symbol($version)\]](package_fg)'

		[julia]
		format = '[\[$symbol($version)\]](package_fg)'

		[kotlin]
		format = '[\[$symbol($version)\]](package_fg)'

		[kubernetes]
		format = '[\[$symbol$context( \($namespace\))\]](package_fg)'

		[lua]
		symbol = ' '
		format = '[\[$symbol($version)\]](package_fg)'

		[meson]
		format = '[\[$symbol$project\]](package_fg)'

		[nim]
		format = '[\[$symbol($version)\]](package_fg)'

		[nix_shell]
		format = '[\[$symbol$state( \($name\))\]](package_fg)'

		[nodejs]
		format = '[\[$symbol($version)\]](package_fg)'

		[ocaml]
		format = '[\[$symbol($version)(\($switch_indicator$switch_name\))\]](package_fg)'

		[opa]
		format = '[\[$symbol($version)\]](package_fg)'

		[openstack]
		format = '[\[$symbol$cloud(\($project\))\]](package_fg)'

		[package]
		format = '[\[󰏗 $version\]](package_fg)'

		[perl]
		format = '[\[$symbol($version)\]](package_fg)'

		[php]
		format = '[\[$symbol($version)\]](package_fg)'

		[pijul_channel]
		format = '[\[$symbol$channel\]](package_fg)'

		[pulumi]
		format = '[\[$symbol$stack\]](package_fg)'

		[purescript]
		format = '[\[$symbol($version)\]](package_fg)'

		[python]
		symbol = ' '
		format = '[\[${symbol}${pyenv_prefix}(${version})(\($virtualenv\))\]](package_fg)'

		[raku]
		format = '[\[$symbol($version-$vm_version)\]](package_fg)'

		[red]
		format = '[\[$symbol($version)\]](package_fg)'

		[ruby]
		format = '[\[$symbol($version)\]](package_fg)'

		[rust]
		format = '[\[$symbol($version)\]](package_fg)'

		[scala]
		format = '[\[$symbol($version)\]](package_fg)'

		[solidity]
		format = '[\[$symbol($version)\]](package_fg)'

		[spack]
		format = '[\[$symbol$environment\]](package_fg)'

		[swift]
		format = '[\[$symbol($version)\]](package_fg)'

		[terraform]
		format = '[\[$symbol$workspace\]](package_fg)'

		[vagrant]
		format = '[\[$symbol($version)\]](package_fg)'

		[vlang]
		format = '[\[$symbol($version)\]](package_fg)'

		[zig]
		format = '[\[$symbol($version)\]](package_fg)'


		# package.disabled = true;
	}

	};
  };


  # services.service here and beyond
}
