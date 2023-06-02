#!/usr/bin/env bash

set -e

# setting environment variables
source ./env

# shellcheck source=lib/common.sh
. "../lib/common.sh"

# initialize environment variables
MCD_CAT=$(getAddressFromChangelog "MCD_CAT")
MCD_VAT=$(getAddressFromChangelog "MCD_VAT")
MCD_JUG=$(getAddressFromChangelog "MCD_JUG")
MCD_SPOT=$(getAddressFromChangelog "MCD_SPOT")
MCD_PAUSE=$(getAddressFromChangelog "MCD_PAUSE")
MCD_PAUSE_PROXY=$(getAddressFromChangelog "MCD_PAUSE_PROXY")
MCD_ADM=$(getAddressFromChangelog "MCD_ADM")
MCD_END=$(getAddressFromChangelog "MCD_END")
MCD_JOIN_DAI=$(getAddressFromChangelog "MCD_JOIN_DAI")
MCD_DEPLOY=$(getAddressFromChangelog "MCD_DEPLOY")
MCD_DOG=$(getAddressFromChangelog "MCD_DOG")
CLIPPER_MOM=$(getAddressFromChangelog "CLIPPER_MOM")

eval "export MCD_VAT=${MCD_VAT}"
eval "export MCD_CAT=${MCD_CAT}"
eval "export MCD_VAT=${MCD_VAT}"
eval "export MCD_JUG=${MCD_JUG}"
eval "export MCD_SPOT=${MCD_SPOT}"
eval "export MCD_PAUSE=${MCD_PAUSE}"
eval "export MCD_PAUSE_PROXY=${MCD_PAUSE_PROXY}"
eval "export MCD_ADM=${MCD_ADM}"
eval "export MCD_END=${MCD_END}"
eval "export MCD_JOIN_DAI=${MCD_JOIN_DAI}"
eval "export MCD_DEPLOY=${MCD_DEPLOY}"
eval "export MCD_DOG=${MCD_DOG}"


log "Environment variables initiallized!"

# Collateral Type
ILK="$(seth --to-bytes32 "$(seth --from-ascii "USDT-A")")"

# Deploy Values or Medians
tokens=$(jq -r ".tokens | keys_unsorted[]" "$CONFIG_FILE")
for token in $tokens; do
    pipAddr=$(jq -r ".tokens.${token} | .import.val | values" "$CONFIG_FILE")
    if [[ "$pipAddr" == "" ]]; then
        type=$(jq -r ".tokens.${token} | .pipDeploy | .type | values" "$CONFIG_FILE")
        # Deploy Medianizer as Feed
        if [[ "$type" == "median" ]]; then
            contract=$(dappCreate testchain-medians "Median${token}GSU")
            eval "export VAL_${token}=${contract}"
            logAddr "VAL_${token}" "$(eval "echo ${contract}")"
            signers=$(jq -r ".tokens.${token} | .pipDeploy | .signers | .[]" "$CONFIG_FILE")
            # Approve oracle price feed providers
            allsigners=()
            for signer in $signers; do
                allsigners+=("${signer}")
            done
            sethSend "$(eval echo "\$VAL_${token}")" 'lift(address[] memory)' "[$(join "${allsigners[@]}")]"
            # Set quorum for Medianizer
            quorum=$(jq -r ".tokens.${token} | .pipDeploy | .quorum" "$CONFIG_FILE")
            sethSend "$(eval echo "\$VAL_${token}")" 'setBar(uint256)' "$(seth --to-uint256 "$quorum")"
        fi
        # Deploy DSValue as Feed
        if [[ "${type}" == "value" ]]; then
            contract=$(dappCreate ds-value DSValue)
            eval "export VAL_${token}=${contract}"
            logAddr "VAL_${token}" "$(eval "echo ${contract}")"
        fi
    else
        eval "export VAL_${token}=${pipAddr}"
        copy osm
        copy testchain-medians
        # logAddr "VAL_${token}" "$pipAddr"
    fi
    eval "export PIP_${token}=\$VAL_${token}"
done

# Deploy Collaterals
"./deploy-ilks"
. "$OUT_DIR/load-ilks-addr-temp"

for token in $tokens; do
    ILKS_VARS+=",
    \"${token}\": \"$(seth --to-checksum-address "$(eval echo "\$${token}")")\""
    if [[ "$(eval echo "\$VAL_${token}")" != "" ]]; then
    ILKS_VARS+=",
    \"VAL_${token}\": \"$(seth --to-checksum-address "$(eval echo "\$VAL_${token}")")\""
    fi
    ILKS_VARS+=",
    \"PIP_${token}\": \"$(seth --to-checksum-address "$(eval echo "\$PIP_${token}")")\""
    ilks=$(jq -r ".tokens.${token}.ilks | keys_unsorted[]" "$CONFIG_FILE")
    for ilk in $ilks; do
    ILKS_VARS+=",
    \"MCD_JOIN_${token}_${ilk}\": \"$(eval echo "\$MCD_JOIN_${token}_${ilk}")\""

    flipDeploy="$(jq ".tokens.${token}.ilks.${ilk} | .flipDeploy!=null" "$CONFIG_FILE")"
    if [[ "$flipDeploy" == true ]]; then
    ILKS_VARS+=",
    \"MCD_FLIP_${token}_${ilk}\": \"$(seth --to-checksum-address "$(eval echo "\$MCD_FLIP_${token}_${ilk}")")\""
    else
    ILKS_VARS+=",
    \"MCD_CLIP_${token}_${ilk}\": \"$(seth --to-checksum-address "$(eval echo "\$MCD_CLIP_${token}_${ilk}")")\""
    ILKS_VARS+=",
    \"MCD_CLIP_CALC_${token}_${ilk}\": \"$(seth --to-checksum-address "$(eval echo "\$MCD_CLIP_CALC_${token}_${ilk}")")\""
    fi
    done
done

cat > "$OUT_DIR"/addresses.json <<EOF
{
    "DEPLOYER": "$(seth --to-checksum-address "$ETH_FROM")",
    "CHANGELOG": "$CHANGELOG"
    $ILKS_VARS
}
EOF

./set-ilks-osm
./set-pips-rights

# 10000000000000000000000 - 9999731584745646920910
# 10000000000000000000000 - 9999724026640142470544

# 0.16 + 0.56