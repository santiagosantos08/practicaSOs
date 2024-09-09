#!/bin/bash

fiboaux="/home/santiago/Documents/practicaSOs/tp1/fiboaux.txt"
nroCalcular="$1"
ultCalculadoLinea=0 #linea entera que tiene Nro=Valor
anteUltCalculadoLinea=0
ultCalculadoNro=0 #nro a calcularle el fib
ultCalculadoValor=0 #valor del fib de Nro
anteUltCalculadoValor=0

if [ -f "$fiboaux" ]; then # existe el archivo
    if [ -s "$fiboaux" ]; then #no está vacio
        echo "existe archivo"
    else
        echo "0=1" > "$fiboaux"
        echo "1=1" >> "$fiboaux"
    fi
else #no existe
    touch "$fiboaux"
    echo "0=1" > "$fiboaux"
    echo "1=1" >> "$fiboaux"
fi

ultCalculadoLinea=$(tail -n 1 "$fiboaux")
anteUltCalculadoLinea=$(tail -n 2 "$fiboaux")

echo "$ultCalculadoLinea"

ultCalculadoNro=$(echo "$ultCalculadoLinea" | cut -d = -f1)
ultCalculadoValor=$(echo "$ultCalculadoLinea" | cut -d = -f2)
anteUltCalculadoValor=$(echo "$anteUltCalculadoLinea" | cut -d = -f2)

echo "$ultCalculadoNro"
echo "$ultCalculadoValor"

resultado=0;
iterador=$ultCalculadoNro+1

while ((iterador<nroCalcular)); do
    let actual=ultCalculadoValor+anteUltCalculadoValor
    lineaNueva="$n=${actual}"
    echo "$lineaNueva" >> "$fiboaux"
    echo "$lineaNueva"
    anteUltCalculadoValor="$ultCalculadoValor"
    ultCalculadoValor="$iterador"
    iterador=$((iterador++))
done