#!/bin/bash

# Cosmic Explorer Profile

# Color definitions
RESET="\033[0m"
BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
CYAN="\033[0;36m"
WHITE="\033[0;37m"

# Function to center text
center_text() {
    local text="$1"
    local width=$(tput cols)
    local padding=$(( (width - ${#text}) / 2 ))
    printf "%*s%s%*s\n" $padding "" "$text" $padding ""
}

# Cosmic ASCII Art
cosmic_art() {
    clear
    echo -e "${BLUE}"
    center_text "     .  *       .   ⋆  ·   ·      ✦   ✵     ˚    ·"
    center_text "  ⋆    ·   ✺    .  ⋆   ·           ⊹    *    ⋆   ."
    center_text "    *   ·   ✷   ·    *    ✦ . · ✧  ✵    ˚    ·  ⊹"
    center_text "    _____  _____   _____ __  __ _____ _____  "
    center_text "   / ____||  __ \\ / ____|  \\/  |_   _/ ____|" 
    center_text "  | |     | |  | | (___ | \\  / | | || |     "
    center_text "  | |     | |  | |\\___ \\| |\\/| | | || |     "
    center_text "  | |____ | |__| |____) | |  | |_| || |____ "
    center_text "   \\_____||_____/|_____/|_|  |_|_____\\_____|"
    center_text "    ________  ______  __    ____  ____  __________"
    center_text "   / ____/\\ \\/ / __ \\/ /   / __ \\/ __ \\/ ____/ __ \\"
    center_text "  / __/    \\  / /_/ / /   / / / / /_/ / __/ / /_/ /"
    center_text " / /___    / / ____/ /___/ /_/ / _, _/ /___/ _, _/ "
    center_text "/_____/   /_/_/   /_____/\\____/_/ |_/_____/_/ |_|  "
    center_text "  ⋆    ·   ✺      ⋆   ·           ⊹    *    ⋆   ."
    center_text "    *   ·   ✷   ·    *     · ✧  ✵    ˚    ·  ⊹  ."
    center_text "  .  *       .      ·      ✦        ˚    ·      ⋆"
    echo -e "${RESET}"
}

# Space travel animation
space_travel() {
    local frames=("   .  *  ." "  * . * ." " .  *  . " " * .  * .")
    for i in {1..20}; do
        clear
        center_text "${frames[i % 4]}"
        center_text "Traveling through space..."
        center_text "${frames[(i+2) % 4]}"
        sleep 0.2
    done
}

# Git branch function
git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/🚀 \1/'
}

# Custom command prompt
PS1="\n${CYAN}┌[🌌${GREEN}\u${CYAN}]─[🌠${YELLOW}\w${CYAN}]─${PURPLE}\$(git_branch)\n${CYAN}└[💫]➤ ${RESET}"

# Aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias clear='cosmic_art'
alias explore='space_travel && echo "New galaxy discovered! 🌌"'

# Custom functions
space_weather() {
    center_text "🌞 Solar wind speed: $(( RANDOM % 500 + 300 )) km/s"
    center_text "🌡️ Cosmic ray intensity: $(( RANDOM % 100 ))%"
    center_text "🌠 Aurora activity: $(( RANDOM % 10 ))/10"
}

planet_discovery() {
    local planets=("Mercury 🔥" "Venus 🌋" "Earth 🌍" "Mars 🔴" "Jupiter 🌩️" "Saturn 💍" "Uranus 🧊" "Neptune 💨")
    center_text "Discovered planet: ${planets[$RANDOM % ${#planets[@]}]}"
}

cosmic_menu() {
    echo -e "${YELLOW}"
    center_text "🚀 Cosmic Explorer Commands 🚀"
    center_text "--------------------------------"
    center_text "explore   - Initiate space travel"
    center_text "weather   - Check space weather"
    center_text "discover  - Discover a new planet"
    center_text "clear     - Clear the console"
    echo -e "${RESET}"
}

# Initialization
cosmic_art
echo
center_text "${YELLOW}🌌 Welcome aboard the Cosmic Explorer! 🚀${RESET}"
echo
space_weather
planet_discovery
echo
cosmic_menu

# Set variables to indicate this profile has been sourced
PROFILE_PS1_SET=1
PROFILE_SOURCED=1
