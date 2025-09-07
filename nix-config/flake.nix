{
  description = "config";
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-25.05";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
      vars = {
        username = "cj";
        homeDirectory = if pkgs.stdenv.isDarwin
          then "/Users/${vars.username}"
          else "/home/${vars.username}";
        dotfiles = "${vars.homeDirectory}/Documents/apps/dotfiles/dots";
        dotfilesConfig = "${vars.dotfiles}/.config";
      };
    in {
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
