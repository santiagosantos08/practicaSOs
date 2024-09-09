#!/bin/bash

comprimir="c"
eliminar="e"
nada="n"
logFile="./ej3.log"
touch "$logFile"

for f in $(find ~ -size 100k);
do
    read -p "Ingrese accion para archivo $f : [c]omprimir / [e]liminar / [n]ada : " opcion
    if [ $opcion = $nada ]
    then
        echo "ignorando archivo $f"
    elif [ $opcion = $eliminar ]
    then
        echo "eliminando archivo $f"
        echo "[ $(date) ] Eliminado : $f " >> $logFile
        #llamado a rm, en realidad no lo quiero eliminar
    elif [ $opcion = $comprimir ]
    then
        echo "comprimiendo archivo $f"
        #llamado a zip, en realidad no lo quiero comprimir
    fi
done