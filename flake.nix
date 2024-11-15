{
  description = "Flake for my system packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      {
        packages = {
          default = pkgs.callPackage ./. { };
          systemPackages = pkgs.buildEnv {
            name = "System Packages";
            paths = with pkgs; [
              helix
              direnv
              nix-direnv
              nixpkgs-fmt
              nil
              zsh
              zsh-autosuggestions
              zsh-syntax-highlighting
              zsh-fzf-tab
              zellij
              stow
              starship
              zoxide
              fzf
              eza
              bat
              texliveFull
              neovim
            ];
          };
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
