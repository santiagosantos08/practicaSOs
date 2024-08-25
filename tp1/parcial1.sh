#!/bin/bash

declare -A termCount #declara -A : array asociativo (mapa)

while read -r line; do
    for term in $line; do
        if [[ ${termCount[$term]+x} ]]; then #chequea si existe la key
            ((termCount[$term]++)) #doble parentesis : expresion aritmetica
        else
            termCount[$term]=1
        fi
        echo "$term"
    done
done < "$1"
echo "aa"
max=0

for term in "${!termCount[@]}"; do
    if [[ ${termCount[$term]} -ge $max ]]; then
        max=${termCount[$term]}
    fi
done
#
#for term in "${!termCount[@]}"; do
#    count=${termCount[$term]}
#    tf=(($count/$max))
#    #echo -e "$term \n"
#    #echo "TF("$term") = "$count" / "$max" = "$tf" \n"
#done