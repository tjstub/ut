# UT - Useful Touch

## Description

`ut` Allows for the fast creation of files and directories in line with the 
vim plugin AdvancedNewFile.

## Build and Install

The tool is built using Nim and Nimble. [Install Nim](https://nim-lang.org/install.html), then run:

```sh
nimble install
```

## Examples

create muliple directories, at once!

```sh
$ ut foo/bar/baz/ /baz/foo
```

Create files. Anything that doesn't end with a path separator is considered a file.

```sh
$ ut foo/bar/bazz.txt
```

You can also tell `ut` to change directories while it creates new ones.

```sh
# creates foo/bar/bazz/foo.nim
$ ut -c foo/bar/ bazz/foo.nim
```

## TODO

* Support templates for files of known type.
* Add more touch-like features, if ever needed.
