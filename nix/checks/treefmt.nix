{ pkgs, ... }:
pkgs.runCommandLocal "treefmt"
  {
    nativeBuildInputs = [
      pkgs.treefmt
      pkgs.prettier
      pkgs.nixfmt
    ];
  }
  ''
    cp -r ${pkgs.lib.cleanSource ../..}/. src
    chmod -R +w src
    cd src
    treefmt --fail-on-change --no-cache --tree-root .
    touch $out
  ''
