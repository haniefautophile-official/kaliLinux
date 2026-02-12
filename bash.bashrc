# ==================================================
# TERMUX WELCOME PRO FULL ANIMATION
# Created by Hanief Autophile
# ==================================================

clear

# ===============================
# WELCOME MUSIC (EVERY SESSION)
# ===============================
MUSIC="$HOME/KaliLinux/welcome.mp3"

if command -v mpv >/dev/null 2>&1 && [ -f "$MUSIC" ]; then
    sleep 1
    (mpv --no-video --volume=70 "$MUSIC" >/dev/null 2>&1 &)
fi

# ===============================
# LOADING BAR 29 SECONDS (FIXED)
# ===============================
loading_bar() {
    echo -e "\e[1;96mInitializing KaliLinux Environment\e[0m"
    for i in $(seq 1 100); do
        printf "\r\e[1;92mLoading: [%-50s] %3d%%\e[0m" \
        "$(printf '■%.0s' $(seq 1 $((i/2))))" "$i"
        sleep 0.29
    done
    echo -e "\n\e[1;92mSystem Ready ✔\e[0m"
    sleep 0.5
}

# ===============================
# SPINNER ANIMATION
# ===============================
spinner() {
    spin='|/-\'
    echo -ne "\e[1;95mBooting System \e[0m"
    for i in {1..20}; do
        printf "\b${spin:i%4:1}"
        sleep 0.07
    done
    echo -e " \e[1;92m✔\e[0m"
    sleep 0.3
}

loading_bar
spinner
clear

# ===============================
# COLOR VARIABLES
# ===============================
R="\e[1;91m"
O="\e[1;93m"
Y="\e[1;33m"
G="\e[1;92m"
C="\e[1;96m"
B="\e[1;94m"
P="\e[1;95m"
W="\e[0m"

# ===============================
# ASCII WELCOME (RAINBOW)
# ===============================
echo -e "${R}██╗    ██╗${O}███████╗${Y}██╗      ${G}██████╗ ${C}██████╗ ${B}███╗   ███╗${P}███████╗"
echo -e "${R}██║    ██║${O}██╔════╝${Y}██║     ${G}██╔════╝${C}██╔═══██╗${B}████╗ ████║${P}██╔════╝"
echo -e "${R}██║ █╗ ██║${O}█████╗  ${Y}██║     ${G}██║     ${C}██║   ██║${B}██╔████╔██║${P}█████╗"
echo -e "${R}██║███╗██║${O}██╔══╝  ${Y}██║     ${G}██║     ${C}██║   ██║${B}██║╚██╔╝██║${P}██╔══╝"
echo -e "${R}╚███╔███╔╝${O}███████╗${Y}███████╗${G}╚██████╗${C}╚██████╔╝${B}██║ ╚═╝ ██║${P}███████╗"
echo -e "${R} ╚══╝╚══╝ ${O}╚══════╝${Y}╚══════╝${G} ╚═════╝ ${C}╚═════╝ ${B}╚═╝     ╚═╝${P}╚══════╝${W}"

echo
echo -e "${W}Created by ${G}Hanief Autophile${W}"
echo -e "${C}========================================${W}"
echo

# ===============================
# PROMPT (RAINBOW STYLE)
# ===============================
PS1='\[\e[1;91m\]┌─[\[\e[1;93m\]\u@\h\[\e[1;91m\]]─[\[\e[1;96m\]haniefautophile\[\e[1;91m\]]─[\[\e[1;92m\]\w\[\e[1;91m\]]\n└──╼ \[\e[0m\]'
