#!/bin/bash
# (C) 2008, givt

. ${HOME}/.data/gconfig

messages="/tmp/gmail.msg"

function gmail_check () {
    curl -u ${gname}:${gpass} --silent \
    "https://mail.google.com/mail/feed/atom" | \
    tr -d '\n' | awk -F '<entry>' '{for (i=2; i<=NF; i++) {print $i}}' | \
    sed -n "s/<title>\(.*\)<\/title.*name>\(.*\)<\/name>.*/\2 - \1/p" \
    > ${messages}
}

function main () {
    gmail_check
    cat -b ${messages}|column -s - -t
}

# HERE

main

