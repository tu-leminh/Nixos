{
	description = "NixOS configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = inputs@{ nixpkgs, home-manager, ... }: {
		nixosConfigurations = {
			dell = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./Nixos/default.nix
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.mt = import ./Home/default.nix;
					}
				];
			};
		};
	};
}
