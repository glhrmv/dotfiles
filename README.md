# dotfiles

These are my dotfiles. I'll have an install script here, eventually.
I'm not very good at this yet.

# import_dotfiles.sh

Run `/.import_dotfiles.sh` to copy updated dotfiles into this repo.

## homebrew

To install the formulae in the `Brewfile`, run `brew bundle install`.
Use `brew bundle dump` to dump installed formulae into a `Brewfile`.

## vim

The `.vimrc` file should automatically download
[`vim-plug`](https://github.com/junegunn/vim-plug/)
and install the listed plugins.

## node

The `node/` folder contains 2 little bash scripts:
`npm_export.sh` and `npm_import.sh`.

To export your globally installed NPM packages into a text file, do
```
./npm_export.sh
```
To globally install NPM packages listed in a text file, do
```
./npm_import.sh
```
