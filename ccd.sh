#! /bin/bash

CCD_DICTIONARY_PATH="/home/liam/Documents/code/ccd/dictionary.txt"

function ccd() {
    #$1 is the destination name
    echo s1
    echo $1
    temp1="$(grep ja /home/liam/Documents/code/ccd/dictionary.txt)"

    echo temp1
    echo $temp1

    temp2="$(echo $temp1 | sed s/\ /\
/)"

    echo temp2
    echo $temp2

    temp3="$(echo $temp2 | tail -n 2)"
    echo temp3
    echo $temp3
}
