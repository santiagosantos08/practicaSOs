#!/bin/bash

declare -A termCount #declara -A : array asociativo (mapa)


for f in $(cat "$1" | tr -d . | tr -d ,); do
    if [[ -n "${termCount["$f"]}" ]]; then #chequea si existe la key
        ((termCount[$f]++)) #doble parentesis : expresion aritmetica
    else
        termCount[$f]=1
    fi
    #echo "$f ${termCount[$f]}"
done

max=0

for term in "${!termCount[@]}"; do
    if [[ ${termCount[$term]} -ge $max ]]; then
        max=${termCount[$term]}
    fi
done
#echo "scale=2 ; $var1 / $var2" | bc
for term in "${!termCount[@]}"; do # el '!' imprime solo la key y no el valor
    count=${termCount[$term]}
    tf=$(bc <<<"scale=2; $count / $max")
    echo "TF("$term") = "$count" / "$max" = "$tf""
done