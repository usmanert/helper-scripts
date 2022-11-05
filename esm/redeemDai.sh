printf "Calling cage on each ilk\n\n"

seth send $MCD_END "cage(bytes32 ilk)" $(seth --from-ascii "WBTC-A")&&seth send $MCD_END "cage(bytes32 ilk)" $(seth --from-ascii "WBTC-B")&&seth send $MCD_END "cage(bytes32 ilk)" $(seth --from-ascii "WBTC-C")&&seth send $MCD_END "cage(bytes32 ilk)" $(seth --from-ascii "ETH-A")&&seth send $MCD_END "cage(bytes32 ilk)" $(seth --from-ascii "ETH-B")&&seth send $MCD_END "cage(bytes32 ilk)" $(seth --from-ascii "ETH-C")



printf "\ncheck the system debt of end contract\n"

seth call $MCD_END "debt()(uint256)" 

printf "\ncheck the system surplus of vow contract in Vat contract \n"

seth call $MCD_VAT "dai(address)(uint256)" $MCD_VOW 

printf "\nSkimming all urns \n"

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


printf "\nFor making the surplus zero we have to call heal of Vow. \n"

seth send $MCD_VOW "heal(uint)"  $(seth --to-dec $(seth call $MCD_VAT "dai(address)" $MCD_VOW))

printf "\ncheck the system surplus of vow contract in Vat contract \n"

seth call $MCD_VAT "dai(address)(uint256)" $MCD_VOW 

printf "\n Now call the thaw of end \n"


seth send $MCD_END "thaw()" 

printf "\ncall flow on each ilk for calculate the fix\n"

seth send $MCD_END "flow(bytes32 ilk)" $(seth --from-ascii "WBTC-A")&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "flow(bytes32 ilk)" 0x574254432d42&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "flow(bytes32 ilk)" 0x574254432d43&&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "flow(bytes32 ilk)" 0x4554482d41 &&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "flow(bytes32 ilk)" 0x4554482d42 &&seth send 0xf4BAD4236E55EFCB2fF6555Edd1D4E2662f5a17E "flow(bytes32 ilk)" 0x4554482d43 

#after this can be done through proxy

printf "\ncheck the system debt of end contract after calling thaw \n"

seth call $MCD_END "debt()(uint256)"

printf "\n calling hope of Vat to give access to end contract\n"

seth send $MCD_VAT "hope(address)" $MCD_END # add the address in can[]

export balance=$(seth --to-dec $(seth call $MCD_DAI "balanceOf(address)" $ETH_FROM))

printf "\n calling approve of Vat to give access to end contract\n"

seth send $MCD_DAI "approve(address,uint)" $MCD_JOIN_DAI $(seth --to-dec $(seth call $MCD_DAI "balanceOf(address)" $ETH_FROM))

printf "\n calling join of MCD_JOIN_DAI \n"

seth send $MCD_JOIN_DAI "join(address usr, uint256 amt)" $ETH_FROM $(seth --to-dec $(seth call $MCD_DAI "balanceOf(address)" $ETH_FROM))

printf "\n calling pack of MCD_END to put dai in bag \n"

seth send $MCD_END "pack(uint256)" $balance #$(seth --to-dec $(seth call $MCD_DAI "balanceOf(address)" $ETH_FROM))

printf "\n calling cash of MCD_END to get the vat.gem \n"

seth send $MCD_END "cash(bytes32 ilk, uint256 wad)" $(seth --from-ascii "ETH-B") $balance


printf "\n checking the gem of vat\n"


seth --to-dec $(seth call $MCD_VAT "gem(bytes32 , address)" $(seth --from-ascii "ETH-B") $ETH_FROM)

printf "\n calling exit of MCD_JOIN_ETH_B w.r.t gem from vat`` \n"

export balance=$(seth call $MCD_VAT "gem(bytes32,address)(uint)" $(seth --from-ascii "ETH-B") $ETH_FROM)

seth send $MCD_JOIN_ETH_B "exit(address usr, uint256 wad)" $ETH_FROM $balance

printf "getting balance of wrapped Eth: "

seth call $ETH "balanceOf(address)(uint)" $ETH_FROM

printf "\nwithdrawal of wrapped Eth \n"

seth send $ETH "withdraw(uint256)" $balance

printf "\n Seth ls\n"
 
seth ls