#!/data/data/com.termux/files/usr/bin/bash

# ======================================
# KALILINUX TERMUX UPDATER (SAFE)
# Created by Hanief Autophile
# ======================================

clear

echo "======================================"
echo "     KALI LINUX TERMUX UPDATER"
echo "        Created by Hanief Autophile"
echo "======================================"
sleep 1

INSTALL_DIR="$HOME/KaliLinux"
TERMUX_ETC="/data/data/com.termux/files/usr/etc"
BASHRC_TARGET="$TERMUX_ETC/bash.bashrc"
DATE_NOW=$(date +"%Y-%m-%d_%H-%M-%S")

cd "$INSTALL_DIR" || exit 1

# === AUTO STASH LOCAL FILES ===
echo "[*] Menyimpan file lokal sementara..."
git stash push -u -m "auto-stash-before-update-$DATE_NOW" >/dev/null 2>&1

# === UPDATE ===
echo "[*] Mengambil update terbaru..."
git pull --rebase

if [ $? -ne 0 ]; then
    echo "[✗] Update gagal, mengembalikan file lokal..."
    git stash pop >/dev/null 2>&1
    exit 1
fi

# === RESTORE LOCAL FILES ===
git stash pop >/dev/null 2>&1

# === UPDATE bash.bashrc ===
if [ -f "$INSTALL_DIR/bash.bashrc" ]; then
    cp "$BASHRC_TARGET" "$BASHRC_TARGET.backup.$DATE_NOW" 2>/dev/null
    cp "$INSTALL_DIR/bash.bashrc" "$BASHRC_TARGET"
    echo "[✓] bash.bashrc diperbarui"
fi

# === MUSIC CHECK ===
if [ -f "$INSTALL_DIR/welcome.mp3" ]; then
    echo "[✓] welcome.mp3 OK"
fi

echo "[✓] Update selesai pada $(date)" >> "$INSTALL_DIR/update.log"

echo
echo "======================================"
echo "   UPDATE COMPLETE ✔"
echo "   Buka session baru Termux"
echo "======================================"
