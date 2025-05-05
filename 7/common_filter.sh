#!/bin/bash

# Declare two unsorted arrays
arr1=(8 2 5 1 10 4)
arr2=(6 10 2 8 14 4)

# Sort the arrays
mapfile -t sorted_arr1 < <(echo "${arr1[@]}" | tr ' ' '\n' | sort -n)
mapfile -t sorted_arr2 < <(echo "${arr2[@]}" | tr ' ' '\n' | sort -n)

# Initialize pointers and result array
i=0
j=0
result=()

# Lengths
len1=${#sorted_arr1[@]}
len2=${#sorted_arr2[@]}

# Two-pointer technique to find common elements without duplicates
while [[ $i -lt $len1 && $j -lt $len2 ]]; do
    val1=${sorted_arr1[$i]}
    val2=${sorted_arr2[$j]}

    if [[ $val1 -eq $val2 ]]; then
        if [[ ${#result[@]} -eq 0 || ${result[-1]} -ne $val1 ]]; then
            result+=("$val1")
        fi
        ((i++))
        ((j++))
    elif [[ $val1 -lt $val2 ]]; then
        ((i++))
    else
        ((j++))
    fi
done

# Output result
echo "Common elements: ${result[@]}"
