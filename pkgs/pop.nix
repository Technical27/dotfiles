{ stdenv, fetchFromGitHub, nodejs, nodePackages, glib }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-popshell";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "pop-os";
    repo = "shell";
    rev = "master_focal";
    sha256 = "0f1svpd8k8b7ggvgfsfwvsix9y9jjcfxw4plk9m781r9zp9q8ds5";
  };

  nativeBuildInputs = [ nodePackages.typescript glib ];

  makeFlags = ["INSTALLBASE=$(out)/share/gnome-shell/extensions"];
}

