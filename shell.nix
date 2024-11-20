{ pkgs }: pkgs.mkShell
{
  buildInputs = with pkgs; [
    taplo
    lua-language-server
    nodePackages_latest.bash-language-server
  ];
}

