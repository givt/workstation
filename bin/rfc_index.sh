#!/bin/bash
# (C) 2010, givt

if [[ $# -gt 0 ]]; then
    echo "run: $(basename ${0})"
    exit 1;
fi

dir=~/.rfc
file=rfc-index.txt
url=ftp://ftp.rfc-editor.org/in-notes/${file}

mkdir -p ${dir}  > /dev/null 2>&1
pushd ${dir}  > /dev/null 2>&1

# vim or most are my choise for rfc reading;
# you need export your EDITOR
editor=${EDITOR:-most}

if [[ -r ${file} ]]; then
    ${editor} ${file}
else
    wget ${url} > /dev/null 2>&1
    if [[ $? -gt 0 ]]; then
        echo "RFC index not found"
        exit 1
    fi
    ${editor} ${file}
fi

popd  > /dev/null 2>&1

