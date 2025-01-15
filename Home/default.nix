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
	];
	# home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
	home.file.".config/i3/config".source = ./i3.conf;
	# Minimal
	home = {
		username = "mt";
		homeDirectory = "/home/mt";
	};
	programs.home-manager.enable = true;
	systemd.user.startServices = "sd-switch";
	home.stateVersion = "24.05";
}
