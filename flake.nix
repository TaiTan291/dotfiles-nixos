{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		hyprland.url = "github:hyprwm/Hyprland";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};


	outputs = {nixpkgs, home-manager, ...} @ inputs: {
		nixosConfigurations.taitan = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = { inherit inputs; };
			modules = [
				./configuration.nix
			];
		};
		homeConfigurations.myHome = inputs.home-manager.lib.homeManagerConfiguration {
			pkgs = import inputs.nixpkgs {
				system = "x86_64-linux";
				config.allowUnfree = true;
			};
			extraSpecialArgs = {
				inherit inputs;
			};
			modules = [
				./home.nix
			];
		};
	
	};
}
