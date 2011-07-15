#!/bin/bash

messages="/tmp/gmail.msg"
title=" $(grep -c "" ${messages}) emails in Gmail box"
icon="/usr/share/icons/Lush/scalable/actions/mail-message-new.svg"
place=$(xrandr -q|grep '*'|sed -e 's/x.*//' -e 's/\ //g')
sound="${HOME}/Music/Notifications/new_mail_waiting.mp3"

while read line
do
    echo ${line:0:35} >> ${messages}.tmp
done < ${messages}

message="`cat -b ${messages}.tmp`"
rm -f ${messages}.tmp

notify-send -i ${icon} -h int:x:${place} -h int:y:10 -u normal -t 100000 \
    "${title}" "${message}"'!' & mpg123 ${sound}  
