rm -f log


# RUN RISCV EXAMPLE(S)
echo "========================================================="
echo "RISCV BMC"
echo "========================================================="
echo "Running riscv example"
res=`./scripts/run_riscv_example.sh`
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "riscv bmc spectre_v1 failed"
    exit 1
fi


# RUN POC EXAMPLES USING BMC AGAINST CACHE ADVERSARY
echo "========================================================="
echo "POC BMC (L1D CACHE ADVERSARY)"
echo "========================================================="
echo "Running poc bmc spectre_v1_no_paging"
res=`./scripts/run_poc_example_bmc.sh spectre_v1_no_paging`
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc spectre_v1_no_paging failed"
    exit 1
fi
echo "Running poc bmc spectre_v1 (paging)"
res=`./scripts/run_poc_example_bmc.sh spectre_v1`
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc spectre_v1 failed"
    exit 1
fi
echo "Running poc bmc spectre_v2"
res=`./scripts/run_poc_example_bmc.sh spectre_v2`
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc spectre_v2 failed"
    exit 1
fi
echo "Running poc bmc spectre_v4"
res=`./scripts/run_poc_example_bmc.sh spectre_v4`
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc spectre_v4 failed"
    exit 1
fi
echo "Running poc bmc meltdown"
res=`./scripts/run_poc_example_bmc.sh meltdown`
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc meltdown failed"
    exit 1
fi
echo "Running poc bmc foreshadow"
res=`./scripts/run_poc_example_bmc.sh foreshadow`
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc foreshadow failed"
    exit 1
fi

# RUN POC EXAMPLES USING TLB ADVERSARY
echo "========================================================="
echo "POC BMC (TLB ADVERSARY)"
echo "========================================================="
echo "Running poc bmc spectre_v1_no_paging"
res=`./scripts/run_poc_example_bmc_tlb_adversary.sh spectre_v1`
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc spectre_v1 failed (tlb adv)"
    exit 1
fi

# RUN POC EXAMPLES WITH BMC AND CACHE PARTITIONING
echo "========================================================="
echo "POC BMC CACHE PARTITIONED"
echo "========================================================="
echo "Running poc bmc spectre_v1"
res=`./scripts/run_poc_example_bmc_partitioned_cache.sh spectre_v1_no_paging`
if [[ "$res" != *"0 assertions failed"* ]]; then
    echo "poc bmc spectre_v1 failed"
    exit 1
fi
echo "Running poc bmc spectre_v2"
res=`./scripts/run_poc_example_bmc_partitioned_cache.sh spectre_v2`
if [[ "$res" != *"0 assertions failed"* ]]; then
    echo "poc bmc spectre_v2 failed"
    exit 1
fi
echo "Running poc bmc spectre_v4"
res=`./scripts/run_poc_example_bmc_partitioned_cache.sh spectre_v4`
if [[ "$res" != *"0 assertions failed"* ]]; then
    echo "poc bmc spectre_v4 failed"
    exit 1
fi
echo "Running poc bmc meltdown"
res=`./scripts/run_poc_example_bmc_partitioned_cache.sh meltdown`
if [[ "$res" != *"0 assertions failed"* ]]; then
    echo "poc bmc meltdown failed"
    exit 1
fi
echo "Running poc bmc foreshadow"
res=`./scripts/run_poc_example_bmc_partitioned_cache.sh foreshadow`
if [[ "$res" != *"0 assertions failed"* ]]; then
    echo "poc bmc foreshadow failed"
    exit 1
fi


# RUN POC EXAMPLES WITH BMC AND CACHE PARTITIONING
echo "========================================================="
echo "POC BMC CACHE PARTITIONED (DAWG / METADATA PARTITIONED / VIPT)"
echo "========================================================="
echo "Running poc bmc spectre_v1 no paging (DAWG cache)"
res=`./scripts/run_poc_example_bmc_dawg_partitioned_cache.sh spectre_v1_no_paging`
if [[ "$res" != *"0 assertions failed"* ]]; then
    echo "poc bmc spectre_v1 (DAWG cache) failed"
    exit 1
fi
echo "Running poc bmc spectre_v1 (DAWG cache)"
res=`./scripts/run_poc_example_bmc_dawg_partitioned_cache.sh spectre_v1`
if [[ "$res" != *"0 assertions failed"* ]]; then
    echo "poc bmc spectre_v1 (DAWG cache) failed"
    exit 1
fi
echo "Running poc bmc spectre_v2 (DAWG cache)"
res=`./scripts/run_poc_example_bmc_dawg_partitioned_cache.sh spectre_v2`
if [[ "$res" != *"0 assertions failed"* ]]; then
    echo "poc bmc spectre_v2 (DAWG cache) failed"
    exit 1
fi
echo "Running poc bmc spectre_v4 (DAWG cache)"
res=`./scripts/run_poc_example_bmc_dawg_partitioned_cache.sh spectre_v4`
if [[ "$res" != *"0 assertions failed"* ]]; then
    echo "poc bmc spectre_v4 (DAWG cache) failed"
    exit 1
fi
echo "Running poc bmc meltdown (DAWG cache)"
res=`./scripts/run_poc_example_bmc_dawg_partitioned_cache.sh meltdown`
if [[ "$res" != *"0 assertions failed"* ]]; then
    echo "poc bmc meltdown (DAWG cache) failed"
    exit 1
fi
echo "Running poc bmc foreshadow (DAWG cache)"
res=`./scripts/run_poc_example_bmc_dawg_partitioned_cache.sh foreshadow`
if [[ "$res" != *"0 assertions failed"* ]]; then
    echo "poc bmc foreshadow (DAWG cache) failed"
    exit 1
fi

# RUN POC EXAMPLES WITH BMC AND CACHE PARTITIONING
echo "========================================================="
echo "POC BMC LINE FILL BUFFER"
echo "========================================================="
echo "Running poc bmc mds"
res=`./scripts/run_poc_example_bmc_lfb.sh mds`
if [[ "$res" != *"1 assertions failed"* ]]; then
    echo "poc bmc mds failed"
    exit 1
fi



