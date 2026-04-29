{ pkgs, inputs, ... }:
let
  pythonEnv = import ../../lib/python-env.nix { inherit pkgs inputs; };
in
pkgs.writeShellScriptBin "serve" ''
  exec ${pythonEnv}/bin/mkdocs serve --dev-addr 0.0.0.0:8000 --livereload
''
