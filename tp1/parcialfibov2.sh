#!/bin/bash

computed="./computed.txt"
calcular="$1"

if [[ ! -f "$computed" || ! -s "$computed" ]]; then # no existe o está vacio
    touch "$computed"
    echo "0,1" > "$computed"
    echo "1,1" >> "$computed"
fi

ultLinea=$(tail -n 1 "$computed")
anteUltLinea=$(tail -n 2 "$computed")

ultNro=$(echo "$ultLinea" | cut -d , -f1 | tr -d " ")
ultValor=$(echo "$ultLinea" | cut -d , -f2 | tr -d " ")
anteUltValor=$(echo "$anteUltLinea" | cut -d , -f2 | tr -d " ")

inicio=$(( "$ultNro" + 1 ))
echo $inicio

for i in $(seq $inicio $calcular); do
    nuevoValor=$(( $ultValor + $anteUltValor ))
    nuevaLinea="$nuevoValor"
    echo "$nuevaLinea" >> "$computed"
done

#tail -n 1 "$computed"