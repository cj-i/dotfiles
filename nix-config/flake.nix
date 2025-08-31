{
  description = "system configuration";
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, ... }:
    let
      vars = {
        username = "cj";
        homeDirectory = if pkgs.stdenv.isDarwin
          then "/Users/${vars.username}"
          else "/home/${vars.username}";
      };
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      homeConfigurations."${vars.username}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
        ];
        extraSpecialArgs = {
          inherit vars;
        };
      };
    };
}
