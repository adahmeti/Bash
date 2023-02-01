#!/bin/bash

# Function to display the current floor
display_floor () {
  if [ $1 -lt 0 ]; then
    echo "You are on basement floor B$((-1 * $1))."
  else
    echo "You are on floor $1."
  fi
}

# Start on the first floor
current_floor=1

# Display the starting floor
display_floor $current_floor

# Loop to handle elevator requests
while true; do
  # Ask for the desired floor
  read -p "Enter the desired floor (B3 to 10): " desired_floor

  # Check that the desired floor is within the range
  if [ "$desired_floor" == "B3" ]; then
    desired_floor=-3
  elif [ "$desired_floor" == "B2" ]; then
    desired_floor=-2
  elif [ "$desired_floor" == "B1" ]; then
    desired_floor=-1
  elif [ $desired_floor -lt -3 ] || [ $desired_floor -gt 10 ]; then
    echo "Invalid floor. Please enter a floor between B3 and 10."
    continue
  fi

  # Move the elevator to the desired floor
  while [ $current_floor -ne $desired_floor ]; do
    if [ $current_floor -lt $desired_floor ]; then
      ((current_floor++))
    else
      ((current_floor--))
    fi
    display_floor $current_floor
  done

  # Display a message when the desired floor is reached
  echo "You have reached floor $desired_floor."
done
