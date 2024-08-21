#!/bin/bash

# Cyberpunk Hacker Profile

# Color definitions
RESET="\033[0m"
NEON_GREEN="\033[38;5;46m"
NEON_PINK="\033[38;5;197m"
NEON_BLUE="\033[38;5;39m"
NEON_YELLOW="\033[38;5;226m"

# Function to center text
center_text() {
    local text="$1"
    local width=$(tput cols)
    local padding=$(( (width - ${#text}) / 2 ))
    printf "%*s%s%*s\n" $padding "" "$text" $padding ""
}

# Cyberpunk ASCII Art
cyber_art() {
    clear
    echo -e "${NEON_GREEN}"
    center_text "     _______ _______  _____  _______ _______ ______ _     _ _     _ _"
    center_text " |      |      |  |_____] |______ |______ |_____/ |____/  |     | |"
    center_text " |_____ |_____]|  |       |______ |______ |    \_ |    \_ |_____| |_____"
    center_text "   _______     _______ _______ _     _ _______ ______"
    center_text "      |    |      |    |       |____/  |______ |     \\"
    center_text "      |    |_____ |    |_____  |    \_ |______ |_____/"
    center_text " "
    center_text "╔═══════════════════════════════════════════════════════════════════════╗"
    center_text "║  Welcome to the Grid, Netrunner. Jack in and ride the digital waves.  ║"
    center_text "╚═══════════════════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
}

# Hacking animation
hack_animation() {
    local frames=(
        "[=>         ]"
        "[==>        ]"
        "[===>       ]"
        "[====>      ]"
        "[=====>     ]"
        "[======>    ]"
        "[=======>   ]"
        "[========>  ]"
        "[=========> ]"
        "[==========]"
    )
    for i in {1..30}; do
        clear
        center_text "${NEON_GREEN}Initiating hack sequence...${RESET}"
        center_text "${frames[i % 10]}"
        sleep 0.1
    done
    center_text "${NEON_PINK}Access granted! 🔓${RESET}"
}

# Git branch function
git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[⚡\1]/'
}

# Custom command prompt
PS1="${NEON_GREEN}┌[${NEON_PINK}\u@\h${NEON_GREEN}]─[${NEON_BLUE}\w${NEON_GREEN}]─${NEON_YELLOW}\$(git_branch)\n${NEON_GREEN}└╼ ${NEON_PINK}➤${RESET} "

# Aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias clear='cyber_art'
alias hack='hack_animation'

# Custom functions
ip_info() {
    center_text "${NEON_BLUE}🌐 IP: $(curl -s https://ipinfo.io/ip)${RESET}"
    center_text "${NEON_BLUE}📍 Location: $(curl -s https://ipinfo.io/city), $(curl -s https://ipinfo.io/country)${RESET}"
}

cyber_menu() {
    echo -e "${NEON_YELLOW}"
    center_text "⚡ Cyberpunk Hacker Commands ⚡"
    center_text "--------------------------------"
    center_text "hack      - Initiate a hack sequence"
    center_text "ip        - Display IP information"
    center_text "clear     - Clear the console"
    echo -e "${RESET}"
}

# Initialization
cyber_art
echo
center_text "${NEON_YELLOW}🔒 Secure connection established. Welcome, netrunner. 🖥️${RESET}"
echo
ip_info
echo
cyber_menu

# Set variables to indicate this profile has been sourced
PROFILE_PS1_SET=1
PROFILE_SOURCED=1
