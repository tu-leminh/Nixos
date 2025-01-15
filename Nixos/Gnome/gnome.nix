{
	inputs,
	outputs,
	lib,
	config,
	pkgs,
	...
}:
let
in
{
	services.xserver = {
		enable = true;
		displayManager.gdm.enable = true;
		displayManager.gdm.wayland = true;
		desktopManager.gnome.enable = true;
	};
}
