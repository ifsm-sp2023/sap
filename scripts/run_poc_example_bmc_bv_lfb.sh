cd models_bv
uclid -M common.ucl architectural.ucl microarchitecture/abs_lfb.ucl microarchitecture/abs_sb.ucl microarchitecture/abs_tlb.ucl microarchitecture/abs_pht.ucl microarchitecture/abs_cache.ucl microarchitecture/abs_pt.ucl microarchitecture/abs_btb.ucl instruction_semantics/simple_isa.ucl instruction_semantics/simple_lfb.ucl instruction_semantics/simple_march_interface.ucl programs/poc/$2/bmc.ucl programs/poc/$2/victim_prog.ucl programs/poc/$2/high_comp.ucl adversary_models/$1_adversary.ucl imports.ucl platform_common.ucl main_common.ucl programs/bmc_common.ucl
cd ..
