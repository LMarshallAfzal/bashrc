#!/bin/bash

# Define a function to display the current system usage
display_usage() {
    local total_memory=$(free -m | awk 'FNR == 2 {print $2}')
    local used_memory=$(free -m | awk 'FNR == 2 {print $3}')
    local free_memory=$((total_memory - used_memory))
    local total_swap=$(free -m | awk 'FNR == 3 {print $2}')
    local used_swap=$(free -m | awk 'FNR == 3 {print $3}')
    local free_swap=$((total_swap - used_swap))
    local total_disk=$(df -h | awk 'FNR == 2 {print $2}')
    local used_disk=$(df -h | awk 'FNR == 2 {print $3}')
    local free_disk=$(df -h | awk 'FNR == 2 {print $4}')
    local load_average=$(cat /proc/loadavg | awk '{print $1}')

    echo "System Usage:"
    echo "Total Memory: $total_memory MB"
    echo "Used Memory: $used_memory MB"
    echo "Free Memory: $free_memory MB"
    echo "Total Swap: $total_swap MB"
    echo "Used Swap: $used_swap MB"
    echo "Free Swap: $free_swap MB"
    echo "Total Disk: $total_disk"
    echo "Used Disk: $used_disk"
    echo "Free Disk: $free_disk"
    echo "Load Average: $load_average"
}

# Define a function to handle errors
handle_error() {
    local error_message=$1
    echo "Error: $error_message"
    exit 1
}

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    handle_error "This script must be run as root."
fi

# Display the current system usage
display_usage
