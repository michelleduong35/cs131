#!/bin/bash

cd /mnt/scratch/SP24_CS131_Jyotika/michellesp24/cs131/worksheet5/UnitedStates

categories=("Music" "Entertainment" "Gaming" "Comedy")

# Loop through each category
for category in "${categories[@]}"
do
    # Create or clear the category file
    > "${category}.txt"
    
    # Filter entries for the current category and country 'United States'
    awk -F, '$8=="United States" && $5=="'$category'" {print >> "'$category'.txt"}' /mnt/scratch/SP24_CS131_Jyotika/michellesp24/cs131/worksheet5/ytstats.csv

    # Write the count of entries to ws5.txt with category names
    echo "$category entries:" >> ../ws5.txt
    wc -l "${category}.txt" >> ../ws5.txt
done
