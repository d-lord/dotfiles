#!/bin/bash
# originally from http://superuser.com/a/285400/352136

for i in {0..255} ; do
    printf "\x1b[38;5;${i}m██████████ ${i}\n";
done
