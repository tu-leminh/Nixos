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
	# Minimal
	home = {
		username = "mt";
		homeDirectory = "/home/mt";
	};
	programs.home-manager.enable = true;
	systemd.user.startServices = "sd-switch";
	home.stateVersion = "24.05";
}
