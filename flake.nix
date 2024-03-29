{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... }@inputs:
  #let
  #  system = "x86_64-linux";
  #  pkgs = nixpkgs.legacyPackages.${system};
  #in
  {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/b3rrypi/configuration.nix
        ./nixosModules
        inputs.home-manager.nixosModules.default
      ];
    };
    homeManagerModules.default = ./homeManagerModules;
  };
}
