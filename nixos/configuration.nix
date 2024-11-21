{ config, lib, pkgs, ... }:
let
        proxy="http://tulm9:EprSu3WQq5%402024@10.205.0.150:8080/";
in
{
  imports = [
    # include NixOS-WSL modules
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
  wsl.defaultUser = "nixos";
  system.stateVersion = "24.05";
}


