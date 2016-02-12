#!/bin/bash
IP_ADDR=$1
NUM_SPAWNS=$2
SESSION=$3
TOPIC=$4
tmux new-session -s $SESSION -n bash -d
for ID in `seq 1 $NUM_SPAWNS`;
do
    echo $ID
    tmux new-window -t $ID
    tmux send-keys -t $SESSION:$ID 'python producer.py '"$IP_ADDR"' '"$TOPIC"' '"$ID"' -d 250' C-m
done