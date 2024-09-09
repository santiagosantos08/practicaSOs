#!/bin/bash

#calcular fib usando archivo para guardar los previos

computed="computed.txt"
calcular="$1" #para el b) si es una lista van separados por un espacio en un mismo param, ej: "20 30 40 50 22 11"

if [[ ! -f "$computed" || ! -s "$computed" ]]; then # no existe o está vacio
    touch "$computed"
    echo "0,0" > "$computed" #el enunciado está mal, el fib de 0 es 0
    echo "1,1" >> "$computed"
fi

for num in $calcular; do #el IFS por default es tab, \newline y espacios
    echo "================================================================="
    estaEnArchivo=$(grep "$num," "$computed")
    if [ "$estaEnArchivo" != "" ]; then
        nro=$(echo "$estaEnArchivo" | cut -d "," -f1)
        valor=$(echo "$estaEnArchivo" | cut -d "," -f2)
        echo "Fib($nro) ya estaba precalculado, es $valor"
    else
        ultPreCalc=$(tail -n 1 "$computed")
        anteUltPreCalc=$(tail -n 2 "$computed" | head -n 1)
        ultPreCalcNro=$(echo "$ultPreCalc" | cut -d "," -f1)
        ultPreCalcValor=$(echo "$ultPreCalc" | cut -d "," -f2)
        anteUltPreCalcValor=$(echo "$anteUltPreCalc" | cut -d "," -f2)

        inicio=$(( $ultPreCalcNro + 1 ))
        fin="$num"

        echo "el último precalculado es Fib($ultPreCalcNro) = $ultPreCalcValor"
        echo "empezando desde Fib($inicio)"

        while read iterador; do
            nuevoValor=$(( $ultPreCalcValor + $anteUltPreCalcValor )) #revisar que se rebalsa y se va a los negativos
            echo "$iterador,$nuevoValor" >> "$computed"
            anteUltPreCalcValor="$ultPreCalcValor"
            ultPreCalcValor="$nuevoValor"
        done <<< "$(seq "$inicio" "$fin")"

        echo "Fib($fin) = $ultPreCalcValor"
    fi
done


