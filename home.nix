#home manager
{ config, lib, pkgs, ...}:

{
	home = {
		stateVersion = "25.11";
		username = "taitan";
		homeDirectory = "/home/taitan";
		packages = with pkgs; [
			#home-manager
			bat
			bottom
			httpie
			pingu
			ripgrep
			
			typst
			tinymist

			#user app
			discord
			discord-ptb
			slack
 		];
	};

	imports = [
		./hyprland.nix
		./waybar.nix
		./git.nix
		./fcitx5.nix
	];
	programs.home-manager.enable = true; # home-manager
}
