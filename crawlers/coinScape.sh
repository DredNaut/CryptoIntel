#!/bin/bash

touch pot
rm pot
touch lineMatch
rm lineMatch
touch coinData
rm coinData
touch NameMatch
rm NameMatch

wget -O pot "https://coinmarketcap.com/"
clear

declare -a ARRAY
exec 10<&0
fileName="pot"
exec < $fileName

let count=0

while read LINE; do
    ARRAY[$count]=$LINE
    ((count++))
done

exec 10<&-

regex="id-[a-zA-Z0-9 \-]*\""

ELEMENTS=${#ARRAY[@]}
firstline=0

for((i=0;i<$ELEMENTS;i++)); do
    if [[ ${ARRAY[${i}]} =~ $regex ]]; then
        if [[ $firstLine<1 ]]; then
            echo ${BASH_REMATCH[0]} > lineMatch 
            let firstLine=$firstLine+1
        else
            echo ${BASH_REMATCH[0]} >> lineMatch
        fi
    fi
done

#----------------------------------------------------
declare -a ARRAY1
exec 10<&0
fileName1="lineMatch"
exec < $fileName1

let count=0

while read LINE; do
    ARRAY1[$count]=$LINE
    ((count++))
done

exec 10<&-

ELEMENTS=${#ARRAY1[@]}


for((i=0;i<$ELEMENTS;i++)); do
    grep -A 36 "${ARRAY1[${i}]}" pot >> coinData
done
