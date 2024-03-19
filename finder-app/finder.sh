#!/bin/bash

filesdir=$1
searchstr=$2

# Check if specific arguments are provided
if [ -z "$searchstr" ] || [ -z "$filesdir" ] || [ ! -d "$filesdir" ] || [ "$#" -eq 0 ]; then
    echo "Error In Parameters"
    exit 1
else
    # Count the number of matching lines
    Y=$(grep -rs "$filesdir" -e "$searchstr" | wc -l)
    
    # Count the number of files in the directory
    X=$(find "$filesdir" -type f | wc -l)
    
    echo "The number of files are $X and the number of matching lines are $Y"
    exit 0
fi
