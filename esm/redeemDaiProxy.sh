printf "Exporting variables \n\n"
export ETH_FROM=0x7D9ecE67ab918361b8b8Ad94113AC17f42BF9c12
# printf "Calling cage on each ilk\n\n"

# seth send $MCD_END "cage(bytes32 ilk)" $(seth --from-ascii "WBTC-A")&&seth send $MCD_END "cage(bytes32 ilk)" $(seth --from-ascii "WBTC-B")&&seth send $MCD_END "cage(bytes32 ilk)" $(seth --from-ascii "WBTC-C")&&seth send $MCD_END "cage(bytes32 ilk)" $(seth --from-ascii "ETH-A")&&seth send $MCD_END "cage(bytes32 ilk)" $(seth --from-ascii "ETH-B")&&seth send $MCD_END "cage(bytes32 ilk)" $(seth --from-ascii "ETH-C")

printf "\nSkimming all urns \n"
read -p "Press enter to continue"

seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-A") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 1)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 2)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-B") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 3)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 4)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 5)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 6)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 7)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 8)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 9)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 10)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 11)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 12)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 13)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 14)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 15)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 16)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 17)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 18)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-B") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 19)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 20)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-A") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 21)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 22)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 23)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "ETH-A") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 24)\
&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "skim(bytes32 ilk, address urn )" $(seth --from-ascii "WBTC-C") $(seth call 0x84d4Ef5d2e0D361cc8c4CD11DBf66aEE68d6d2Fd "urns(uint)" 25)


printf "\ncheck the surplus vat.dai(vow). \n"
seth --to-dec $(seth call $MCD_VAT "dai(address)" $MCD_VOW)
read -p "Press enter to continue"


printf "\nFor making the surplus zero we have to call heal of Vow. \n"
read -p "Press enter to continue"

seth send $MCD_VOW "heal(uint)"  $(seth --to-dec $(seth call $MCD_VAT "dai(address)" $MCD_VOW))

printf "\n\ncheck the surplus vat.dai(vow). \n"
seth --to-dec $(seth call $MCD_VAT "dai(address)" $MCD_VOW)
read -p "Press enter to continue"

printf "\n Now call the thaw of end \n"
read -p "Press enter to continue"


seth send $MCD_END "thaw()" 


printf "\ncall flow on each ilk for calculate the fix\n"

read -p "Press enter to continue"

seth send $MCD_END "flow(bytes32 ilk)" $(seth --from-ascii "WBTC-A")&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "flow(bytes32 ilk)" 0x574254432d42&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "flow(bytes32 ilk)" 0x574254432d43&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "flow(bytes32 ilk)" 0x4554482d41 &&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "flow(bytes32 ilk)" 0x4554482d42 &&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "flow(bytes32 ilk)" 0x4554482d43 



# export balance=$(seth --from-wei $(seth --to-dec $(seth call $MCD_DAI 'balanceOf(address)' $ETH_FROM)))





export balance=$(seth call $MCD_DAI 'balanceOf(address)(uint256)' $ETH_FROM)
read -p "Press enter to continue"

printf "balance of $ETH_FROM is $balance in wad (18 dec)"
read -p "Press enter to continue"

# export wad=$(seth --to-uint256 $(seth --to-wei 13400 eth))
export MYPROXY=$(seth call $PROXYREGISTRY 'proxies(address)(address)' $ETH_FROM)
# export MYPROXY=

printf "\napproving dai to my proxy\n"
read -p "Press enter to continue"

seth send $MCD_DAI 'approve(address,uint)' $MYPROXY $balance 
#$(seth --to-uint256 $(mcd --to-hex -1))

export calldata=$(seth calldata 'pack(address,address,uint)' $MCD_JOIN_DAI $MCD_END $balance)
read -p "Press enter to continue"

printf "\ncalldata created\n\nexecuting the calldata \"pack(address,address,uint)\" put dai into the bag.\n"
read -p "Press enter to continue"

seth send $MYPROXY 'execute(address,bytes memory)' $PROXY_ACTIONS_END $calldata --gas 800000

printf "\nnow maikng the calldata for cashETH(address,address,bytes32,uint)\n"
read -p "Press enter to continue"

export cashETHcalldata=$(seth calldata 'cashETH(address,address,bytes32,uint)' $MCD_JOIN_ETH_B $MCD_END $(seth --from-ascii ETH-B) $balance)

printf "\n seth ls for checking balance before executing\n"
read -p "Press enter to continue"

seth ls

printf "\nnow calling the execute against cashETHcalldata\n"
read -p "Press enter to continue"

seth send $MYPROXY 'execute(address,bytes memory)' $PROXY_ACTIONS_END $cashETHcalldata

printf "\n seth ls for checking balance after executing\n"
read -p "Press enter to continue"

seth ls
read -p "Press enter to continue"
