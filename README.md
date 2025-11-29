# Homebrew tap `carlwr/tap`

[![brew test-bot](https://github.com/carlwr/homebrew-tap/actions/workflows/tests.yml/badge.svg)](https://github.com/carlwr/homebrew-tap/actions/workflows/tests.yml)
<br>


## In this tap

`posix-manpages`

* _Manpages for `POSIX.1‐2017` shell utils, library functions and system headers_
* readme: [docs/posix-manpages.md](docs/posix-manpages.md)
* install command: `brew install carlwr/tap/posix-manpages`

`gnu-make-manual-manpage`

* _The full GNU Make Manual as a man page (make-manual(7))_
* readme: [docs/gnu-make-manual-manpage.md](docs/gnu-make-manual-manpage.md)
* install command: `brew install carlwr/tap/gnu-make-manual-manpage`


## Repo layout

For each `<formula>` in this repo (= in this tap):

* readme: `${REPO_ROOT}/docs/<formula>.md` `|` repo: `...`
* install command: `brew install carlwr/tap/<formula>`


## Useful commands

```sh
# run tests for an installed formula:
brew test carlwr/tap/<formula>

# remove the tap:
brew untap carlwr/tap
```

### Install a formula from a bare `.rb` file

Homebrew no longer accepts `brew install dir/myFormula.rb`; a formula must be in a tap to be installable.

The following `zsh` function provides a workaround. It takes a formula `.rb` file and adds it to brew's worktree of some specified tap - i.e. this tap is used as a surrogate for the formula.

```sh

# requires zsh - won't work with bash

worktreeInstall() {
  # usage: $0 some/path/myFormula.rb
  #
  # Copy the formula file into brew's tap repo worktree and install.
  # If already installed, uninstall it first.

  emulate -RL zsh -u -o err_return
  local rb_from=${1}            # "some/path/myFormula.rb"
  local formula=${1:r:t}        # "myFormula"
  local withtap=carlwr/tap      # <- the surrogate tap
  local taprepo=$(brew --repo ${withtap})
  local rb_targ=${taprepo}/Formula/${formula}.rb

  die() { echo "ERR: $1"; return 1; }

  [[ $PWD != $HOMEBREW_PREFIX/* ]] || die "PWD in brew's repo"
  [[ -e ${rb_from}              ]] || die "no such file"

  cp -iv ${rb_from} ${rb_targ}
  brew uninstall --force ${withtap}/${formula}
  brew   install         ${withtap}/${formula}
  echo
  echo "created file: ${rb_targ}"
  echo "to uninstall and delete the created worktree file, run:"
  echo
  echo "  brew uninstall ${formula}"
  echo "  ( cd \$(brew --repo ${withtap})"
  echo "    git clean --force -- ./Formula/${formula}.rb"
  echo "    git status -s"
  echo "  )"
  }


# Example use:
worktreeInstall ./dir/thing.rb  # install
brew list | grep thing          # verify installed
brew test carlwr/tap/thing      # run formula tests

```
