{ config, pkgs, vars, ... }:
{
  home = {
    stateVersion = "25.05";
    username = "${vars.username}";
    homeDirectory = "${vars.homeDirectory}";
    file = {
      "test" = {
        source = config.lib.file.mkOutOfStoreSymlink "${vars.homeDirectory}/Documents/test";
      };
    };
    sessionVariables = {};
    packages = with pkgs; [
      cowsay
    ];
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
      allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [];
      permittedInsecurePackages = [];
    };
  };
}
