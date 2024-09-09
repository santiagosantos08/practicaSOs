#!/bin/bash
#convierta el contenido de un archivo a mayusculas y guarde sobre el mismo archivo

orig="./1adata.txt"

cat $orig | tr a-z A-Z > $orig