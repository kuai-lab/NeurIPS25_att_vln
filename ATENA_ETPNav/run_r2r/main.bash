export GLOG_minloglevel=2
export MAGNUM_LOG=quiet

flag1=" --exp_name release_r2r
      --run-type eval
      --exp-config run_r2r/iter_train.yaml
      --lr_pre 5e-07
      --lr_post 1e-8
      --bin_weight 0.1 
      --r_lambda 0.5 
      --active_criteria 0.0
      SIMULATOR_GPU_IDS [0]
      TORCH_GPU_IDS [0]
      GPU_NUMBERS 1
      NUM_ENVIRONMENTS 1
      TASK_CONFIG.SIMULATOR.HABITAT_SIM_V0.ALLOW_SLIDING True
      EVAL.CKPT_PATH_DIR data/logs/checkpoints/release_r2r/ckpt.iter12000.pth
      IL.back_algo control
      "


mode=$1
case $mode in 
      eval)
      echo "###### eval mode ######"
      python -m torch.distributed.launch --nproc_per_node=1 --master_port $2 run_atena.py $flag1
esac