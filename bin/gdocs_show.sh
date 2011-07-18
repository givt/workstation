#!/bin/bash
# (C) 2008, givt

google docs list --delimiter " : "|awk -F: '!/pdf/ {print $1}'|cat -n|more
