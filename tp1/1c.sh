#!/bin/bash

#invertir el orden de lineas de un archivo

orig="./1cdata.txt"

cat $orig | sort -r > $orig