#!bash

SEED=1
NUM_EPOCHS=5
BATCH_SIZE=16
GRADIENT_ACC_STEPS=1
BATCH_SIZE_PER_GPU=$(( $BATCH_SIZE*$GRADIENT_ACC_STEPS ))
LEARN_RATE=0.00001
WARMUP=0.06
WEIGHT_DECAY=0.1

MODEL='PlanTL-GOB-ES/roberta-base-bne'
OUTPUT_DIR='../output/bne-base'
LOGGING_DIR='../tb/bne-base'
DIR_NAME='conll2002'_${BATCH_SIZE_PER_GPU}_${WEIGHT_DECAY}_${LEARN_RATE}_$(date +'%m-%d-%y_%H-%M')
CACHE_DIR='../cache'

export MPLCONFIGDIR=$CACHE_DIR/$DIR_NAME/matplotlib
export HF_HOME=$CACHE_DIR/$DIR_NAME/huggingface
rm -rf $MPLCONFIGDIR

python ./run_ner.py --model_name_or_path $MODEL --seed $SEED \
                                         --dataset_script_path ../data_scripts/conll2002_repo.py --dataset_config_name es \
                                         --task_name ner --do_train \
                                         --num_train_epochs $NUM_EPOCHS --gradient_accumulation_steps $GRADIENT_ACC_STEPS --per_device_train_batch_size $BATCH_SIZE \
                                         --learning_rate $LEARN_RATE \
                                         --warmup_ratio $WARMUP --weight_decay $WEIGHT_DECAY \
                                         --output_dir $OUTPUT_DIR/$DIR_NAME --overwrite_output_dir \
                                         --logging_dir $LOGGING_DIR/$DIR_NAME --logging_strategy epoch \
                                         --cache_dir $CACHE_DIR/$DIR_NAME # --overwrite_cache
                                         
                
