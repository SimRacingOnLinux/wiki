{ pkgs, inputs, ... }:
let
  pythonEnv = import ../lib/python-env.nix { inherit pkgs inputs; };
in
pkgs.mkShell {
  packages = [ pythonEnv pkgs.uv ];

  shellHook = ''
    echo "MkDocs environment ready."
    echo "Preview: mkdocs serve"
    echo "Build:   mkdocs build"
  '';
}
