# Contributing to this wiki

This site is built with [MkDocs](https://www.mkdocs.org/) and published via GitHub Pages.

## Local development

Install the dependency:

```bash
python -m pip install -r requirements.txt
```

Run the local dev server:

```bash
mkdocs serve
```

Build the static site:

```bash
mkdocs build
```

## Nix

A Nix flake is provided for a fully reproducible development environment.

Enter the development shell:

```bash
nix develop
```

This makes `mkdocs` available. From there, use the same commands as above.

Serve the site with a single command (no shell entry needed):

```bash
nix run .#serve
```

Build the static site as a Nix derivation:

```bash
nix build
```

The output is symlinked to `./result`.
