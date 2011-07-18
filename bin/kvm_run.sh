#!/bin/bash
# (C) 2008, givt

# XXX

kvm -hda ~/wrk/vlinux/rugged-devenv.1 -m 512  -net nic -net user -net \
    socket,listen=localhost:1234
