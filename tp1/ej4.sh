#!/bin/bash

files="./archivos4.txt"
gz="gz"
bz2="bz2"
zip="zip"
tar="tar"
toolGz="gunzip"
toolBz2="bunzip2"
toolTar="tar"
toolZip="unzip"

# filename=$(basename -- "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"
## se hace con esto

for f in $(cat $files);
do
    echo $( $f | rev ) #preguntar, da permission denied ??!
done