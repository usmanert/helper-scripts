#!/usr/bin/env bash

# import all signers account using ethsign import and then run the script 
# ./setOSMPrice $PIP_ETH 
# $1 = PIP contract address
# $ETH_FROM = sender


echo "Sending PIP Poke tx..."

tx=$(set -x; seth send  "$1" 'poke()')

echo "TX: $tx"
echo SUCCESS: "$(seth receipt "$tx" status)"
echo GAS USED: "$(seth receipt "$tx" gasUsed)"