- first run triggerESM.sh to trigger ESM
- second step run cageilk.sh for calling cage on each ilk
- third step run esm_excess.sh to withdraw excess collateral
- fourth run redeemDaiProxy.sh after 20 min

* run each command of the mentioned files above.

# Add Collateral

First setup dss-deploy script and run a test run to get these variable
 - dapp0_31_1
 - DAPP_LIB
 - BIN_DIR
 - BIN_DIR
 - LIBEXEC_DIR

update env and config file

run `./addCollateral` inside collateral folder