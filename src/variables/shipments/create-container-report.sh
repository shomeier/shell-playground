#!/bin/bash

# Create a report file for a single shipping container
# Author: Reindert

# Example call: ./create-container-report.sh T9 . ../../../resources/variables/shipments/shipments.csv
# To test with variable values that contain whitespaces use container "T9 1"

# then can either be on a newline or followed by a semicolon on the same line
if [[ ! $1 ]]; then
    echo "Error: missing parameter: container name"
    exit 1
fi

container="$1"

if [[ $2 ]]; then
    directory="$2"
else
    directory="$HOME/reports"
fi

if [[ ! $3 ]]; then
    echo "Error: missing parameter: input file"
    exit 1
fi

input_file="$3"

if [[ ! -e $input_file ]]; then
    echo "Error: Input file $input_file does not exist"
    exit 1
fi

mkdir -p -- "$directory"

# Best paractice: Always use double quotes to prevent globbing and word splitting
if grep -- "$container" "$input_file" >"$directory/${container}_report.csv"; then
    echo "Wrote report $directory/{$container}_report.csv"
else
    echo "Container $container not found in $input_file"
fi

# u can use echo or printf here
# echo "Wrote report $directory/${container}_report.csv"
printf "Wrote report %s/%s_report.csv\n" "$directory" "$container"
