#!/bin/bash

proc="$1"
#verificar que el grep no de vacio?? qsya, na, si da vacio no corre el for

if [ "$proc" == "" ]; then
    echo "ejecutando sin ningun proc especificado, listando todos los que llevan mas de media hora"
else
    echo "ejecutando para $proc"
fi

IFS="\n"

for f in $(ps -A); do #si el param esta vacio el grep ya devuelve todas las lineas, no hace falta chequear
    name=$(echo "$f" | cut -d" " -f4)
    echo "$name"
    if [ "$name" == "$proc" ]; then
        timestamp=$(echo "$f" | cut -d" " -f3)
        hours=$(echo "$timestamp" | cut -d":" -f1)
        minutes=$(echo "$timestamp" | cut -d":" -f2)
        echo "$hours"
        echo "$minutes"
    fi
    #if horas > 1 else min > 30 etc etc
done


while read -r; do

done < $(ps -A)

#auxfile="./test.txt"
#echo "$(ps -A)" > test.txt
#s2=$(grep "$1" "$auxfile")
#echo "$s2"
#
#timestamp=$(echo "$s2" | cut -d " ")