#!/data/data/com.termux/files/usr/bin/bash

# ===============================
# KALI LINUX THEME UPDATE SCRIPT
# ===============================

REPO_DIR="$HOME/KaliLinux"
TERMUX_ETC="/data/data/com.termux/files/usr/etc"
BASHRC_TARGET="$TERMUX_ETC/bash.bashrc"
DATE_NOW=$(date +"%Y-%m-%d_%H-%M-%S")

echo "[*] KaliLinux Theme Updater"
sleep 1

# === CHECK GIT ===
if ! command -v git >/dev/null 2>&1; then
    echo "[!] Git belum terinstall"
    echo "[*] Install git dulu: pkg install git"
    exit 1
fi

# === CHECK REPO ===
if [ ! -d "$REPO_DIR/.git" ]; then
    echo "[!] Repo tidak ditemukan di $REPO_DIR"
    exit 1
fi

cd "$REPO_DIR" || exit 1

# === BACKUP bash.bashrc ===
if [ -f "$BASHRC_TARGET" ]; then
    cp "$BASHRC_TARGET" "$BASHRC_TARGET.backup.$DATE_NOW"
    echo "[✓] Backup bash.bashrc dibuat"
fi

# === GIT PULL ===
echo "[*] Mengambil update dari GitHub..."
git pull --rebase

if [ $? -ne 0 ]; then
    echo "[!] Gagal update repo"
    exit 1
fi

# === UPDATE bash.bashrc ===
if [ -f "$REPO_DIR/bash.bashrc" ]; then
    cp "$REPO_DIR/bash.bashrc" "$BASHRC_TARGET"
    echo "[✓] bash.bashrc diperbarui"
fi

# === CHECK MUSIC FILE ===
if [ -f "$REPO_DIR/welcome.mp3" ]; then
    echo "[✓] File musik tersedia"
else
    echo "[!] welcome.mp3 tidak ditemukan"
fi

echo
echo "[✓] Update selesai"
echo "[i] Restart Termux untuk melihat perubahan"

