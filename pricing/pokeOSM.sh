#!/usr/bin/env bash

# import all signers account using ethsign import and then run the script
# ./pokeOSM.sh $MEGA_POKER $PIP_ETH $MCD_SPOT .env
# $1 = MegaPoker contract address
# $2 = PIP Contract address
# $3 = SPOT Contract address
# $4 envfile with ETH_FROM, etc.
#$ETH_FROM = sender

set -e
set -u # or set -o nounset

set -a
source /data/helper-scripts/$4 # e.g. ethvar.bash with ETH_FROM and address details seth requires

# Current Price
curr=$(seth call $2 "peek()(uint256,bool)" --from $3 | sed -n 1p)
echo "Current: $curr"

# Prev Price
prev=$(seth call $2 "peep()(uint256,bool)" --from $3 | sed -n 1p)
echo "Prev: $prev"

if [[ "$(echo "$curr==$prev" | bc)" == 1 ]]; then
	echo "Prices are the same, so not going to poke"; exit 0
fi

echo "Sending PIP Poke tx..."

tx=$(set -x; seth send --async "$1" 'poke()')

echo TX: $tx
echo SUCCESS: "$(seth receipt "$tx" status)"
echo GAS USED: "$(seth receipt "$tx" gasUsed)"
