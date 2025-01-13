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
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestions.enable = true;
		syntaxHighlighting.enable = true;
		shellAliases = {
			nix-rebuild = "sudo nixos-rebuild switch --flake /home/mt/Nixos#dell --upgrade";
			nix-edit = "nvim /home/mt/Nixos";
		};
	};
}
