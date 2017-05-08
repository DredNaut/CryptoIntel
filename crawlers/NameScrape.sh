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

regex="class=\"currency-logo\" alt=\"[A-Za-z ]*\""

ELEMENTS=${#ARRAY[@]}
firstline=0

for((i=0;i<$ELEMENTS;i++)); do
    if [[ ${ARRAY[${i}]} =~ $regex ]]; then
        if [[ $firstLine<1 ]]; then
            echo ${BASH_REMATCH[0]} > NameMatch
            let firstLine=$firstLine+1
        else
            echo ${BASH_REMATCH[0]} >> NameMatch
        fi
    fi
done

#----------------------------------------------

sed -i 's/\"/ /g' NameMatch
sed -i 's/ //g' NameMatch
awk -F "=" '{print $3}' NameMatch > ../results/Name
#awk '{print $4}' NameMatch > Name

