#!/bin/bash
set -Eeuo pipefail

# CHANGE THESE ACCORDINGLY
#
# $1 is Ethereum RPC URL
# $2 is CHAINLOG address for Maker
export ETH_RPC_URL=$1
export CHAINLOG=$2

# ILKS to fetch information for
export ILKS=('ETH-A' 'ETH-B' 'ETH-C' 'WBTC-A' 'WBTC-B' 'WBTC-C')

# regexes
address_re='^0x[0-9a-fA-F]+$'
re='^[0-9]+$'

# Contract Addresses
export MCD_VOW=$(seth call $CHAINLOG "getAddress(bytes32)(address)" $(seth --from-ascii "MCD_VOW"))

if ! [[ $MCD_VOW =~ $address_re ]]; then
    return $MCD_VOW
fi

export MCD_VAT=$(seth call $CHAINLOG "getAddress(bytes32)(address)" $(seth --from-ascii "MCD_VAT"))
export MCD_FLOP=$(seth call $CHAINLOG "getAddress(bytes32)(address)" $(seth --from-ascii "MCD_FLOP"))
export MCD_FLAP=$(seth call $CHAINLOG "getAddress(bytes32)(address)" $(seth --from-ascii "MCD_FLAP"))
export MCD_CAT=$(seth call $CHAINLOG "getAddress(bytes32)(address)" $(seth --from-ascii "MCD_CAT"))
export MCD_DOG=$(seth call $CHAINLOG "getAddress(bytes32)(address)" $(seth --from-ascii "MCD_DOG"))
export MCD_JUG=$(seth call $CHAINLOG "getAddress(bytes32)(address)" $(seth --from-ascii "MCD_JUG"))
export MCD_POT=$(seth call $CHAINLOG "getAddress(bytes32)(address)" $(seth --from-ascii "MCD_POT"))
export MCD_CURE=$(seth call $CHAINLOG "getAddress(bytes32)(address)" $(seth --from-ascii "MCD_CURE"))
export MCD_END=$(seth call $CHAINLOG "getAddress(bytes32)(address)" $(seth --from-ascii "MCD_END"))
export MCD_ESM=$(seth call $CHAINLOG "getAddress(bytes32)(address)" $(seth --from-ascii "MCD_ESM"))
export MCD_FLASH=$(seth call $CHAINLOG "getAddress(bytes32)(address)" $(seth --from-ascii "MCD_FLASH"))
export MCD_SPOT=$(seth call $CHAINLOG "getAddress(bytes32)(address)" $(seth --from-ascii "MCD_SPOT"))
export MCD_IAM_AUTO_LINE=$(seth call $CHAINLOG "getAddress(bytes32)(address)" $(seth --from-ascii "MCD_IAM_AUTO_LINE"))
export CLIPPER_MOM=$(seth call $CHAINLOG "getAddress(bytes32)(address)" $(seth --from-ascii "CLIPPER_MOM"))
export MCD_PAUSE=$(seth call $CHAINLOG "getAddress(bytes32)(address)" $(seth --from-ascii "MCD_PAUSE"))

# Per ilk detail fetcher
ilk_details () {
    echo "---- ILK DETAILS: $1"
    ILK=$(seth --from-ascii $1 | seth --to-bytes32)
    VAT_ILK_DATA=$(seth call $MCD_VAT "ilks(bytes32)(uint256,uint256,uint256,uint256,uint256)" $ILK)
    SPOT_ILK_DATA=$(seth call $MCD_SPOT "ilks(bytes32)(address,uint256)" $ILK)
    AUTOLINE_DATA=$(seth call $MCD_IAM_AUTO_LINE "ilks(bytes32)(uint256,uint256,uint48,uint48,uint48)" $ILK)
    JUG_DATA=$(seth call $MCD_JUG "ilks(bytes32)(uint256,uint256)" $ILK)
    DOG_DATA=$(seth call $MCD_DOG "ilks(bytes32)(address,uint256,uint256,uint256)" $ILK)

    echo "mat: $(echo "$(echo "$SPOT_ILK_DATA" | sed -n 2p)/10^25" |bc)"
    echo "line: $(echo "$(echo "$VAT_ILK_DATA" | sed -n 4p)/10^45" |bc)"
    echo "dust: $(echo "$(echo "$VAT_ILK_DATA" | sed -n 5p)/10^45" |bc)"
    echo "autoline: $(echo "$(echo "$AUTOLINE_DATA" | sed -n 1p)/10^45" |bc)"
    echo "autolineGap: $(echo "$(echo "$AUTOLINE_DATA" | sed -n 2p)/10^45" |bc)"
    echo "autolineTtl: $(echo "$AUTOLINE_DATA" | sed -n 3p)"
    echo "duty: $(echo "$JUG_DATA" | sed -n 1p)"
    echo "clip_chop: $(echo "($(echo "$DOG_DATA" | sed -n 2p)/10^16)-100" |bc)"
    echo "clip_hole: $(echo "$(echo "$DOG_DATA" | sed -n 3p)/10^45" |bc)"

    CLIP=$(echo "$DOG_DATA" | sed -n 1p)
    echo "clip_chip: $(echo "scale=3;$(seth call $CLIP "chip()(uint256)")/10^16" | bc)"
    echo "clip_tip: $(echo "$(seth call $CLIP "tip()(uint192)")/10^45" | bc)"
    echo "clip_buf: $(echo "$(seth call $CLIP "buf()(uint256)")/10^25" | bc)"
    echo "clip_tail: $(seth call $CLIP "tail()(uint256)")"
    echo "clip_cusp: $(echo "$(seth call $CLIP "cusp()(uint256)")/10^25" | bc)"

    CALC=$(seth call $CLIP "calc()(address)")
    CALC_STEP=$(seth call $CALC "step()(uint256)")

    if [[ $CALC_STEP =~ $re ]]; then
        echo "calc_type: StairstepExponentialDecrease"
        echo "calc_step: $CALC_STEP"
        echo "calc_cut: $(echo "$(seth call $CALC "cut()(uint256)")/10^25" | bc)"
    else
        echo "calc_type: LinearDecrease"
        echo "calc_tau: $(seth call $CALC "tau()(uint256)")"
    fi

    CLIPPER_TOLERANCE=$(seth call $CLIPPER_MOM "tolerance(address)(uint256)" $CLIP)
    echo "cm_tolerance: $(echo "$CLIPPER_TOLERANCE / 10^25" | bc)"
}

