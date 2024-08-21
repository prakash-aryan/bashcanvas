#!/bin/bash

PROFILES_DIR="$HOME/BashCanvas/profiles"
CURRENT_PROFILE="$HOME/.current_profile"

# Create profiles directory if it doesn't exist
mkdir -p "$PROFILES_DIR"

# Function to list available profiles
list_profiles() {
    echo "Available profiles:"
    ls -1 "$PROFILES_DIR" | grep -E "\.sh$" | sed 's/\.sh$//'
}

# Function to switch to a profile
switch_profile() {
    local profile_name="$1"
    local profile_file="$PROFILES_DIR/${profile_name}.sh"
    
    if [ ! -f "$profile_file" ]; then
        echo "Profile not found. Creating a new profile: $profile_name"
        echo "# Profile $profile_name" > "$profile_file"
        echo "PS1=\"[$profile_name] \u@\h:\w\$ \"" >> "$profile_file"
    fi
    
    echo "$profile_name" > "$CURRENT_PROFILE"
    echo "Switched to profile: $profile_name"
}

# Main script logic
if [ "$1" = "list" ]; then
    list_profiles
elif [ "$1" = "current" ]; then
    if [ -f "$CURRENT_PROFILE" ]; then
        echo "Current profile: $(cat "$CURRENT_PROFILE")"
    else
        echo "No profile currently set."
    fi
elif [ -n "$1" ]; then
    switch_profile "$1"
else
    echo "Usage: $0 {profile_name|list|current}"
    echo "       list - show available profiles"
    echo "       current - show current profile"
    echo "       profile_name - switch to specified profile"
fi
