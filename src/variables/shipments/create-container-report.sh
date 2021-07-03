#!/bin/bash -x

# Create a report file for a single shipping container
# Author: Reindert

# Example call: ./create-container-report.sh T9 . ../../../resources/variables/shipments/shipments.csv
# To test with variable values that contain whitespaces use container "T9 1"

container="$1"
directory="$2"
input_file="$3"

mkdir -p -- "$directory"

# Best paractice: Always use double quotes to prevent globbing and word splitting
grep -- "$container" "$input_file" >"$directory/${container}_report.csv"

echo "Wrote report $directory/${container}_report.csv"
