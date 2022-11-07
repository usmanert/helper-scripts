printf "Exporting variables \n\n"

export ETH_FROM=0x7D9ecE67ab918361b8b8Ad94113AC17f42BF9c12

printf "\n\n\nmsg.sender is $ETH_FROM\n--------------------------!!!!!!!!!!----------------------------\n\n"


printf "Now calling \"seth ls\" \n"

seth ls

read -p "Press enter to continue"

printf "Check the urn; for which we are calling vat.urn(ink , art) Before skimming\n"

seth call $MCD_VAT "urns(bytes32,address)(uint256,uint256)" $(seth --from-ascii "ETH-B")  $(seth call $CDP_MANAGER "urns(uint)" 3)

read -p "Press enter to continue"
printf "\n\nNow calling skim on this addr's ilk and urn. \n"

seth send $MCD_END "skim(bytes32,address)" $(seth --from-ascii "ETH-B") $(seth call $CDP_MANAGER "urns(uint)" 3)

read -p "Press enter to continue"

printf "Check the urn; for which we are calling vat.urn(ink , art) After skimming\n"

seth call $MCD_VAT "urns(bytes32,address)(uint256,uint256)" $(seth --from-ascii "ETH-B")  $(seth call $CDP_MANAGER "urns(uint)" 3)

read -p "Press enter to continue"
printf "\n\n"

export balance=$(seth call $ETH "balanceOf(address)(uint)" 0x7D9ecE67ab918361b8b8Ad94113AC17f42BF9c12)
printf "Before balance of wrapped eth of ETH_FROM : $balance\n"
read -p "Press enter to continue"
printf "\nnow withdraw our excess collateral against no art against specific urn\n"

export freeETHcalldata=$(seth calldata 'freeGem(address,address,address,uint)' $CDP_MANAGER $MCD_JOIN_ETH_B $MCD_END 3 ) 
export myProxy=$(seth call $PROXYREGISTRY 'proxies(address)(address)' $ETH_FROM)

printf "\n$myProxy my proxy for calling freeGem of CDP_MANAGER\n"
seth send $myProxy 'execute(address,bytes memory)' $PROXY_ACTIONS_END $freeETHcalldata --gas 8000000 
read -p "Press enter to continue"


export balance=$(seth call $ETH "balanceOf(address)(uint)" $ETH_FROM)
printf "\nAfter balance of wrapped eth of ETH_FROM : $balance\n"
read -p "Press enter to continue"

printf "\n seth ls\n"

seth ls

read -p "Press enter to continue"

printf "\nCheck the urn; for which we are calling vat.urn(ink , art) After withdrawal\n"

seth call $MCD_VAT "urns(bytes32,address)(uint256,uint256)" $(seth --from-ascii "ETH-B")  $(seth call $CDP_MANAGER "urns(uint)" 3)

read -p "Press enter to continue"

printf "\nwithdrawing from wrappedETH\n"

seth send $ETH "withdraw(uint256)" $balance

read -p "Press enter to continue"

printf "\n seth ls\n"

seth ls


