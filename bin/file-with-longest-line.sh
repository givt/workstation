#!/bin/bash
# (c) 2010, givt
#
# HELP: file-with-longest-line.sh [PATH to scaned dir]
#
# Example (combinations):
    # $ file-with-longest-line.sh|column
    # $ file-with-longest-line.sh|head -20
    # $ file-with-longest-line.sh|head -20|cat -n

function main () {
    local files=(c h sh pl elg lua)
    for i in ${files[@]}; do 
        find ${fdir} -iname $"*.${i}" -exec wc -L  {} \;
    done
}

# HERE

if [[ $# -eq 0 ]]; then
    fdir=${PWD}
else
    fdir=${1}
fi

main|sort -nr

