{ pkgs, ... }:
let
  mkdocsShadcn = import ../../lib/mkdocs-shadcn.nix { inherit pkgs; };
  pythonEnv = pkgs.python3.withPackages (ps: [
    ps.mkdocs
    ps.mkdocs-awesome-nav
    mkdocsShadcn
  ]);
in
pkgs.writeShellScriptBin "serve" ''
  exec ${pythonEnv}/bin/mkdocs serve --dev-addr 127.0.0.1:8000
''
