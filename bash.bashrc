xx
# ===============================
# TERMUX WELCOME PRO STYLE
# Created by Hanief Autophile
# ===============================

clear

# ---- PLAY MUSIC ONCE ----
MUSIC_FLAG="$HOME/.welcome_music_played"
MUSIC_FILE="$HOME/KaliLinux/welcome.mp3"

if [ -f "$MUSIC_FILE" ] && [ ! -f "$MUSIC_FLAG" ]; then
    mpv --no-video --quiet "$MUSIC_FILE" >/dev/null 2>&1 &
    touch "$MUSIC_FLAG"
fi

# ---- ASCII WELCOME ----
echo -e "\e[1;92m"
cat << "EOF"
██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗
██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝
██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗
██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝
╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗
 ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝
EOF
echo -e "\e[0m"

echo -e "\e[1;37mCreated by \e[1;92mHanief Autophile\e[0m"
echo "========================================"
echo

# ---- PROMPT ----
PS1='\[\e[1;32m\]┌─[\u@\h]─[\e[1;36mhaniefautophile\e[1;32m]─[\w]\n└──╼ \[\e[0m\]'
