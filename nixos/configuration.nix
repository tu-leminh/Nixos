{ config, pkgs, ... }:
{
	imports =
		[ 
		./hardware-configuration.nix
		];
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	networking.hostName = "dell"; 
	networking.networkmanager.enable = true;
	time.timeZone = "Asia/Ho_Chi_Minh";
	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "vi_VN";
		LC_IDENTIFICATION = "vi_VN";
		LC_MEASUREMENT = "vi_VN";
		LC_MONETARY = "vi_VN";
		LC_NAME = "vi_VN";
		LC_NUMERIC = "vi_VN";
		LC_PAPER = "vi_VN";
		LC_TELEPHONE = "vi_VN";
		LC_TIME = "vi_VN";
	};
	services.xserver.enable = true;
	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};
	services.printing.enable = true;
	hardware.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};
	services.openssh.enable = true;
	networking.firewall.enable = false;
	users.users.mt = {
		isNormalUser = true;
		description = "mt";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [
		];
	};
	programs.firefox.enable = true;
	nixpkgs.config.allowUnfree = true;
	environment.systemPackages = with pkgs; [
		neovim
		git
		wget
		curl
		htop
		ranger
	];
	system.stateVersion = "24.05";
	nix.settings.experimental-features = ["nix-command" "flakes"];
}
