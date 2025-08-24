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
        myUsername = "cj";
      };
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
    in
    {
      homeConfigurations."${vars.myUsername}" = home-manager.lib.homeManagerConfiguration {
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
