#!/bin/bash

echo "In var 1"
read var

echo "var 1 es $var"

if (( $var == 1 )); then
    /home/santiago/Documents/practicaSOs/prueba.sh
fi