#!/usr/bin/env bash

# import all signers account using ethsign import and then run the script
# ./pokeOSM.sh $PIP_ETH .env
# $1 = PIP contract address
# $2 envfile with ETH_FROM, etc.
#$ETH_FROM = sender

set -e
set -u # or set -o nounset

set -a
source /data/helper-scripts/$2 # e.g. ethvar.bash

tx=$(set -x; seth estimate --async "$1" 'poke()')

echo "Sending PIP Poke tx..."

tx=$(set -x; seth send --async "$1" 'poke()')

echo "TX: $tx"
echo SUCCESS: "$(seth receipt "$tx" status)"
echo GAS USED: "$(seth receipt "$tx" gasUsed)"