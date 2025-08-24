{ config, pkgs, vars, ... }:
{
  home = {
    stateVersion = "25.05";
    username = "${vars.myUsername}";
    homeDirectory = if pkgs.stdenv.isDarwin
      then "/Users/${vars.myUsername}"
      else "/home/${vars.myUsername}";

    packages = with pkgs; [
      arc-browser
      cowsay
      discord
    ];

    file = {
      "test" = {
        source = config.lib.file.mkOutOfStoreSymlink "/Users/${vars.myUsername}/Documents/test";
      };
    };

    sessionVariables = {};
  };

  programs = {
    home-manager = {
      enable = true;
    };
    bash = {
      enable = false;
    };
  };

  nixpkgs = {
    config = {
      allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
        "arc-browser"
        "discord"
      ];
      permittedInsecurePackages = [
        "arc-browser-1.106.0-66192"
      ];
    };
  };
}
