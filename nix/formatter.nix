{ pkgs, ... }:
pkgs.writeShellApplication {
  name = "treefmt";
  runtimeInputs = [
    pkgs.treefmt
    pkgs.prettier
    pkgs.nixfmt
  ];
  text = ''
    exec treefmt "$@"
  '';
}
