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
  services.displayManager.defaultSession = "none+i3";
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        rofi
	polybar
     ];
    };
  };
}
