
# `posix-manpages`

[![brew test-bot](https://github.com/carlwr/homebrew-tap/actions/workflows/tests.yml/badge.svg)](https://github.com/carlwr/homebrew-tap/actions/workflows/tests.yml)

## Install

```sh
# add the tap and install the formula:
brew install carlwr/tap/posix-manpages

# ...also include man pages for .h header files (section (0)):
brew install --with-0p carlwr/tap/posix-manpages
```

Only man pages for section (1) are installed by default. To override, add any combination of the following CLI optionsrun to the `brew install` command:
* `--with-0p`
* `--without-1p`
* `--with-3p`

## Use

Man pages are installed with a `posix-` prefix. Example commands:
```sh
# view the POSIX man page for find(1):
man posix-find

# view the POSIX man page for assert.h:
MANSECT=0 man posix-assert.h
```

## Misc. commands

```sh
# remove the tap:
brew untap carlwr/tap

# clone repo + install as a local formula:
git clone https://github.com/carlwr/homebrew-tap
cd homebrew-tap
brew install --formula Formula/posix-manpages.rb
```

