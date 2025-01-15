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
  environment.pathsToLink = [ "/libexec" ];
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
        defaultSession = "none+i3";
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        rofi
	kitty
	i3status
	i3lock
     ];
    };
  };
}
