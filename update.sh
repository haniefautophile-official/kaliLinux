#!/data/data/com.termux/files/usr/bin/bash

# ======================================
# KALILINUX TERMUX THEME UPDATER
# Created by Hanief Autophile
# ======================================

clear

echo "======================================"
echo "     KALI LINUX TERMUX UPDATER"
echo "        Created by Hanief Autophile"
echo "======================================"
sleep 1

# === CONFIG ===
INSTALL_DIR="$HOME/KaliLinux"
TERMUX_ETC="/data/data/com.termux/files/usr/etc"
BASHRC_TARGET="$TERMUX_ETC/bash.bashrc"
DATE_NOW=$(date +"%Y-%m-%d_%H-%M-%S")

# === CHECK INSTALLATION ===
if [ ! -d "$INSTALL_DIR/.git" ]; then
    echo "[✗] KaliLinux belum terinstall"
    echo "    Jalankan install.sh terlebih dahulu"
    exit 1
fi

cd "$INSTALL_DIR" || exit 1

# === UPDATE REPO ===
echo "[*] Mengambil update terbaru..."
git pull --rebase

if [ $? -ne 0 ]; then
    echo "[✗] Update gagal"
    exit 1
fi

# === UPDATE bash.bashrc (SAFE) ===
if [ -f "$INSTALL_DIR/bash.bashrc" ]; then
    cp "$BASHRC_TARGET" "$BASHRC_TARGET.backup.$DATE_NOW" 2>/dev/null
    cp "$INSTALL_DIR/bash.bashrc" "$BASHRC_TARGET"
    echo "[✓] bash.bashrc diperbarui"
else
    echo "[!] bash.bashrc tidak ditemukan di repo"
fi

# === CHECK MUSIC FILE ===
if [ -f "$INSTALL_DIR/welcome.mp3" ]; then
    echo "[✓] welcome.mp3 OK"
else
    echo "[!] welcome.mp3 tidak ditemukan"
fi

# === LOG ===
echo "[✓] Update selesai pada $(date)" >> "$HOME/KaliLinux/update.log"

echo
echo "======================================"
echo "   UPDATE COMPLETE ✔"
echo "   Buka session baru Termux"
echo "======================================"
