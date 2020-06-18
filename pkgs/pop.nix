{ stdenv, fetchFromGitHub, nodejs, nodePackages, glib }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-popshell";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "pop-os";
    repo = "shell";
    rev = "master_focal";
    sha256 = "1ygqzmvh6fjl1yc9rxb9mmis7ywaxqfnx6hn3clhl4y3vv5f19gn";
  };

  nativeBuildInputs = [ nodePackages.typescript glib ];

  makeFlags = ["INSTALLBASE=$(out)/share/gnome-shell/extensions"];
}

