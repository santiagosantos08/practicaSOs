#!/bin/bash

direc="$1"

for f in $(ls "$1");
do
    echo "$f" | tr A-Z a-z | tr " " _
done