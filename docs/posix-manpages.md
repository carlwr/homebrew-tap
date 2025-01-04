# `posix-manpages`

_Man pages for `POSIX.1-2017` shell utils, library functions and system headers_

## Install

```sh
# add the tap and install the formula:
brew install carlwr/tap/posix-manpages

# ...also include man pages for .h header files (section (0)):
brew install --with-0p carlwr/tap/posix-manpages
```

By default, man pages for man-section `(1)` are installed. That can be changed by adding any combination of the following options to the `brew install` command:
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
