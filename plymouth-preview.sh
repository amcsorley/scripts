#!/bin/bash  

DURATION=$1
if [ $# -ne 1 ]; then
     DURATION=5
fi

debugfile=/root/plymouthdebug.out.$(date +"%Y%m%d%H%M")
cmdline="quiet splash"

/sbin/plymouthd --debug --debug-file="$debugfile" --tty=/dev/tty6 --kernel-command-line="$cmdline"

plymouth --show-splash

for ((I=0; I<$DURATION; I++))
    do
        plymouth --update=test${I}
        sleep 1
    done

plymouth quit

