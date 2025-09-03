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
  outputs = { self, nixpkgs, home-manager, builtins, ... }:
    let
      system = builtins.currentSystem;
      pkgs = nixpkgs.legacyPackages.${system};
      vars = {
        username = "cj";
        homeDirectory = if pkgs.stdenv.isDarwin
          then "/Users/${vars.username}"
          else "/home/${vars.username}";
      };
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
