#!/bin/bash
# (C) 2009, givt

history -a

message=`history|tail -n 1`
previous_message=$(cat ~/tmp/last_tweet)

if [ x"${message}" == x"" ]; then
    exit
fi

if [ x"${message}" == x"${previous_message}" ]; then
    exit
fi

echo "${message}" > ~/tmp/last_tweet
echo $(date '+%Y-%m-%d  %H:%M:%S')  "${message}" >> ~/tmp/lastcmd.log

twidge update "${message}" 
