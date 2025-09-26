{ stdenv, lib }:

stdenv.mkDerivation rec {
  pname = "my-sddm-theme";
  version = "1.0";
  src = ./sddm/neontown;
  dontBuild = true;
  installPhase = ''
    mkdir -p $out/share/sddm/themes/neontown
    cp -aR $src/* $out/share/sddm/themese/neontown/
  '';
}
