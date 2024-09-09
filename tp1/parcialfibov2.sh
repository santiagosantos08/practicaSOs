#!/bin/bash

computed="./computed.txt"
calcular="$1"

if [[ ! -f "$computed" || ! -s "$computed" ]]; then # no existe o está vacio
    touch "$computed"
    echo "0=1" > "$computed"
    echo "1=1" >> "$computed"
fi

ultLinea=$(tail -n 1 "$computed")
anteUltLinea=$(tail -n 2 "$computed")

ultNro=$(echo "$ultLinea" | cut -d = -f1)
ultValor=$(echo "$ultLinea" | cut -d = -f2)
anteUltValor=$(echo "$anteUltLinea" | cut -d = -f2)

inicio=$(( "$ultNro" + 1 ))

for i in $(seq "$inicio" "$calcular"); do
    nuevoValor=$(expr $ultValor \+ $anteUltValor)
    
    nuevaLinea="$i""=""$nuevoValor"
    echo "$nuevaLinea" >> "$computed"
done

tail -n 1 "$computed"