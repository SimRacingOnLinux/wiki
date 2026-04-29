{ pkgs, ... }:
let
  mkdocsShadcn = import ../lib/mkdocs-shadcn.nix { inherit pkgs; };
  pythonEnv = pkgs.python3.withPackages (ps: [
    ps.mkdocs
    ps.mkdocs-awesome-nav
    mkdocsShadcn
  ]);
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
