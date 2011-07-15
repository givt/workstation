#!/bin/bash


if [[ $# -eq 0 ]]; then
    echo "run: $(basename ${0}) RFC-NUM \
    (example: $(basename ${0}) 4741)";
    exit 1;
fi

dir=~/.rfc
file=rfc${1}.txt
url=http://www.rfc-editor.org/rfc/${file}

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
        echo "RFC ${1} not found"
        exit 1
    fi
    ${editor} ${file}
fi

popd  > /dev/null 2>&1

