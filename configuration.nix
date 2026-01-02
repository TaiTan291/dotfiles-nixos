# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, inputs, lib, pkgs, ... }:

{
	imports =[
		# Include the results of the hardware scan.
		./hardware-configuration.nix
	];


  	# Select internationalisation properties.
	i18n = {
		defaultLocale = "ja_JP.UTF-8";
		extraLocaleSettings ={
			LC_MESSAGES = "ja_JP.UTF-8";
			LC_TIME= "ja_JP.UTF-8";
		};
		inputMethod = {
			enable = true;
			type = "fcitx5";
			fcitx5.addons = with pkgs; [
				fcitx5-skk
				kdePackages.fcitx5-configtool
			];
		};
	};
	services.xserver = {
		enable = true;
		xkb ={
			layout = "jp";
			variant = "106";
			options = "ctrl:nocaps";
		};
	};

	#font	
	fonts = {
		packages = with pkgs; [
			noto-fonts-cjk-serif
			noto-fonts-cjk-sans
		];
		fontDir.enable = true;
		fontconfig = {
			defaultFonts = {
				serif = ["Noto Serif CJK JP" "Noto Color Emoji"];
				sansSerif = ["Noto Sans CJK JP" "Noto Color Emoji"];
			};

		};
	};

	console = {
		font = "Lat2-Terminus16";
		useXkbConfig = true; # use xkb.options in tty.
  	};

	# Add auser!
	users.users.taitan = {
		isNormalUser = true;
		description = "taitan";
		extraGroups = [
			"wheel"
			"networkmanager"
		];
		shell = pkgs.bash;
		home = "/home/taitan";
	};

	# GRUB
	boot.loader = {
		efi = {
			canTouchEfiVariables = true;
			efiSysMountPoint = "/boot";
		};
		grub = {
			enable = true;
			efiSupport = true;
			device = "nodev";
			useOSProber = true;
		};
	};

	# Hyprland
	programs.hyprland = {
		enable = true;
		package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
		portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
	};
	
	# NetworkManager
	networking.networkmanager.enable = true;

	#browser
	programs = {
		firefox.enable = true;
		#google-chrome.enable = true;
	};

	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
	#Installan ediotr to edit the configuration
		
		# GUI( Hyprland )
		kitty
		waybar
		hyprshot
		wofi
		dunst
		playerctl
		brightnessctl
		##dolphin( File Manager )
		kdePackages.qtsvg
		kdePackages.kio
		kdePackages.kio-fuse
		kdePackages.kio-extras
		kdePackages.dolphin

		#develpment
		git
		wget

		##editor
		neovim
		emacs
		
		## dependence
		deno # denops.vim

		##rust
		rustc # compiler
		cargo # package manager
		rustfmt # code format
		clippy # code linter
		
		#other
		os-prober
	];


  networking.hostName = "nixos"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  ##
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

}

