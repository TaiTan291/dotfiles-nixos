#home manager
{ config, lib, pkgs, ...}:

{
	home = {
		username = "taitan";
		homeDirectory = "/home/taitan";
		packages = with pkgs; [
			home-manager
			bat
			bottom
			exa
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
		./wayland
		./git,nix
	];

	programs.home-manager.enable = true; # home-manager
}
