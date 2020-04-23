import docopt
import strutils
import os

# see: http://docopt.org/
let doc = """
Useful touch -- UT
Creates directories and files in a single command.

Usage:
  at (-h | --help)
  at --version
  at [(-c|--change-dir)] <files>...

Options:
  -h --help        Show this screen.
  --version        Show version.
  -c --change-dir  change directory after each creation.
"""

proc makePaths(input: string, doChDir: bool) =
  let (parent, child) = os.splitPath(input)

  if not parent.isEmptyOrWhitespace() and not os.fileExists(parent):
    os.createDir(parent)
  
  if not child.isEmptyOrWhitespace() and not os.fileExists(input):
    # 'touch' the file.
    let f = open(input, fmAppend)
    defer: f.close()

  # finally, change directories if requested. We don't
  # do this above because 
  if not parent.isEmptyOrWhitespace and doChDir:
    os.setCurrentDir(parent)

when isMainModule:
  let args = docopt(doc, version="1.0.0")
  let doChDir = args.contains("--change-dir")
  for filepath in @(args["<files>"]):
    makePaths(filepath, doChDir)