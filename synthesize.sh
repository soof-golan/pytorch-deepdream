#!/usr/bin/env bash

# Get the number of parallel processes from the command line
N="$1"

# Check if N is provided and is a positive integer
if ! [[ "$N" =~ ^[0-9]+$ ]]; then
  echo "Please provide a positive integer for the number of parallel processes."
  exit 1
fi

# Function to run deepdream.py on a given folder
run_deepdream() {
  python deepdream.py --input "wider/images/$1" --layers_to_use layer1 layer2 --model_name RESNET50
}

# Export the function so that it's available to parallel
export -f run_deepdream

# Use find to get all the subdirectories under wider/images and run the above function in parallel
find wider/images -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | parallel --verbose -j "$N" run_deepdream
