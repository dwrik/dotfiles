#!/usr/bin/env bash

print_usage() {
    echo "Usage: darcula.sh <src_dir> [out_dir]"
    echo -e "\tsrc_dir  directory containing the source wallpapers"
    echo -e "\tout_dir  directory where modified wallpapers will be saved"
    exit 1
}

# get args
src_dir=$1
out_dir=$2

# print usage if no arg or not a directory
if [ ! -d "$src_dir" ]; then
    print_usage
fi

# init out_dir
[ -z "$out_dir" ] && out_dir="output"
mkdir -p "$out_dir"

# get list of src files
file_names=($(ls "$src_dir"))
total_files="${#file_names[@]}"
echo "Total files: $total_files"

# file counter
current_file_no=1

# process all images
for file_name in "${file_names[@]}"; do
    echo -ne "Processing file: $current_file_no of $total_files\r"
    (( current_file_no++ ))
    magick "$src_dir/$file_name" \
        -modulate 100,50 \
        -color-matrix "1.04 0.02 -0.01  0.02 0.98 0.02  -0.01 0.01 1.02" \
        -colorize 20,20,30 \
        "$out_dir/$file_name"
done

# completion message
echo -e "\nFinished! Processed images stored in $out_dir"
