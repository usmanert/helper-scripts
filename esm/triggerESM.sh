printf "Exporting variables \n\n"


export ETH_FROM=0x6255b38a000973C16E72fDba4409b14dB6E53b05



export MIN=$(seth call $MCD_ESM "min()(uint256)") 
printf '\n\n   ***********************************\n'
sleep 1
printf " The threshold for ESM is $MIN in wad.\n"
printf " Now we have to approve $MIN to ESM's contract.\n Calling approve(address, uint)\n\n"
seth send $MCD_GOV "approve(address, uint256)" $MCD_ESM 100000000000000000000000 
read -p "Press enter to continue"
printf '\n\n   ***********************************\n'
printf "now we have to call join of ESM for depositting or Transfering MCD_GOV to the ESM\n\n"
seth send $MCD_ESM "join(uint256)"  100000000000000000000000
read -p "Press enter to continue"
printf '\n\n   ***********************************\n'
printf "checking the status of live of the END contract\n\n"
export live=$(seth call $MCD_END "live()(uint)") 
printf "end.live() = $live\n"
read -p "Press enter to continue"
printf '\n\n   ***********************************\n'
printf "now we have to call fire of ESM for triggering the ESM\n\n"
seth send $MCD_ESM "fire()" --gas 8080808
read -p "Press enter to continue"
printf '\n\n   ***********************************\n'

printf "checking the status of live of the END contract\n\n"
export live=$(seth call $MCD_END "live()(uint)")
printf "end.live() = $live\n"
printf "the cooldown period is $(seth call $MCD_END "wait()(uint256)")\n"
read -p "Press enter to continue"
