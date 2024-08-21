#!/bin/bash

# Forest Dweller Profile

# Color definitions
RESET="\033[0m"
DARK_GREEN="\033[0;32m"
LIGHT_GREEN="\033[1;32m"
BROWN="\033[0;33m"
DARK_BROWN="\033[1;33m"
OLIVE="\033[0;36m"

# Function to center text
center_text() {
    local text="$1"
    local width=$(tput cols)
    local padding=$(( (width - ${#text}) / 2 ))
    printf "%*s%s%*s\n" $padding "" "$text" $padding ""
}

# Forest ASCII Art
forest_art() {
    clear
    echo -e "${DARK_GREEN}"
    center_text "                  ,@@@@@@@,"
    center_text "       ,,,.   ,@@@@@@/@@,  .oo8888o."
    center_text "    ,&%%&%&&%,@@@@@/@@@@@@,8888\\88/8o"
    center_text "   ,%&\\%&&%&&%,@@@\\@@@/@@@88\\88888/88'"
    center_text "   %&&%&%&/%&&%@@\\@@/ /@@@88888\\88888'"
    center_text "   %&&%/ %&%%&&@@\\ V /@@' \`88\\8 \`/88'"
    center_text "   \`&%\\ \` /%&'    |.|        \\ '|8'"
    center_text "       |o|        | |         | |"
    center_text "       |.|        | |         | |"
    center_text "    \\\\/ ._\\//_/__/  ,\\_//__\\\\/.  \\_//__/_"
    center_text " "
    center_text "🌿 Welcome to the Enchanted Forest 🍄"
    echo -e "${RESET}"
}

# Growing tree animation
grow_tree() {
    local frames=(
        "   ${DARK_GREEN}|${RESET}"
        "   ${DARK_GREEN}|${RESET}"
        "  ${LIGHT_GREEN}^${RESET}"
        " ${LIGHT_GREEN}^^^${RESET}"
        "${LIGHT_GREEN}/^^^\\${RESET}"
        "${LIGHT_GREEN}/^^^^^\\${RESET}"
        "${BROWN}|${LIGHT_GREEN}/^^^^^\\${BROWN}|${RESET}"
    )
    for frame in "${frames[@]}"; do
        clear
        center_text "Growing a tree..."
        center_text "$frame"
        sleep 0.5
    done
    sleep 1
}

# Git branch function
git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(🍃\1)/'
}

# Custom command prompt
PS1="${DARK_GREEN}🌳─[${LIGHT_GREEN}\u${DARK_GREEN}]─[${BROWN}\w${DARK_GREEN}]─${OLIVE}\$(git_branch)\n${DARK_GREEN}🍂→ ${RESET}"

# Aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias clear='forest_art'
alias plant='grow_tree && echo "A new tree has grown in the forest! 🌱"'

# Custom functions
nature_quote() {
    local quotes=(
        "In nature, nothing is perfect and everything is perfect. 🍃"
        "Nature does not hurry, yet everything is accomplished. 🐢"
        "The Earth has music for those who listen. 🎵"
        "Every flower is a soul blossoming in nature. 🌸"
        "The clearest way into the Universe is through a forest wilderness. 🌲"
    )
    center_text "${BROWN}${quotes[$RANDOM % ${#quotes[@]}]}${RESET}"
}

forest_sounds() {
    local sounds=("🐦 Chirp chirp!" "🦉 Hoot hoot!" "🐿️ Rustle rustle!" "🍃 Whoosh..." "🐸 Ribbit!")
    for sound in "${sounds[@]}"; do
        center_text "$sound"
        sleep 1
    done
}

forest_menu() {
    echo -e "${LIGHT_GREEN}"
    center_text "🍄 Forest Dweller Commands 🍄"
    center_text "--------------------------------"
    center_text "plant     - Grow a new tree"
    center_text "quote     - Hear nature's wisdom"
    center_text "sounds    - Listen to forest sounds"
    center_text "clear     - Clear the console"
    echo -e "${RESET}"
}

# Initialization
forest_art
echo
nature_quote
echo
forest_sounds
echo
forest_menu

# Set variables to indicate this profile has been sourced
PROFILE_PS1_SET=1
PROFILE_SOURCED=1
