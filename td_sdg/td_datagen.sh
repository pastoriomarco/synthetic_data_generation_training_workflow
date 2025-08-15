#!/bin/bash

# This is the path where Isaac Sim is installed which contains the python.sh script
ISAAC_SIM_PATH='/isaac-sim'

echo "Starting Data Generation"  

cd $ISAAC_SIM_PATH

echo $PWD

./python.sh /isaac-sim/td_sdg/standalone_td_sdg.py --headless True --height 544 --width 960 --num_frames 2000 --distractors warehouse --data_dir /isaac-sim/td_sdg/td_data/distractors_warehouse

./python.sh /isaac-sim/td_sdg/standalone_td_sdg.py --headless True --height 544 --width 960 --num_frames 2000 --distractors additional --data_dir /isaac-sim/td_sdg/td_data/distractors_additional

./python.sh /isaac-sim/td_sdg/standalone_td_sdg.py --headless True --height 544 --width 960 --num_frames 1000 --distractors None --data_dir /isaac-sim/td_sdg/td_data/no_distractors

