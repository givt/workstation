#!/bin/bash
# (C) 2008, givt

history | awk '{print $2}' | sort | uniq -c | sort -r -n
