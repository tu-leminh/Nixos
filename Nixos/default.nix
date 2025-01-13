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
	imports =
		[ 
		./Hardware/hardware-configuration.nix
		./System/system.nix
		./Gnome/gnome.nix
		./Neovim/neovim.nix
		./Zsh/zsh.nix
		#./Hyprland/hyprland.nix
		];
	environment.systemPackages = with pkgs; 
	[
		git
		wget
		curl
		htop
		ranger
		tmux
		vmware-horizon-client
		microsoft-edge
		rofi
	];
	system.stateVersion = "24.05";
}
