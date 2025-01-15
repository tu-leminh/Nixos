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
	programs.hyprland.enable = true;
	programs.waybar.enable = true;
	environment.systemPackages = [
		pkgs.kitty
		pkgs.wofi
	];
	environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
