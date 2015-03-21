#!/usr/bin/env sh
# Compute the mean image from the training leveldb
# N.B. this is available in data/ilsvrc12

echo "compute train image mean"
 ./build/tools/compute_image_mean examples/kyl/LFW/train_leveldb \
  examples/kyl/LFW/train_mean.binaryproto


#echo "compute val image mean"
# ./build/tools/compute_image_mean examples/kyl/LFW/val_leveldb \
#  examples/kyl/LFW/val_mean.binaryproto


echo "Done."
