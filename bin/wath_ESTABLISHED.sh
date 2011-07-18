#!/bin/bash
# (C) 2006, givt

sudo watch -d -n 1 "lsof -i -Pn|grep ESTABLISHED"
