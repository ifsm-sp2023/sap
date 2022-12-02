# Vectre (Verifying Spectre) 2022

# Models directory

```
project
│   README.md
│   run_poc_example_bmc.sh                      - script for proving secure speculation on POC examples using BMC
│   run_poc_example_bmc_pc.sh                   - script for proving secure speculation on POC examples using BMC with the partitioned cache model (all examples should verify successfully)
│   run_poc_example_bmc_tplru_pc.sh             - script for proving secure speculation on POC examples using BMC with the shared tree-PLRU partitioned cache
│   run_poc_example_ind.sh                      - script for proving secure speculation on POC examples using induction
│   run_riscv_example.sh                        - script for proving secure speculation on the RISC-V example using BMC  
└───
```

### Running the examples

To run the examples using bounded model checking, specify the name of the attack in programs and run in the root directory. For example:

```
./scripts/run_poc_example_bmc.sh spectre_v1
```

For inductive model checking, additionally specify the atomic block being executed:

```
./scripts/run_poc_example_ind.sh spectre_v1 blockA
```

For an example that uses the (stub) RISC-V instruction semantics, refer to
```
./scripts/run_riscv_example.sh
```

