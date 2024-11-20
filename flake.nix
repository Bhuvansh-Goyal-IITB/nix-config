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
        systemPackages = import ./system-pkgs.nix { inherit pkgs; };
      in
      {
        packages = {
          default = pkgs.callPackage ./. { };
          systemPackages = systemPackages;
        };

        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              taplo
              lua-language-server
              nodePackages_latest.bash-language-server
            ];
          };
        };
      }
    );
}
