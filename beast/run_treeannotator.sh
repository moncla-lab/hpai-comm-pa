#!/bin/bash

##usage: run_treeannotator.sh /path/to/your/input_directory

# Check if input directory was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <input_directory>"
  exit 1
fi

input_dir="$1"

# Find all .trees files in the input directory and its subdirectories
find "$input_dir" -type f -name "*.trees" | while read file; do
    dir=$(dirname "$file")  # Get directory of the file
    base_name=$(basename "$file" .trees)
    
    # Create mcc_trees subdirectory if it doesn't exist
    output_dir="$dir/mcc_trees"
    mkdir -p "$output_dir"

    output_file="$output_dir/${base_name}.mcc.tree"

    echo "Processing $file..."
    /Applications/BEAST\ v1.10.4/bin/treeannotator -heights keep -burnin 1000000 "$file" "$output_file"
    echo "Output saved to $output_file"
done

echo "Processing complete."
