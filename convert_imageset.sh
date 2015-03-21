#!/usr/bin/env sh
# Create the imagenet lmdb inputs
# N.B. set the path to the imagenet train + val data dirs

TOOLS=build/tools/
SAVEDB=examples/kyl/LFW
TRAIN_DATA_ROOT=examples/kyl/LFW/train/
VAL_DATA_ROOT=examples/kyl/LFW/val/
ATTACH=examples/kyl/LFW

# Set RESIZE=true to resize the images to 256x256. Leave as false if images have
# already been resized using another tool.
RESIZE=true
if $RESIZE; then
  RESIZE_HEIGHT=256
  RESIZE_WIDTH=256
else
  RESIZE_HEIGHT=0
  RESIZE_WIDTH=0
fi

if [ ! -d "$TRAIN_DATA_ROOT" ]; then
  echo "Error: TRAIN_DATA_ROOT is not a path to a directory: $TRAIN_DATA_ROOT"
  echo "Set the TRAIN_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the ImageNet training data is stored."
  exit 1
fi

if [ ! -d "$VAL_DATA_ROOT" ]; then
  echo "Error: VAL_DATA_ROOT is not a path to a directory: $VAL_DATA_ROOT"
  echo "Set the VAL_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the ImageNet validation data is stored."
  exit 1
fi

if [ -d "$SAVEDB/DeepID2_train_lmdb" ]; then
  echo "Error: SAVEDB in the directory: $TRAIN_DATA_ROOT has exist! "  \
	"And the exist file will cause a error! So it should be delete!" 
  #sudo rm -rf $SAVEDB  
  echo "It has been deleted for the program must create a new SAVEDB file"
else
  echo "There is no $SAVEDB !"
fi

echo "Creating train lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle \
    $TRAIN_DATA_ROOT \
    $ATTACH/train.txt \
    $SAVEDB/train_leveldb

if [ -d "$SAVEDB/DeepID2_val_lmdb" ]; then
  echo "Error: SAVEDB in the directory: $TRAIN_DATA_ROOT has exist! "  \
	"And the exist file will cause a error! So it should be delete!" 
  #sudo rm -rf $SAVEDB  
  echo "It has been deleted for the program must create a new SAVEDB file"
else
  echo "There is no $SAVEDB !"
fi

echo "Creating val lmdb..."
GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle \
    $VAL_DATA_ROOT \
    $ATTACH/val.txt \
    $SAVEDB/val_leveldb

echo "Done."


#build/tools/convert_imageset --resize_height=0  --resize_width=0  --shuffle examples/kyl/train/ examples/kyl/attach.txt    examples/kyl/test


