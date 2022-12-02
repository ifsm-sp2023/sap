# SP 2023

# Models directory

### Directory structure

```
project
│   README.md
│   architectural.ucl       - model of architectural state and related procedures    
│   common.ucl              - module containing common types, (UF) functions, constants
│   imports.ucl             - import statements for all modules
│   main_common.ucl         - the main proof script for checking observational equivalence / secure speculation
│   platform_common.ucl     - platform module with axioms common to all proofs 
│
└───adversary_models        - varying adversary models (e.g. L1D cache)
│   │   cache_adversary.ucl
│   
└───instruction_semantics   - instruction semantics (including changes to hardware and microarchitectural state)
│   │   riscv.ucl           - stub for RISC-V instruction semantics
│   │   simple.ucl          - "Simple" instruction semantics
│
└───microarchitecture       - models of microarchitectural components
│   │   abs_btb.ucl
│   │   abs_cache.ucl
│   │   abs_part_cache.ucl
│   │   abs_pt.ucl
│   │   tree_plru_part_cache.ucl
└───
```

