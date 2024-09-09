#!/bin/bash

declare -A termCount #declara -A : array asociativo (mapa)

#para usar es
#./termFreq.sh "./pathArchivo" => ej: ./termFreq.sh "./terfreqdata.txt"

for f in $(cat "$1" | tr -d . | tr -d ,); do #por cada palabra del archivo de texto (con puntos y comas eliminados para que no tome a "ejemplo," != "ejemplo" != "ejemplo.")
    if [[ -n "${termCount["$f"]}" ]]; then #chequea si existe la key
        ((termCount[$f]++)) #doble parentesis : expresion aritmetica, aumenta el conteo de esa palabra
    else
        termCount[$f]=1 #si no existe la setea en 1 la primera vez que aparece
    fi
done

max=0

for term in "${!termCount[@]}"; do #el @ itera por todos los elementos, el ! indica que se imprima la key y no el value
    if [[ ${termCount[$term]} -ge $max ]]; then #busca el maximo de apariciones
        max=${termCount[$term]}
    fi
done

for term in "${!termCount[@]}"; do #al igual que arriba, el '!' imprime solo la key y no el valor
    count=${termCount[$term]}
    tf=$(bc <<<"scale=2; $count / $max") #esto del bc y el scale es para hacer operaciones con coma
    echo "TF("$term") = "$count" / "$max" = "$tf""
done