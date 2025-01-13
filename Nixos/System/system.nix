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
# System
	nixpkgs.config.allowUnfree = true;
	nix.settings.experimental-features = ["nix-command" "flakes"];


# Boot settings
	boot = {
		loader = {
			systemd-boot.enable = true;
			systemd-boot.editor = false;
			efi.canTouchEfiVariables = true;
			timeout = 0;
		};
	};

# Set up locales (timezone and keyboard layout)
	time.timeZone = "Asia/Ho_Chi_Minh";
	i18n.defaultLocale = "en_US.UTF-8";

# Set up user and enable sudo
	users.users.mt = {
		isNormalUser = true;
		extraGroups = [ "input" "wheel" "networkmanager"];
		shell = pkgs.zsh;
	};

# Set up networking and secure it
	networking = {
		networkmanager.enable = true;
		hostName = "dell";
		wireless.iwd.enable = true;
		firewall = {
			enable = false;
		};
	};

# Set environment variables
	environment.variables = {
	};


# Sound and bluetooth
	sound = {
		enable = true;
	};

	security.rtkit.enable = true;

	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	hardware = {
		bluetooth.enable = true;
		pulseaudio.enable = false;
	};
}
