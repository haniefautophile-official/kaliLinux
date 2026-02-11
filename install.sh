#!/data/data/com.termux/files/usr/bin/bash

clear
echo "[+] Installing KaliLinux Termux Style..."
sleep 1

pkg update -y && pkg upgrade -y
pkg install mpv figlet toilet git -y

# Backup bashrc lama
if [ ! -f "$PREFIX/etc/bash.bashrc.bak" ]; then
  cp $PREFIX/etc/bash.bashrc $PREFIX/etc/bash.bashrc.bak
fi

# Copy bashrc baru
cp bash.bashrc $PREFIX/etc/bash.bashrc
chmod 644 $PREFIX/etc/bash.bashrc

echo "[✓] Installed successfully!"
echo "[✓] Restart Termux"
