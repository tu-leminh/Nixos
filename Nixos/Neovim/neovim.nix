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
	programs.neovim =
	{
		enable = true;
		defaultEditor = true;
	};
}
