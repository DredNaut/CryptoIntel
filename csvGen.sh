#!/bin/bash 

#---------------Generate 4 Arrays---------------



#---------Coin Names---------------
declare -a ARRAY1
exec 10<&0
fileName="/home/dredknaut/Programming/Bash/CryptIntel/results/Name"
exec < $fileName

let count=0

while read LINE; do
    ARRAY1[$count]=$LINE
    ((count++))
done

exec 10<&-




#---------Coin Price---------------
declare -a ARRAY2
exec 10<&0
fileName="/home/dredknaut/Programming/Bash/CryptIntel/results/Price"
exec < $fileName

let count=0

while read LINE; do
    ARRAY2[$count]=$LINE
    ((count++))
done

exec 10<&-




#---------Coin Volume---------------
declare -a ARRAY3
exec 10<&0
fileName="/home/dredknaut/Programming/Bash/CryptIntel/results/Volume"
exec < $fileName

let count=0

while read LINE; do
    ARRAY3[$count]=$LINE
    ((count++))
done

exec 10<&-




#---------Coin Market Cap---------------
declare -a ARRAY4
exec 10<&0
fileName="/home/dredknaut/Programming/Bash/CryptIntel/results/MarketCap"
exec < $fileName

let count=0

while read LINE; do
    ARRAY4[$count]=$LINE
    ((count++))
done

exec 10<&-


write_to_file()
{
    local file="CryptoIntel.csv"

    if [ ! -f "$file" ] ; then
        touch "$file"
    fi
    rm CryptoIntel.csv 

    echo "Name,Price,Volume,Market Cap" >> $file

    COUNTER=0
    while [ $COUNTER -lt 20 ]; do
        echo "${ARRAY1[${COUNTER}]},${ARRAY2[${COUNTER}]},${ARRAY3[${COUNTER}]},${ARRAY4[${COUNTER}]}, $(date +%Y-%m-%d) $(date +%H:%M)" >> $file
        let COUNTER=COUNTER+1
    done
}

write_to_file
