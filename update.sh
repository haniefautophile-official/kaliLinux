#!/data/data/com.termux/files/usr/bin/bash

# ======================================
# KALILINUX TERMUX UPDATER (SAFE)
# Created by Hanief Autophile
# ======================================

INSTALL_DIR="$HOME/KaliLinux"
TERMUX_ETC="/data/data/com.termux/files/usr/etc"
BASHRC_TARGET="$TERMUX_ETC/bash.bashrc"
DATE_NOW=$(date +"%Y-%m-%d_%H-%M-%S")

# ===============================
# COLOR
# ===============================
G="\e[1;92m"
C="\e[1;96m"
Y="\e[1;93m"
R="\e[1;91m"
W="\e[0m"

clear
echo -e "${C}======================================"
echo -e "     KALI LINUX TERMUX UPDATER"
echo -e "        Created by Hanief Autophile"
echo -e "======================================${W}"
sleep 1

# ===============================
# CHECK INSTALL DIR
# ===============================
if [ ! -d "$INSTALL_DIR/.git" ]; then
    echo -e "${R}[✗] Folder KaliLinux bukan repository git${W}"
    exit 1
fi

cd "$INSTALL_DIR" || exit 1

# ===============================
# LOADING BAR 29 SECONDS
# ===============================
loading_bar() {
    echo -e "${C}[*] Mengambil update terbaru...${W}"
    for i in $(seq 1 100); do
        printf "\r${G}Updating: [%-50s] %3d%%${W}" \
        "$(printf '■%.0s' $(seq 1 $((i/2))))" "$i"
        sleep 0.29
    done
    echo
}

# ===============================
# AUTO STASH LOCAL FILES
# ===============================
echo -e "${Y}[*] Menyimpan file lokal sementara...${W}"
git stash push -u -m "auto-stash-before-update-$DATE_NOW" >/dev/null 2>&1

loading_bar

# ===============================
# SAFE UPDATE
# ===============================
git fetch origin >/dev/null 2>&1

CURRENT_BRANCH=$(git branch --show-current)
REMOTE_BRANCH="origin/$CURRENT_BRANCH"

if git pull --rebase origin "$CURRENT_BRANCH"; then
    echo -e "${G}[✓] Update repository berhasil${W}"
else
    echo -e "${R}[✗] Update gagal, mengembalikan file lokal...${W}"
    git stash pop >/dev/null 2>&1
    exit 1
fi

# ===============================
# RESTORE LOCAL FILES
# ===============================
git stash pop >/dev/null 2>&1

# ===============================
# UPDATE bash.bashrc
# ===============================
if [ -f "$INSTALL_DIR/bash.bashrc" ]; then
    cp "$BASHRC_TARGET" "$BASHRC_TARGET.backup.$DATE_NOW" 2>/dev/null
    cp "$INSTALL_DIR/bash.bashrc" "$BASHRC_TARGET"
    echo -e "${G}[✓] bash.bashrc diperbarui${W}"
fi

# ===============================
# MUSIC CHECK
# ===============================
if [ -f "$INSTALL_DIR/welcome.mp3" ] || [ -f "$INSTALL_DIR/terminal.mp3" ]; then
    echo -e "${G}[✓] File musik terdeteksi${W}"
else
    echo -e "${Y}[!] File musik tidak ditemukan${W}"
fi

# ===============================
# LOG
# ===============================
echo "[✓] Update selesai pada $(date)" >> "$INSTALL_DIR/update.log"

echo
echo -e "${C}======================================"
echo -e "   UPDATE COMPLETE ✔"
echo -e "   Buka session baru Termux"
echo -e "======================================${W}"
