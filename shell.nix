{ pkgs }: pkgs.mkShell
{
  buildInputs = with pkgs; [
    taplo
    stylua
    lua-language-server
    nodePackages_latest.bash-language-server
  ];
}

