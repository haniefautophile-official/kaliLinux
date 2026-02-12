xx
# ===============================
# TERMUX WELCOME PRO STYLE
# Created by Hanief Autophile
# ===============================

clear

# ===============================
# WELCOME MUSIC (EVERY SESSION)
# ===============================

MUSIC="$HOME/KaliLinux/welcome.mp3"

if command -v mpv >/dev/null 2>&1 && [ -f "$MUSIC" ]; then
    sleep 1
    (mpv --no-video --volume=70 "$MUSIC" >/dev/null 2>&1 &)
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
