#!/bin/bash
# (c) 2010, givt
#
# HELP: file-with-80chars-line.sh [PATH to scaned dir]
#
# OUTPUT:
# file name | line | string

function main () {
    local files=(c h sh pl elg lua)
    for i in ${files[@]}; do 
        find ${fdir} -iname $"*.${i}" -exec grep -rnH '.\{80,\}' {} \;|\
            awk -F: '{printf "%-40s ( line %-5s) %s\n", $1, $2, $3}'
    done
}

# HERE

if [[ $# -eq 0 ]]; then
    fdir=${PWD}
else
    fdir=${1}
fi

main|sort -nr

