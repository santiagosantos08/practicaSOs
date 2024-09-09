#!/bin/bash

computed="./computed.txt"
calcular="$1"

if [[ ! -f "$computed" || ! -s "$computed" ]]; then # no existe o está vacio
    touch "$computed"
    echo "0,1" > "$computed"
    echo "1,1" >> "$computed"
fi

precalculado=$(grep "${calcular}," "$computed")
nroprecalculado=""
valorprecalculado=""

echo "$precalculado"

if [ "$precalculado" == "" ]; then
    echo "no existe en el arch"
else
    echo "existe en el arch"
    nroprecalculado=$(echo "$precalculado" | cut -d "," -f1)
    valorprecalculado=$(echo "$precalculado" | cut -d "," -f2)
fi

if [[ "$calcular" -eq "$nroprecalculado" ]]; then
    echo "Fib(${calcular}) = ${valorprecalculado}"
else
    aux=$(fibonacci $(($calcular)))
    
    echo "Fib(${calcular}) = ${aux}"
fi

function fibonacci {
    if [[ $1 -eq 0 ]]; then #segun entiendo como que la func es su propio programa por lo que $1 no es el parametro q le pasamos al prog sino el que se le pasa a la func
        echo 0
    elif [[ $1 -eq 1 ]]; then
        echo 1
    else
        echo $(( $(fibonacci $(($1 - 1))) + $(fibonacci $(($1 - 2)))))
    fi
}






