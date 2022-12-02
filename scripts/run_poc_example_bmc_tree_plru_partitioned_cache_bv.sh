cd models_bv
uclid -M common.ucl architectural.ucl microarchitecture/abs_sb.ucl microarchitecture/tree_plru_part_cache.ucl microarchitecture/abs_pt.ucl microarchitecture/abs_btb.ucl instruction_semantics/simple.ucl programs/poc/$1/bmc.ucl programs/poc/$1/victim_prog.ucl programs/poc/$1/high_comp.ucl adversary_models/cache_adversary.ucl imports.ucl platform_common.ucl main_common.ucl programs/bmc_common.ucl
cd ..
