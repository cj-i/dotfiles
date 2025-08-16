{ config, pkgs, vars, ... }:
{
  home.username = "${vars.myUsername}";
  home.homeDirectory = if pkgs.stdenv.isDarwin
    then "/Users/cj"
    else "/home/${vars.myUsername}";
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
