# `gnu-make-manual-manpage`

_The full [GNU Make Manual] as a man page `make-manual(7)`_

This formula makes the _[GNU Make Manual]_ available as an installed man page. The man page has the same contents as that of the [online html manual].

The formula creates the man page by fetching the official GNU make tarball which includes the _Texinfo_ source-of-truth manual contents file. (This is the same file that the html manual is generated from.) It then uses the [texi2mdoc] tool to convert to a `mdoc(7)` man page.

## Install

```sh
# add the tap and install the formula:
brew install carlwr/tap/gnu-make-manual-manpage

# verify:
man -w make-manual
  # /opt/homebrew/share/man/man7/make-manual.7
```

## Use

```sh
man make-manual
```

[GNU Make Manual]: https://www.gnu.org/software/make/manual
[online html manual]: https://www.gnu.org/software/make/manual/html_node/index.html
[texi2mdoc]: https://mandoc.bsd.lv/texi2mdoc/
