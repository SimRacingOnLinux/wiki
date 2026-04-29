{ pkgs, inputs, ... }:
let
  pythonEnv = import ../lib/python-env.nix { inherit pkgs inputs; };
in
pkgs.stdenvNoCC.mkDerivation {
  pname = "srol-wiki-site";
  version = "0.1.0";
  src = ../..;

  nativeBuildInputs = [ pythonEnv ];

  buildPhase = ''
    mkdir -p "$TMPDIR/home"
    export HOME="$TMPDIR/home"
    mkdocs build --strict --site-dir site
  '';

  installPhase = ''
    mkdir -p "$out"
    cp -r site/* "$out"/
  '';
}
