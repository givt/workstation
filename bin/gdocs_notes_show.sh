#!/bin/bash
# (C) 2008, givt

google docs list --delimiter " : " --folder "My Notes"|\
    awk -F: '!/pdf/ {print $1}'|cat -n|more
