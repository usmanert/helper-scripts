#!/usr/bin/env bash

# import all signers account using ethsign import and then run the script 
# ./setOSMPrice $VAL_ETH $PIP_ETH Median=ETHUSD/BTCUSD OSM_DELAY
# $1 = MEDIAN contract address
# $2 = PIP contract address
# $3 = wat
# $4 = OSM Delay
# $ETH_FROM = sender

set -e
set -u # or set -o nounset
MEDIAN=$(seth --to-address "$1")
PIP=$(seth --to-address "$2")
wat=$3
SYMBOL=$(echo "$3" | cut -c1-3)
OSM_DELAY=$4
MEGA_POKER=0xda05B95E8887ccDeE4AEA14b191db77ef7F084ea
i=0

echo "MEDIAN: $MEDIAN"
echo "PIP: $PIP"
echo "MEGA_POKER: $MEGA_POKER"
echo "wat: $3"

function hash {
    local wat wad zzz
    
    wat=$(seth --to-bytes32 "$(seth --from-ascii "$1")")    
    wad=$(seth --to-word "$2")
    zzz=$(seth --to-word "$3")
    zzz=${zzz:2}
    wat=${wat:2}

    seth keccak "$wad$zzz$wat"
}

function verifyTxStatus {
    if [ $(($1)) -eq 0 ]
    then 
        echo "tx is failed. Quiting"
        exit
    fi
}

function join { local IFS=","; echo "$*"; }


mapfile -t accounts < <(printf "0x125fC0CcCDee5ac474062F6358d4d056b0430b84\n0x37c273044A6ef7c9D09670C8246c49FF4CfD2511\n0x34050B9d0630594214008e3a2af07107B71831fd")

for acc in "${accounts[@]}"; do
    PRICE=$(curl -sk https://goerli.gsu.io/Umbraco/Api/Rates/GSU/?symbol=$SYMBOL | /usr/bin/jq --raw-output '.price')
    ts=$(date +%s)

    if [ $(($PRICE)) -eq 0 ]
    then 
        echo "Price is 0. Quiting"
        exit
    fi

    echo "Signing data from:" $acc "ts:" "$ts" "price:" "$PRICE"
    hash=$(hash $wat "$PRICE" "$ts")
    sig=$(ethsign msg --from "$acc" --data "$hash" --passphrase-file "$ETH_PASSWORD")
    
    echo "data: "$hash
    echo "SIG: "$sig
    
    res=$(sed 's/^0x//' <<< "$sig")
    r=0x${res:0:64}
    s=0x${res:64:64}
    v=${res:128:2}
    v=$(seth --to-word "0x$v")

    
    prices+=("$(seth --to-word "$PRICE")")
    tss+=("$(seth --to-word "$ts")")
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

echo "Sending MEDIAN Poke tx..."

tx=$(set -x; seth send --async "$MEDIAN" 'poke(uint256[] memory,uint256[] memory,uint8[] memory,bytes32[] memory,bytes32[] memory)' \
"[$allprices]" \
"[$allts]" \
"[$allv]" \
"[$allr]" \
"[$alls]")

echo "TX: $tx"
SUCCESS="$(seth receipt "$tx" status)"
echo "SUCCESS: $SUCCESS"
echo GAS USED: "$(seth receipt "$tx" gasUsed)"

verifyTxStatus $SUCCESS

echo "Sending MEGA_POKER Poke tx..."

tx=$(set -x; seth send --async "$MEGA_POKER" 'poke()')

echo "TX: $tx"
echo SUCCESS: "$(seth receipt "$tx" status)"
echo GAS USED: "$(seth receipt "$tx" gasUsed)"

echo "Waiting for $4 seconds, OSM delay to be passed..."
sleep $4

echo "Sending PIP Poke tx..."

tx=$(set -x; seth send --async "$PIP" 'poke()')

echo "TX: $tx"
echo SUCCESS: "$(seth receipt "$tx" status)"
echo GAS USED: "$(seth receipt "$tx" gasUsed)"