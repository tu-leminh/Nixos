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
	]
        programs.kitty.enable = true; # required for the default Hyprland config
        wayland.windowManager.hyprland.enable = true; # enable Hyprland
        home.sessionVariables.NIXOS_OZONE_WL = "1";
	# Minimal
	home = {
		username = "mt";
		homeDirectory = "/home/mt";
	};
	programs.home-manager.enable = true;
	systemd.user.startServices = "sd-switch";
	home.stateVersion = "24.05";
}
