printf "Exporting variables \n\n"

export MCD_END=0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E

printf "Calling cage on each ilk\n\n"
seth send $MCD_END "cage(bytes32 ilk)" $(seth --from-ascii "WBTC-A")&&seth send $MCD_END "cage(bytes32 ilk)" $(seth --from-ascii "WBTC-B")&&seth send $MCD_END "cage(bytes32 ilk)" $(seth --from-ascii "WBTC-C")&&seth send $MCD_END "cage(bytes32 ilk)" $(seth --from-ascii "ETH-A")&&seth send $MCD_END "cage(bytes32 ilk)" $(seth --from-ascii "ETH-B")&&seth send $MCD_END "cage(bytes32 ilk)" $(seth --from-ascii "ETH-C")