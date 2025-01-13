{
	description = "Your new nix config";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
		home-manager.url = "github:nix-community/home-manager/release-23.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = {
		self,
		nixpkgs,
		home-manager,
		...
	} @ inputs: let
	inherit (self) outputs;
	in {
		nixosConfigurations = {
			dell = nixpkgs.lib.nixosSystem {
				specialArgs = {inherit inputs outputs;};
				modules = [./Nixos/default.nix];
			};
		};
		homeConfigurations = {
			"mt@dell" = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.x86_64-linux;
				extraSpecialArgs = {inherit inputs outputs;};
				modules = [./Home/default.nix];
			};
		};
	};
}
