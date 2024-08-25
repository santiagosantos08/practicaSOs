#!/bin/bash

logPath="/var/log/$1"
logFile="$logPath"/$1.log
logNewLine="$2"
logMaxSize=800 #1MB
compressedArchivePrefix="$logPath"/old
maxArchiveCount=3 #cantidad a partir de la cual se van a borrar los .zip

function rotate() {
    mkdir -p "$compressedArchivePrefix"
    oldest=$(ls -t "$compressedArchivePrefix"/*.zip | tail -n 1)
    newest=$(ls -t "$compressedArchivePrefix"/*.zip | head -n 1)
    echo "oldest : $oldest"
    slotActual=$()
    archiveCount=$(ls -1 "$compressedArchivePrefix"/*.zip | wc -l)
    echo "cant : $archiveCount"
    zip -j "$compressedArchivePrefix"/slot$(("$archiveCount"+1)) "$logFile"
    echo "zip se ejecuto sobre "$compressedArchivePrefix"/slot$(("$archiveCount"+1)) "$logFile""
    #esto está mal ya que en un momento se van a empezar a llamar todos como el maximo
    #hacer el nuevo nombre en base al ultimo caracter del oldest
    truncate -s 0 "$logFile"
    if [ "$archiveCount" -ge "$maxArchiveCount" ]; then
        echo "se detecto que la cant excede el maximo de comprimidos"
        rm "$oldest"
    fi
}

mkdir -p "$logPath"
touch "$logFile"

logSize=$(stat -c %s "$logFile")

if [ "$logSize" -ge "$logMaxSize" ]; then
    echo "Rotando, tamaño maximo de log superado."
    rotate
fi

echo "Logged: [ $(date) ] - $logNewLine . @ $logFile"
echo "[ $(date) ] - $logNewLine ." >> "$logFile"