# check variables
export LINE=$(echo "$(seth call $MCD_VAT "Line()(uint256)")/10^45" | bc)
echo "vat_line: $LINE"

if ! [[ $LINE =~ $re ]]; then
    return "can't get info"
fi

export WAIT=$(seth call $MCD_VOW "wait()(uint256)")
echo "vow_wait: $WAIT"

export DUMP=$(echo "$(seth call $MCD_VOW "dump()(uint256)") / 10^18" | bc)
echo "vow_dump: $DUMP"

export SUMP=$(echo "$(seth call $MCD_VOW "sump()(uint256)") / 10^45" | bc)
echo "vow_sump: $SUMP"

export BUMP=$(echo "$(seth call $MCD_VOW "bump()(uint256)") / 10^45" | bc)
echo "vow_bump: $BUMP"

export HUMP=$(echo "$(seth call $MCD_VOW "hump()(uint256)") / 10^45" | bc)
echo "vow_hump: $HUMP"

export CAT_BOX=$(echo "$(seth call $MCD_CAT "box()(uint256)") / 10^45" | bc)
echo "cat_box: $CAT_BOX"

export DOG_HOLE=$(echo "$(seth call $MCD_DOG "Hole()(uint256)") / 10^45" | bc)
echo "dog_hole: $DOG_HOLE"

export JUG_BASE=$(seth call $MCD_JUG "base()(uint256)")
echo "jug_base: $JUG_BASE"

export POT_DSR=$(echo "$(seth call $MCD_POT "dsr()(uint256)") / 10^18" | bc)
echo "pot_dsr: $POT_DSR"

export CURE_WAIT=$(seth call $MCD_CURE "wait()(uint256)")
echo "cure_wait: $CURE_WAIT"

export END_WAIT=$(seth call $MCD_END "wait()(uint256)")
echo "end_wait: $END_WAIT"

export ESM_MIN=$(echo "$(seth call $MCD_ESM "min()(uint256)")/10^18" | bc)
echo "esm_min: $ESM_MIN"

export FLAP_BEG=$(echo "$(seth call $MCD_FLAP "beg()(uint256)")/(10^16)%100" | bc)
echo "flap_beg: $FLAP_BEG"

export FLAP_TTL=$(seth call $MCD_FLAP "ttl()(uint256)")
echo "flap_ttl: $FLAP_TTL"

export FLAP_TAU=$(seth call $MCD_FLAP "tau()(uint256)")
echo "flap_tau: $FLAP_TAU"

export FLAP_LID=$(echo "$(seth call $MCD_FLAP "lid()(uint256)")/10^45" | bc)
echo "flap_lid: $FLAP_LID"

export FLOP_BEG=$(echo "$(seth call $MCD_FLOP "beg()(uint256)")/(10^16)%100" | bc)
echo "flop_beg: $FLOP_BEG"

export FLOP_PAD=$(echo "$(seth call $MCD_FLOP "pad()(uint256)")/(10^16)%100" | bc)
echo "flop_pad: $FLOP_PAD"

export FLOP_TTL=$(seth call $MCD_FLOP "ttl()(uint256)")
echo "flop_ttl: $FLOP_TTL"

export FLOP_TAU=$(seth call $MCD_FLOP "tau()(uint256)")
echo "flop_tau: $FLOP_TAU"

export FLASH_MAX=$(echo "$(seth call $MCD_FLASH "max()(uint256)")/10^18" | bc)
echo "flash_max: $FLASH_MAX"

export PAUSE_DELAY=$(seth call $MCD_PAUSE "delay()(uint256)")
echo "pause_delay: $PAUSE_DELAY"

for i in "${ILKS[@]}"
do
    ilk_details $i
done
