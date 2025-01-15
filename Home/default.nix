{
	inputs,
	lib,
	config,
	pkgs,
	...
}
:
{
	imports = [
	./i3/i3.nix
	];
	# home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
	# Minimal
	home = {
		username = "mt";
		homeDirectory = "/home/mt";
	};
	programs.home-manager.enable = true;
	systemd.user.startServices = "sd-switch";
	home.stateVersion = "24.05";
}
