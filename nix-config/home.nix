{ config, pkgs, vars, ... }:
{
  home = {
    stateVersion = "25.05";
    username = "${vars.username}";
    homeDirectory = "${vars.homeDirectory}";
    packages = with pkgs; [
      cowsay
      discord
      arc-browser
    ];

    file = {
      "test" = {
        source = config.lib.file.mkOutOfStoreSymlink "${vars.homeDirectory}/Documents/test";
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
        "discord"
        "arc-browser"
      ];
      permittedInsecurePackages = [
        "arc-browser-1.109.0-67185"
      ];
    };
  };
}
