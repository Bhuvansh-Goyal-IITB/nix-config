{ stdenv
}: stdenv.mkDerivation {
  name = "installer";
  src = ./.;
  buildPhase = ''
    		mkdir -p $out/bin
    		cp ./installer.sh $out/bin/installer 
    		chmod +x $out/bin/installer
    	'';
  installPhase = '''';
}
