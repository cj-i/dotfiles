{ config, pkgs, vars, ... }:
{
  home = {
    stateVersion = "25.05";
    username = "${vars.username}";
    homeDirectory = "${vars.homeDirectory}";
    enableNixpkgsReleaseCheck = true;
    sessionVariables = {};
    packages = with pkgs; [];
    # file = {
    #   ".config" = {
    #     source = config.lib.file.mkOutOfStoreSymlink "${vars.dotfilesConfig}";
    #   };
    #   ".zshenv" = {
    #     source = config.lib.file.mkOutOfStoreSymlink "${vars.dotfilesConfig}/zsh/.zshenv";
    #   };
    # };
  };

  programs = {
    home-manager = {
      enable = true;
    };
    zsh = {
      enable = false;
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
