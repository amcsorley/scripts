#!/bin/bash  

duration=$1
theme=$2
if [ $# -ne 2 ]; then
    echo -e "\nneed seconds and theme name"
    echo -e "example: $0 10 en\n"
    exit
fi

sed -i "s/^Theme=.*/Theme=$2/" /usr/share/plymouth/plymouthd.defaults

debugfile=/root/plymouthdebug.out.$(date +"%Y%m%d%H%M")
cmdline="quiet splash"

/sbin/plymouthd --debug --debug-file="$debugfile" --tty=/dev/tty6 --kernel-command-line="$cmdline"

plymouth --show-splash

for ((I=0; I<$duration; I++))
    do
        plymouth --update=test${I}
        sleep 1
    done

plymouth quit

