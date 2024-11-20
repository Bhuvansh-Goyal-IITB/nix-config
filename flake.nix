{
  description = "Flake for my system packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = {
          default = pkgs.callPackage ./. { };
          systemPackages = pkgs.callPackage ./system-pkgs.nix { inherit pkgs; };
        };

        devShells = {
          default = pkgs.callPackage ./shell.nix { inherit pkgs; };
        };
      }
    );
}
