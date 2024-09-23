#!/bin/bash

# This script will make it easier to show the results of freebody code in markdown
# right now it only works for 2d diagrams
# It is invoked inside a markdown file with
# ```asy2htmlout.sh {cmd=true, output=html}
# [asy code here]
# ```
# It has been tested in vscode with [Markdown Preview Enhanced](https://shd101wyy.github.io/markdown-preview-enhanced/#/)

cd /Users/jmankoff/Research/nonvisual/freebody

# Check if the Asymptote file is passed as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 : <filename>"
  exit 1
fi

# Output Asymptote file to stdout in HTML format
asy -v -f html "$1" 

modified_path=$(echo "$1" | sed 's|/Users/jmankoff/Downloads/||')

cat "/Users/jmankoff/Research/nonvisual/freebody/$modified_path.html"

