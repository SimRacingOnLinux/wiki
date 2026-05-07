{ pkgs, ... }:
pkgs.writeShellApplication {
  name = "treefmt";
  runtimeInputs = [
    pkgs.treefmt
    pkgs.prettier
    pkgs.nixfmt
    pkgs.markdownlint-cli
  ];
  text = ''
    exec treefmt "$@"
  '';
}
