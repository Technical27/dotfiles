{ stdenv, lib, fetchFromGitLab, qt5, libusb, pkgconfig, makeWrapper }:

stdenv.mkDerivation rec {
  name = "OpenRGB";
  src = fetchFromGitLab {
    repo = "OpenRGB";
    owner = "CalcProgrammer1";
    rev = "release_0.2";
    sha256 = "0b1mkp4ca4gdzk020kp6dkd3i9a13h4ikrn3417zscsvv5y9kv0s";
  };
  nativeBuildInputs = [ qt5.qmake pkgconfig makeWrapper ];
  buildInputs = [ qt5.qtbase libusb ];
  buildPhase = ''
    mkdir -p $out
    cd $out
    qmake ${src}/OpenRGB.pro
    make
  '';
  installPhase =''
    cd $out
    rm *.o Makefile *.cpp *.h
    mkdir -p $out/bin
    mv $out/OpenRGB $out/bin
    wrapProgram $out/bin/OpenRGB \
      --prefix QT_PLUGIN_PATH : ${qt5.qtbase}/${qt5.qtbase.qtPluginPrefix}
  '';
}
