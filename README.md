# HC2 support for Zed

Syntax highlighting for `.hc2` files.

The tree-sitter grammar lives in
[tree-sitter-hc2](https://github.com/hc2lang/tree-sitter-hc2). Zed fetches
`rev` from that repo, compiles `src/parser.c` to wasm itself, and drops its
build output in `grammars/` (gitignored).

## Installing

1. `cmd-shift-P` → `zed: install dev extension`
2. Pick this directory.
3. Zed clones tree-sitter-hc2 at `rev` and compiles the parser. Takes a few
   seconds on first install.
4. Open a `.hc2` file.

Zed symlinks this directory into `~/Library/Application Support/Zed/extensions/installed/hc2`,
so it tracks the checkout in place — no need to reinstall after every edit.
Moving or deleting this directory leaves that symlink dangling; remove it and
reinstall from the new path.

After editing `languages/hc2/*` (queries, `config.toml`), `zed: reload extensions`
is enough — the grammar is not rebuilt. Changing `rev` needs a reinstall.

## Updating the grammar

Push the change to tree-sitter-hc2, set `rev` in `extension.toml` to that
commit, and reinstall the dev extension.

To iterate without pushing, temporarily set `repository` to a `file://` path
of a local tree-sitter-hc2 checkout and `rev` to a local commit; restore the
GitHub URL before committing.
