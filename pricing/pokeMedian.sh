#!/usr/bin/env bash

# import all signers account using ethsign import and then run the script 
# ./pokeMedian $VAL_ETH ETHUSD "1667440206\n1667440206\n1667440206" "1000\n1500\n2000"
# $1 = median contract address
# $2 = wat
# $3 = timestamp seprated by \n
# $4 = price seprated by \n
# $ETH_FROM = signer

set -e

median=$(seth --to-address "$1")
wat=$2
echo "Median: $median"
echo "wat: $2"
echo "zzz: $3"
echo "price: $4"
# echo "signers: $4"
echo

function hash {
    local wat wad zzz
    
    wat=$(seth --to-bytes32 "$(seth --from-ascii "$1")")    
    wad=$(seth --to-wei "$2" eth)
    wad=$(seth --to-word "$wad")
    zzz=$(seth --to-word "$3")
    zzz=${zzz:2}
    wat=${wat:2}

    seth keccak "$wad$zzz$wat"
}

function join { local IFS=","; echo "$*"; }


mapfile -t accounts < <(printf "0x125fC0CcCDee5ac474062F6358d4d056b0430b84\n0x37c273044A6ef7c9D09670C8246c49FF4CfD2511\n0x34050B9d0630594214008e3a2af07107B71831fd")
mapfile -t ts < <(printf "$3")
mapfile -t price < <(printf "$4")

for acc in "${accounts[@]}"; do
    echo "Signing data from:" $acc "ts:" "${ts[i]}" "price:" "${price[i]}"
    hash=$(hash $wat "${price[i]}" "${ts[i]}")
    sig=$(ethsign msg --from "$acc" --data "$hash" --passphrase-file "$ETH_PASSWORD")
    echo "data: "$hash
    echo "SIG: "$sig
    res=$(sed 's/^0x//' <<< "$sig")
    r=0x${res:0:64}
    s=0x${res:64:64}
    v=${res:128:2}
    v=$(seth --to-word "0x$v")

    
    price_=$(seth --to-wei "${price[i]}" eth)
    prices+=("$(seth --to-word "$price_")")
    tss+=("$(seth --to-word "${ts[i]}")")
    rs+=("$r")
    ss+=("$s")
    vs+=("$v")

    i=$((i + 1))
    printf "\n\n"
done

allts=$(join "${tss[@]}")
allprices=$(join  "${prices[@]}")
allr=$(join "${rs[@]}")
alls=$(join "${ss[@]}")
allv=$(join "${vs[@]}")

echo "Sending tx..."

tx=$(set -x; seth send --async "$median" 'poke(uint256[] memory,uint256[] memory,uint8[] memory,bytes32[] memory,bytes32[] memory)' \
"[$allprices]" \
"[$allts]" \
"[$allv]" \
"[$allr]" \
"[$alls]")

echo "TX: $tx"
echo SUCCESS: "$(seth receipt "$tx" status)"
echo GAS USED: "$(seth receipt "$tx" gasUsed)"