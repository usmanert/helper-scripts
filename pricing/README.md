# pokeMedian.sh

In order to work these script
- ETH_FROM should be set
- private keys of signers should be imported using `ethsign import`
- ETH_PASSWORD should point to valid password file. 
- ETH_GAS=30000000


This script will sign pricing data and call median.poke
- ./pokeMedian.sh $VAL_ETH ETHUSD "1667474316\n1667474316\n1667474316" "500\n1000\n1500"
- ./pokeMedian.sh $VAL_BTC BTCUSD "1667474316\n1667474316\n1667474316" "5000\n10000\n15000"


# setOSMPrice.sh

This script will sign pricing data and call median.poke, then call MegaPoker.poke and then wait for OSM_DEALY after that call PIP.poke
- ./setOSMPrice.sh $VAL_ETH $PIP_ETH ETHUSD 960
- ./setOSMPrice.sh $VAL_BTC $PIP_BTC ETHUSD 1860


# cronjobs

- */15 * * * * ./setOSMPrice.sh $VAL_ETH $PIP_ETH ETHUSD 960 >> ~/OSM_PRICE_UPDATE_ETH.log 2>&1
- */30 * * * * ./setOSMPrice.sh $VAL_BTC $PIP_BTC ETHUSD 1860 >> ~/OSM_PRICE_UPDATE_BTC.log 2>&1