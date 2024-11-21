{ config, lib, pkgs, ... }:
let
proxy="http://tulm9:EprSu3WQq5%402024@10.205.0.150:8080/";
in
{
	imports = [
		<nixos-wsl/modules>
	];
	networking.proxy.httpProxy = proxy;
	networking.proxy.httpsProxy = proxy;
	environment.variables =
	{
		HTTP_PROXY = proxy;
		http_proxy = proxy;
		https_proxy = proxy;
		HTTPS_proxy = proxy;
	};
	wsl.enable = true;
	wsl.defaultUser = "mt";
	users.users.mt = 
	{
		isNormalUser = true;
		description = "mt";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; 
		[
		];
		shell = pkgs.fish;
	};
	environment.systemPackages = with pkgs; 
	[
		neovim
		git
		wget
		curl
		htop
		ranger
		kubectl
		kubernetes
		fish
		helix
	];
	programs.neovim =
	{
		enable = true;
		defaultEditor = true;
	};
	programs.fish.enable = true;
	system.stateVersion = "24.05";
}