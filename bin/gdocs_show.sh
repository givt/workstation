#!/bin/bash

google docs list --delimiter " : "|awk -F: '!/pdf/ {print $1}'|cat -n|more
