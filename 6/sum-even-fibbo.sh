#!/bin/bash

# Script to calculate sum of first 100 even-valued Fibonacci numbers

count=0
limit=100
sum=0

# Initialize first two even Fibonacci numbers
a=2
b=8

# Sum the even Fibonacci numbers
while [ $count -lt $limit ]; do
    sum=$((sum + a))
    
    # Generate next even Fibonacci using recurrence relation:
    # E(n) = 4 * E(n-1) + E(n-2)
    next=$((4 * b + a))
    
    # Update variables
    a=$b
    b=$next
    count=$((count + 1))
done

echo "Sum of the first $limit even Fibonacci numbers: $sum"
