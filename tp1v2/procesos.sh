#!/bin/bash

proc="$1"

if [ "$proc" == "" ]; then
    echo "ejecutando sin ningun proc especificado, listando todos los que llevan mas de media hora"
else
    echo "ejecutando para $proc"
fi

function filter() { #al filtrarlo antes de recorrer va muchisimo mas rapido
    if [ "$1" == "" ]; then
        echo "$(ps -A)"
    else
        echo "$(ps -A | grep "$1")"
    fi
}

while read linea; do
    pid=$(echo $linea | cut -d " " -f1)
    time=$(echo $linea | cut -d " " -f3)
    cmd=$(echo $linea | cut -d " " -f4)
    hours=$(echo "$time" | cut -d ":" -f1)
    mins=$(echo "$time" | cut -d ":" -f2)
    if [[ $mins -ge 30 ]] || [[ $hours -ge 1 ]]; then #esto tmb se podria filtrar antes pero ya es mas enrosque
        echo "programa: $cmd con pid: $pid lleva ejecutandose $hours horas $mins minutos."
    fi
done <<< "$(filter "$proc")"