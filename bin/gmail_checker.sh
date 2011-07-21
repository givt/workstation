#!/bin/bash
# (C) 2008, givt

# check gmail 60 min
interval_check=3600

function main () {
    while true
    do
        gmail_show.sh
        gmail_dnotify.sh 
        sleep ${interval_check}
    done
}

# HERE

main

