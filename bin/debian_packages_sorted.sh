#!/bin/sh
#
# (C) 2008, givt

dpkg-query -W --showformat='${Installed-Size} ${Package}\n' | sort -rn | column
