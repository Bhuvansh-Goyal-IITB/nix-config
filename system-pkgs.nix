{ pkgs }: pkgs.buildEnv {
  name = "System Packages";
  paths = with pkgs; [
    neovim
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
    ripgrep
    texliveFull
  ];
}
