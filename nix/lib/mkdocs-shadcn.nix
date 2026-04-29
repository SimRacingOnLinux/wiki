{ pkgs }:
pkgs.python3Packages.buildPythonPackage {
  pname = "mkdocs-shadcn";
  version = "0.10.5";
  pyproject = true;

  src = pkgs.fetchurl {
    url = "https://files.pythonhosted.org/packages/30/00/d61ffdc6e0099890f82a42e4850f153a86689aa6dd801a89361ec9a409c8/mkdocs_shadcn-0.10.5.tar.gz";
    sha256 = "8ed1e230622920d8bd1c2de1e39c5151dfb86f14ef392ea285142d6d2ffce36e";
  };

  build-system = [ pkgs.python3Packages.hatchling ];

  dependencies = with pkgs.python3Packages; [
    bottle
    gitpython
    mkdocs
    pymdown-extensions
  ];
}
