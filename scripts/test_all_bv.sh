rm -f log
rm stats
TIMEFORMAT=%R

# RUN RISCV EXAMPLE(S)

echo "========================================================="
echo "BITVECTOR MODELS"
echo "========================================================="

#echo "========================================================="
#echo "RISCV BMC"
#echo "========================================================="
#echo "Running riscv example"
#res=`./scripts/run_riscv_example_bv.sh`
#if [[ "$res" != *"1 assertions failed"* ]]; then
#    echo "riscv bmc spectre_v1 failed"
#    exit 1
#fi


# RUN POC EXAMPLES USING BMC AGAINST CACHE ADVERSARY
echo "========================================================="
echo "POC BMC (L1D CACHE ADVERSARY)"
echo "========================================================="

echo "Running poc bmc spectre_v1"
start=`gdate +%s%3N`
res=`./scripts/run_poc_example_bmc_bv.sh cache spectre_v1`
end=`gdate +%s%3N`
echo "spectre v1, $((end-start))" >> stats
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc spectre_v1 failed"
    exit 1
fi

echo "Running poc bmc spectre_v2"
start=`gdate +%s%3N`
res=`./scripts/run_poc_example_bmc_bv.sh cache spectre_v2`
end=`gdate +%s%3N`
echo "spectre v2, $((end-start))" >> stats
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc spectre_v2 failed"
    exit 1
fi

echo "Running poc bmc spectre_v4"
start=`gdate +%s%3N`
res=`./scripts/run_poc_example_bmc_bv.sh cache spectre_v4`
end=`gdate +%s%3N`
echo "spectre v4, $((end-start))" >> stats
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc spectre_v4 failed"
    exit 1
fi

echo "Running poc bmc meltdown"
start=`gdate +%s%3N`
res=`./scripts/run_poc_example_bmc_bv.sh cache meltdown`
end=`gdate +%s%3N`
echo "meltdown, $((end-start))" >> stats
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc meltdown failed"
    exit 1
fi

echo "Running poc bmc foreshadow"
start=`gdate +%s%3N`
res=`./scripts/run_poc_example_bmc_bv.sh cache foreshadow`
end=`gdate +%s%3N`
echo "foreshadow, $((end-start))" >> stats
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc foreshadow failed"
    exit 1
fi

echo "Running poc bmc mds"
start=`gdate +%s%3N`
res=`./scripts/run_poc_example_bmc_bv.sh lfb mds`
end=`gdate +%s%3N`
echo "mds, $((end-start))" >> stats
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc mds failed"
    exit 1
fi

# RUN POC EXAMPLES USING TLB ADVERSARY
echo "========================================================="
echo "POC BMC (TLB ADVERSARY)"
echo "========================================================="
echo "Running poc bmc spectre_v1"
res=`./scripts/run_poc_example_bmc_bv.sh tlb spectre_v1`
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc spectre_v1 failed (tlb adv)"
    exit 1
fi

## RUN POC EXAMPLES WITH BMC AND CACHE PARTITIONING
#echo "========================================================="
#echo "POC BMC CACHE PARTITIONED"
#echo "========================================================="
#echo "Running poc bmc spectre_v1"
#res=`./scripts/run_poc_example_bmc_partitioned_cache_bv.sh cache spectre_v1`
#if [[ "$res" != *"0 assertions failed"* ]]; then
#    echo "poc bmc spectre_v1 failed"
#    exit 1
#fi
#echo "Running poc bmc spectre_v2"
#res=`./scripts/run_poc_example_bmc_partitioned_cache_bv.sh cache spectre_v2`
#if [[ "$res" != *"0 assertions failed"* ]]; then
#    echo "poc bmc spectre_v2 failed"
#    exit 1
#fi
#echo "Running poc bmc spectre_v4"
#res=`./scripts/run_poc_example_bmc_partitioned_cache_bv.sh cache spectre_v4`
#if [[ "$res" != *"0 assertions failed"* ]]; then
#    echo "poc bmc spectre_v4 failed"
#    exit 1
#fi
#echo "Running poc bmc meltdown"
#res=`./scripts/run_poc_example_bmc_partitioned_cache_bv.sh cache meltdown`
#if [[ "$res" != *"0 assertions failed"* ]]; then
#    echo "poc bmc meltdown failed"
#    exit 1
#fi
#echo "Running poc bmc foreshadow"
#res=`./scripts/run_poc_example_bmc_partitioned_cache_bv.sh cache foreshadow`
#if [[ "$res" != *"0 assertions failed"* ]]; then
#    echo "poc bmc foreshadow failed"
#    exit 1
#fi
#
#
## RUN POC EXAMPLES WITH BMC AND CACHE PARTITIONING
#echo "========================================================="
#echo "POC BMC CACHE PARTITIONED (DAWG / METADATA PARTITIONED / VIPT)"
#echo "========================================================="
#echo "Running poc bmc spectre_v1 (DAWG cache)"
#res=`./scripts/run_poc_example_bmc_dawg_partitioned_cache_bv.sh cache spectre_v1`
#if [[ "$res" != *"0 assertions failed"* ]]; then
#    echo "poc bmc spectre_v1 (DAWG cache) failed"
#    exit 1
#fi
#echo "Running poc bmc spectre_v2 (DAWG cache)"
#res=`./scripts/run_poc_example_bmc_dawg_partitioned_cache_bv.sh cache spectre_v2`
#if [[ "$res" != *"0 assertions failed"* ]]; then
#    echo "poc bmc spectre_v2 (DAWG cache) failed"
#    exit 1
#fi
#echo "Running poc bmc spectre_v4 (DAWG cache)"
#res=`./scripts/run_poc_example_bmc_dawg_partitioned_cache_bv.sh cache spectre_v4`
#if [[ "$res" != *"0 assertions failed"* ]]; then
#    echo "poc bmc spectre_v4 (DAWG cache) failed"
#    exit 1
#fi
#echo "Running poc bmc meltdown (DAWG cache)"
#res=`./scripts/run_poc_example_bmc_dawg_partitioned_cache_bv.sh cache meltdown`
#if [[ "$res" != *"0 assertions failed"* ]]; then
#    echo "poc bmc meltdown (DAWG cache) failed"
#    exit 1
#fi
#echo "Running poc bmc foreshadow (DAWG cache)"
#res=`./scripts/run_poc_example_bmc_dawg_partitioned_cache_bv.sh cache foreshadow`
#if [[ "$res" != *"0 assertions failed"* ]]; then
#    echo "poc bmc foreshadow (DAWG cache) failed"
#    exit 1
#fi

