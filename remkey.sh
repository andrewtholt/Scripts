#!/bin/bash

# Remove key from known hosts

IP_ADDRESS="$1"

echo "Remove host key for $IP_ADDRESS"
ssh-keygen -f "$HOME/.ssh/known_hosts" -R $IP_ADDRESS

