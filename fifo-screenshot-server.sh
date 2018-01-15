#!/system/bin/sh
fifo="fifo-screenshot"
[ -e ${fifo} ] || exit 1
while true ;do
    while read -r line ;do
        if  [ "${line}" == "capture" ] ;then
            screencap -p >${fifo}
        else
            eval "${line}" >${fifo} 2>&1
        fi
    done <"${fifo}"
done
