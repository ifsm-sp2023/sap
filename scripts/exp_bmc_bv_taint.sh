rm -f log
rm stats_tss
TIMEFORMAT=%R

# RUN RISCV EXAMPLE(S)

echo "========================================================="
echo "BITVECTOR MODELS"
echo "========================================================="


# RUN POC EXAMPLES USING BMC AGAINST CACHE ADVERSARY
echo "========================================================="
echo "POC BMC (L1D CACHE ADVERSARY)"
echo "========================================================="

echo "Running poc bmc spectre_v1"
start=`gdate +%s%3N`
res=`./scripts/run_poc_example_bmc_bv_taint.sh cache spectre_v1`
end=`gdate +%s%3N`
echo "spectre v1, $((end-start))" >> stats_tss
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc spectre_v1 failed"
    exit 1
fi

echo "Running poc bmc spectre_v2"
start=`gdate +%s%3N`
res=`./scripts/run_poc_example_bmc_bv_taint.sh cache spectre_v2`
end=`gdate +%s%3N`
echo "spectre v2, $((end-start))" >> stats_tss
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc spectre_v2 failed"
    exit 1
fi

echo "Running poc bmc spectre_v4"
start=`gdate +%s%3N`
res=`./scripts/run_poc_example_bmc_bv_taint.sh cache spectre_v4`
end=`gdate +%s%3N`
echo "spectre v4, $((end-start))" >> stats_tss
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc spectre_v4 failed"
    exit 1
fi

echo "Running poc bmc meltdown"
start=`gdate +%s%3N`
res=`./scripts/run_poc_example_bmc_bv_taint.sh cache meltdown`
end=`gdate +%s%3N`
echo "meltdown, $((end-start))" >> stats_tss
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc meltdown failed"
    exit 1
fi


echo "Running poc bmc lazy-fp"
start=`gdate +%s%3N`
res=`./scripts/run_poc_example_bmc_bv_reg_perm_taint.sh fp_cache lazy_fp`
end=`gdate +%s%3N`
echo "meltdown, $((end-start))" >> stats_tss
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc meltdown failed"
    exit 1
fi

echo "Running poc bmc foreshadow"
start=`gdate +%s%3N`
res=`./scripts/run_poc_example_bmc_bv_taint.sh cache foreshadow`
end=`gdate +%s%3N`
echo "foreshadow, $((end-start))" >> stats_tss
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc foreshadow failed"
    exit 1
fi

echo "Running poc bmc lvi"
start=`gdate +%s%3N`
res=`./scripts/run_poc_example_bmc_bv_taint.sh cache lvi`
end=`gdate +%s%3N`
echo "lvi, $((end-start))" >> stats_tss
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc lvi failed"
    exit 1
fi

echo "Running poc bmc netspectre"
start=`gdate +%s%3N`
res=`./scripts/run_poc_example_bmc_bv_pc_taint.sh power_channel netspectre`
end=`gdate +%s%3N`
echo "mds, $((end-start))" >> stats_taint
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc netspectre failed"
    exit 1
fi

echo "Running poc bmc mds"
start=`gdate +%s%3N`
res=`./scripts/run_poc_example_bmc_bv_taint_lfb.sh cache mds`
end=`gdate +%s%3N`
echo "mds, $((end-start))" >> stats_taint
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc mds failed"
    exit 1
fi
