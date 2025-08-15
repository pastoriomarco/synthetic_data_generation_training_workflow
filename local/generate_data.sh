#!/bin/bash
set -euo pipefail

# This is the path where Isaac Sim is installed which contains the python.sh script
ISAAC_SIM_PATH="/home/tndlux/isaacsim/_build/linux-x86_64/release"

## Go to location of the SDG script
cd ../td_sdg
SCRIPT_PATH="${PWD}/standalone_td_sdg.py"
OUTPUT_WAREHOUSE="${PWD}/td_data/distractors_warehouse"
OUTPUT_ADDITIONAL="${PWD}/td_data/distractors_additional"
OUTPUT_NO_DISTRACTORS="${PWD}/td_data/no_distractors"


## Go to Isaac Sim location for running with ./python.sh
cd $ISAAC_SIM_PATH

echo "Starting Data Generation"  

./python.sh $SCRIPT_PATH --height 544 --width 960 --num_frames 2000 --distractors warehouse --data_dir $OUTPUT_WAREHOUSE

#./python.sh $SCRIPT_PATH --height 544 --width 960 --num_frames 2000 --distractors additional --data_dir $OUTPUT_ADDITIONAL

#./python.sh $SCRIPT_PATH --height 544 --width 960 --num_frames 1000 --distractors None --data_dir $OUTPUT_NO_DISTRACTORS


