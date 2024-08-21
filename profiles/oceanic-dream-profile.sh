#!/bin/bash

# Oceanic Dream Profile

# Color definitions
RESET="\033[0m"
DEEP_BLUE="\033[38;5;25m"
LIGHT_BLUE="\033[38;5;39m"
TEAL="\033[38;5;6m"
CYAN="\033[38;5;51m"
SAND="\033[38;5;222m"
CORAL="\033[38;5;209m"
WHITE="\033[97m"

# Function to center text
center_text() {
    local text="$1"
    local width=$(tput cols)
    local padding=$(( (width - ${#text}) / 2 ))
    printf "%*s%s%*s\n" $padding "" "$text" $padding ""
}

# Ocean ASCII Art
ocean_art() {
    clear
    echo -e "${DEEP_BLUE}"
    center_text "     _____       ____"
    center_text "  __(     )___(    )       o"
    center_text " (    \=((_.=./     )     .'$CYAN\`.${DEEP_BLUE}"
    center_text "  (      ) (o o)    )    /|  |\\     ${CYAN}><(((º>${DEEP_BLUE}"
    center_text "   (____(     )____)    |,\__,/|    ${CYAN}><(((º>${DEEP_BLUE}"
    center_text "  |  _   _   _   _  |    \\/ \" \\/"
    center_text "  | | | | | | | | | |     (${CYAN}\`${DEEP_BLUE}-${CYAN}\`${DEEP_BLUE})       ${CYAN}><(((º>${DEEP_BLUE}"
    center_text " ${CYAN}~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~${DEEP_BLUE}"
    center_text " ${CYAN} ~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~${DEEP_BLUE}"
    center_text ""
    center_text "${CYAN}Welcome to the Oceanic Dream Terminal${RESET}"
    echo -e "${RESET}"
}

# Wave animation
wave_animation() {
    local frames=(
        "~^~^~^~^~"
        "^~^~^~^~^"
        "~^~^~^~^~"
        "^~^~^~^~^"
    )
    for i in {1..20}; do
        clear
        center_text "${CYAN}${frames[i % 4]}${RESET}"
        center_text "Waves gently rolling..."
        center_text "${CYAN}${frames[(i+2) % 4]}${RESET}"
        sleep 0.2
    done
}

# Git branch function
git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(🐠\1)/'
}

# Custom command prompt
PS1="\n${DEEP_BLUE}🌊${LIGHT_BLUE}[${CYAN}\u${LIGHT_BLUE}]${DEEP_BLUE}─${LIGHT_BLUE}[${CYAN}\w${LIGHT_BLUE}]${TEAL}\$(git_branch)\n${DEEP_BLUE}🐚 ${RESET}"

# Aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias clear='ocean_art'
alias waves='wave_animation'

# Custom functions
ocean_quote() {
    local quotes=(
        "The sea, once it casts its spell, holds one in its net of wonder forever. 🌊"
        "The ocean is a mighty harmonist. 🎵"
        "The voice of the sea speaks to the soul. 🐚"
        "To me the sea is a continual miracle. 🌠"
        "We are tied to the ocean. And when we go back to the sea, we are going back from whence we came. 🏊"
    )
    center_text "${LIGHT_BLUE}${quotes[$RANDOM % ${#quotes[@]}]}${RESET}"
}

sea_life() {
    local creatures=("🐬" "🐠" "🦈" "🐙" "🦀" "🐳" "🦑" "🐡" "🐚" "🦞")
    for i in {1..10}; do
        center_text "${creatures[$RANDOM % ${#creatures[@]}]} "
        sleep 0.3
    done
}

ocean_menu() {
    echo -e "${DEEP_BLUE}"
    center_text "🌊 Oceanic Dream Commands 🌊"
    center_text "--------------------------------"
    center_text "waves     - Watch the waves roll"
    center_text "quote     - Hear ocean wisdom"
    center_text "sealife   - Observe sea creatures"
    center_text "clear     - Clear the console"
    echo -e "${RESET}"
}

# Initialization
ocean_art
echo
ocean_quote
echo
sea_life
echo
ocean_menu

# Set variables to indicate this profile has been sourced
PROFILE_PS1_SET=1
PROFILE_SOURCED=1
