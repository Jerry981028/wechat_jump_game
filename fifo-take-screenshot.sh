#!/usr/bin/env bash
fifo="fifo-screenshot"
[ -e ${fifo} ] || mkfifo ${fifo}
if [ "$*" == "capture" ] ;then
    echo "capture" >${fifo}
    cat "${fifo}" >autojump.png
elif [ "$*" == "cat" ] ;then
    echo "capture" >${fifo}
    cat "${fifo}"
elif [ -n "$*" ] ;then
    echo "$*" >${fifo}
    cat "${fifo}"
fi