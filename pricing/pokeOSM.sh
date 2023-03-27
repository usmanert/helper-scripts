#!/usr/bin/env bash

# import all signers account using ethsign import and then run the script
# ./pokeOSM.sh $MEGA_POKER $PIP_ETH $MCD_SPOT $VAL_ETH .env
# $1 = MegaPoker contract address
# $2 = PIP Contract address
# $3 = SPOT Contract address
# $4 = VAL Contract address
# $5 envfile with ETH_FROM, etc.
#$ETH_FROM = sender

set -e
set -u # or set -o nounset

set -a

echo "Trying to poke OSM @ $(date)"

source /data/helper-scripts/$5 # e.g. ethvar.bash with ETH_FROM and address details seth requires

# Current Price in OSM
curr=$(seth call $2 "peek()(uint256,bool)" --from $3 | sed -n 1p)
echo "Current OSM: $curr"

# New Price in Median
new=$(seth call $4 "read()(uint256)" --from $3)
echo "Curr Median: $new"

if [[ "$(echo "$curr==$new" | bc)" == 1 ]]; then
	echo "Prices are the same, so not going to poke"; exit 0
fi

# Check if eta has passed (ok to make tx)

passed=$(seth call $2 "pass()(uint)")

echo "Time has passed: $(seth call $2 "pass()(bool)")"
if [[ $(echo "$passed==0"|bc) == 1 ]]; then
	echo "Can't make tx yet as time hasn't passed"; exit 0
fi

echo "Sending PIP Poke tx..."

tx=$(set -x; seth send --async "$1" 'poke()')

echo TX: $tx
echo SUCCESS: "$(seth receipt "$tx" status)"
echo GAS USED: "$(seth receipt "$tx" gasUsed)"
