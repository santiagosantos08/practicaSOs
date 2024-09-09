#!/bin/bash
#ej log rotativo (7)

maxSize=3
logPath="logs"

if [ -n "$(find $logPath -type f -size +1k -iname app_log.out)" ]; then
    if [ "$(ls -1 $logPath | grep .zip | wc -l)" -ge $maxSize ]; then
        slotToFree="$(ls -1t $logPath | grep .zip | tail -1)"
        rm $logPath/$slotToFree
    fi
    mostRecent="$(ls -1t $logPath | grep .zip | head -1 | cut -d "-" -f1)"
    zip -m $logPath/"$(( $mostRecent + 1 ))"-app_log.zip $logPath/app_log.out
fi
