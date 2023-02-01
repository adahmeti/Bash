#!/bin/bash

# Check that two arguments are entered
if [ $# -ne 2 ]; then
  echo "Error: two arguments are required"
  exit 1
fi

# Check that M and N are numbers
if ! [[ $1 =~ ^[0-9]+$ ]] || ! [[ $2 =~ ^[0-9]+$ ]]x; then
  echo "Error: both arguments must be numbers"
  exit 1
fi

# Assign values to M and N
M=$1
N=$2

# Check that M is less than N
if [ $M -ge $N ]; then
  echo "Error: M must be less than N"
  exit 1
fi

# Calculate the difference
difference() {
  echo $(($N - $M))
}

# Calculate the product
product() {
  echo $(($M * $N))
}

# Calculate the sum of even numbers
sum_even() {
  even_sum=0
  for (( i=$M; i<=$N; i++ )); do
    if [ $((i % 2)) -eq 0 ]; then
      even_sum=$((even_sum + i))
    fi
  done
  echo $even_sum
}

# Call the functions and print the results
echo "Difference: $(difference)"
echo "Product: $(product)"
echo "Sum of even numbers: $(sum_even)"
