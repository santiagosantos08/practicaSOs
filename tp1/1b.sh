#!/bin/bash

#reemplazar digitos de un archivo por un caracter pasado por parametro

rchar="$1"
orig="./1bdata.txt"

cat $orig | tr 0-9 $rchar > $orig