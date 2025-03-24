#!/bin/bash

##### change here #####
task="1"
#task="2a"
#task="2b"
#task="3"
###### to here #########

# Get node id
hostname=$(hostname)
NODEID="${hostname:5:1}"
echo "node ID: $NODEID"

# CONSTANTS
GLUE_DIR="/proj/cos568proj2-PG0/glue_data"
TASK_NAME="RTE"
MASTER_IP=10.10.1.2
MASTER_PORT=1024

# define and create output directory
output_dir="/proj/cos568proj2-PG0/groups/hh2605/COS568-DistLM-SP25/outputs/$TASK_NAME/task$task/node_$NODEID" 
mkdir -p $output_dir

if [ $task == "1" ]; then
    cd ./task1
    python3 run_glue.py \
      --model_type bert \
      --model_name_or_path bert-base-cased \
      --task_name $TASK_NAME \
      --do_train \
      --do_eval \
      --data_dir $GLUE_DIR/$TASK_NAME \
      --max_seq_length 128 \
      --per_device_train_batch_size 64 \
      --learning_rate 2e-5 \
      --num_train_epochs 3 \
      --output_dir $output_dir \
      --overwrite_output_dir \

fi 

if [ $task == "2a" ]; then
    cd  ./task2a
    python run_glue.py \
      --model_type bert \
      --model_name_or_path bert-base-cased \
      --task_name $TASK_NAME \
      --do_train \
      --data_dir $GLUE_DIR/$TASK_NAME \
      --max_seq_length 128 \
      --per_device_train_batch_size 16 \
      --learning_rate 2e-5 \
      --num_train_epochs 1 \
      --output_dir $output_dir \
      --overwrite_output_dir \
      --total_batch_size 64 \
      --master_ip $MASTER_IP \
      --master_port $MASTER_PORT \
      --world_size 4 \
      --local_rank $NODEID \

fi

if [ $task == "2b" ]; then
    cd ./task2b
    python run_glue.py \
      --model_type bert \
      --model_name_or_path bert-base-cased \
      --task_name $TASK_NAME \
      --do_train \
      --data_dir $GLUE_DIR/$TASK_NAME \
      --max_seq_length 128 \
      --per_device_train_batch_size 16 \
      --learning_rate 2e-5 \
      --num_train_epochs 1 \
      --output_dir $output_dir \
      --overwrite_output_dir \
      --total_batch_size 64 \
      --master_ip $MASTER_IP \
      --master_port $MASTER_PORT \
      --world_size 4 \
      --local_rank $NODEID \

fi

if [ $task == "3" ]; then
    cd ./task3
    python run_glue.py \
      --model_type bert \
      --model_name_or_path bert-base-cased \
      --task_name $TASK_NAME \
      --do_train \
      --data_dir $GLUE_DIR/$TASK_NAME \
      --max_seq_length 128 \
      --per_device_train_batch_size 16 \
      --learning_rate 2e-5 \
      --num_train_epochs 1 \
      --output_dir $output_dir \
      --overwrite_output_dir \
      --total_batch_size 64 \
      --master_ip $MASTER_IP \
      --master_port $MASTER_PORT \
      --world_size 4 \
      --local_rank $NODEID \

fi 

echo "Done!"
