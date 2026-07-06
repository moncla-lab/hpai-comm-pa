#!/bin/bash

# Output directory
output_dir="log_combined"
mkdir -p "$output_dir"

# Set path to logcombiner and options
logcombiner=/Applications/BEAST\ v1.10.4/bin/logcombiner  # Use full path if needed
burnin=100

# Collect all .trees files, group by filename
find . -type f -name "*.trees" | while read -r file; do
    basename=$(basename "$file")
    echo "$basename"
done | sort | uniq | while read -r trees_file; do

    # Find all instances of this file
    matching_files=$(find . -type f -name "$trees_file")
    count=$(echo "$matching_files" | wc -l)

    if [ "$count" -gt 1 ]; then
        echo "Combining $count files named $trees_file..."

        # Prepare output path
        output_path="$output_dir/$trees_file"

        # Combine the files
        "$logcombiner" -trees -resample 200000 -burnin $burnin $matching_files "$output_path"

        echo "Output written to $output_path"
    else
        echo "Skipping $trees_file — only one instance found."
    fi
done

echo "All done."
