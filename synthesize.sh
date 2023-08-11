#!/usr/bin/env bash

# This is not recursive, so you need to run it for each subdirectory
python deepdream.py --input wider/images/0--Parade/ --layers_to_use layer1 layer2 --model_name RESNET50

