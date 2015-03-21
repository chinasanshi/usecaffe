# train the net
echo "begin to train the net!"
./build/tools/caffe train --solver=examples/kyl/solver.prototxt
echo "done"
