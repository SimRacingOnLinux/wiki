# Contributing to this wiki

This site is built with [MkDocs](https://www.mkdocs.org/) and published via GitHub Pages.

## Local development

Dependencies are managed with [uv](https://docs.astral.sh/uv/). Install it, then run:

```bash
uv run mkdocs serve
```

To build the static site:

```bash
uv run mkdocs build
```

To add or update dependencies, edit `pyproject.toml` then run `uv lock`.

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
