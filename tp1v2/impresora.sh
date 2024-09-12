#!/bin/bash

archivo="$2"
config="impresorasdata.conf"
idImpresora="$1"
impresoraData=$(grep -E "^$idImpresora:.*" "$config")


if [ "$impresoraData" != "" ]; then
    cantLineas=$(echo "$impresoraData" | cut -d ":" -f3)
    cantCharsPorLinea=$(echo "$impresoraData" | cut -d ":" -f4)
    lineasAcumuladas=0
    while read -r linea; do
        charCount=$(echo "$linea" | wc -m)
        resto=$(( $charCount % $cantCharsPorLinea ))
        div=$(( $charCount / $cantCharsPorLinea ))
        if [[ $resto -eq 0 ]]; then
            lineasAcumuladas=$(( $lineasAcumuladas + $div ))
        else
            lineasAcumuladas=$(( $lineasAcumuladas + $div + 1 )) #redondea para arriba, si una linea -del archivo- termina deja espacio en blanco antes de seguir en la proxima -de la hoja-
        fi
    done <<< "$(cat "$archivo")" #verif que el archivo exista? igual sino da 0 pasg te das cuenta
    resto=$(( $lineasAcumuladas % $cantLineas ))
    div=$(( $lineasAcumuladas / $cantLineas ))
    if [[ $resto -eq 0 ]]; then
        echo "se requieren $div paginas para imprimir $archivo, lineas acumuladas: $lineasAcumuladas"
    else
        echo "se requieren $(( $div + 1 )) paginas ( $div completas, 1 incompleta ) para imprimir $archivos, lineas acumuladas: $lineasAcumuladas"
    fi
else
    echo "no se encontró impresora con id: $idImpresora"
fi
