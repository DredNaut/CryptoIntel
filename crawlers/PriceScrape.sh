#!/bin/bash

#---------------------------------------------------

declare -a ARRAY
exec 10<&0
fileName="coinData"
exec < $fileName

let count=0

while read LINE; do
    ARRAY[$count]=$LINE
    ((count++))
done

exec 10<&-

regex="class=\"price\" data-usd=\"[0-9]*.[0-9e\-]*\""

ELEMENTS=${#ARRAY[@]}
firstline=0

for((i=0;i<$ELEMENTS;i++)); do
    if [[ ${ARRAY[${i}]} =~ $regex ]]; then
        if [[ $firstLine<1 ]]; then
            echo ${BASH_REMATCH[0]} > PriceMatch 
            let firstLine=$firstLine+1
        else
            echo ${BASH_REMATCH[0]} >> PriceMatch
        fi
    fi
done

#--------------------------------------------

awk -F '"' '{ print $4 }' PriceMatch > ../results/Price
#awk -F "$" '{ print $2 }' PriceMatch > Price
echo Done
