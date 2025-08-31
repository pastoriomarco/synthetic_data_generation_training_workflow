#~/isaacsim/_build/linux-x86_64/release/python.sh ~/workspaces/sdg/src/synthetic_data_generation_training_workflow/td_sdg/standalone_td_sdg.py   --headless True --height 544 --width 960 --num_frames 20   --distractors None   --data_dir ./tmp_out

#alternative:

bash ~/isaacsim/_build/linux-x86_64/release/python.sh ~/workspaces/sdg/src/synthetic_data_generation_training_workflow/td_sdg/standalone_td_sdg.py   --headless True   --num_frames 1000   --width 640 --height 640   --distractors None   --data_dir ~/synthetic_out/train

bash ~/isaacsim/_build/linux-x86_64/release/python.sh ~/workspaces/sdg/src/synthetic_data_generation_training_workflow/td_sdg/standalone_td_sdg.py   --headless True   --num_frames 300   --width 640 --height 640   --distractors None   --data_dir ~/synthetic_out/test

bash ~/isaacsim/_build/linux-x86_64/release/python.sh ~/workspaces/sdg/src/synthetic_data_generation_training_workflow/td_sdg/standalone_td_sdg.py   --headless True   --num_frames 300   --width 640 --height 640   --distractors None   --data_dir ~/synthetic_out/val


ROOT=/home/tndlux/synthetic_out
mkdir -p $ROOT/images/train $ROOT/images/val $ROOT/images/test
mkdir -p $ROOT/labels/train $ROOT/labels/val $ROOT/labels/test

# Symlink (or copy) all RGB images from Replicator folders into images/{split}
# If your images are PNG change the extension accordingly; add -r if nested.
find $ROOT/train/Replicator -type f \( -iname '*.png' -o -iname '*.jpg' \) -exec ln -s {} $ROOT/images/train/ \;
find $ROOT/val/Replicator   -type f \( -iname '*.png' -o -iname '*.jpg' \) -exec ln -s {} $ROOT/images/val/ \;
find $ROOT/test/Replicator  -type f \( -iname '*.png' -o -iname '*.jpg' \) -exec ln -s {} $ROOT/images/test/ \;

#python coco2yolo.py /home/tndlux/synthetic_out

cd /home/tndlux/workspaces/sdg/src/synthetic_data_generation_training_workflow/td_sdg
python coco2yolo.py /home/tndlux/synthetic_out
