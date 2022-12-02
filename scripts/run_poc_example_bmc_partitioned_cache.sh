cd models
uclid -M common.ucl architectural.ucl microarchitecture/abs_sb.ucl microarchitecture/abs_tu.ucl microarchitecture/abs_tlb.ucl microarchitecture/abs_pht.ucl microarchitecture/abs_part_cache.ucl microarchitecture/abs_pt.ucl microarchitecture/abs_btb.ucl instruction_semantics/simple.ucl programs/poc/$1/bmc.ucl programs/poc/$1/victim_prog.ucl programs/poc/$1/high_comp.ucl adversary_models/cache_adversary.ucl imports.ucl platform_common.ucl main_common.ucl
cd ..
