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

regex="class=\"no-wrap market-cap text-right\" data-usd=\"[0-9]*.[0-9]*"

ELEMENTS=${#ARRAY[@]}
firstline=0

for((i=0;i<$ELEMENTS;i++)); do
    if [[ ${ARRAY[${i}]} =~ $regex ]]; then
        if [[ $firstLine<1 ]]; then
            echo ${BASH_REMATCH[0]} > CapMatch
            let firstLine=$firstLine+1
        else
            echo ${BASH_REMATCH[0]} >> CapMatch
        fi
    fi
done

#----------------------------------------------

sed -i 's/\"/ /g' CapMatch
awk '{print $6}' CapMatch > ../results/MarketCap

