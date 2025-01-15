{
	inputs,
	lib,
	config,
	pkgs,
	...
}
:
{
	home.file =
	{
		".config/i3/config".source = ./i3.conf;
		".config/polybar/config".source = ./polybar.conf;
		".config/polybar/system-bluetooth-bluetoothctl.sh" =
		{
			source = ./bluetooth.sh;
			executable  = true;
		};
		".config/polybar/pipewire-simple.sh" =
		{
			source = ./pipewire.sh;
			executable  = true;
		};
	};
}
