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
# HACKER PROGRESS LOADING (29s)
# ===============================
loading_bar() {
    local steps=100
    local delay=0.29
    local bar=""
    local colors=("\e[1;91m" "\e[1;93m" "\e[1;92m" "\e[1;96m" "\e[1;94m" "\e[1;95m")
    local W="\e[0m"

    echo -e "\e[1;92m[+] Booting KaliLinux Environment...\e[0m"

    for i in $(seq 1 $steps); do
        bar+="■"
        color=${colors[$((i % 6))]}

        printf "\r${color}Progress: [%-50s] %3d%%${W}" "$bar" "$i"

        # Beep checkpoint
        case $i in
            25|50|75|100)
                printf "\a"
                ;;
        esac

        sleep $delay
    done

    echo
    echo -e "\e[1;92mSystem Ready ✔\e[0m"
    sleep 0.4
}

loading_bar
clear


# ===============================
# SPINNER ANIMATION
# ===============================
spinner() {
    spin='|/-\'
    echo -ne "\e[1;95mLaunching shell \e[0m"
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
