#!/bin/bash

username="vagrant"

# Check if the user exists
if id "$username" &>/dev/null; then
  # User exists, so delete them
  userdel "$username"
  echo "User $username deleted successfully"
else
  # User does not exist, so notify the user
  echo "User $username does not exist"
fi