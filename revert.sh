#!/data/data/com.termux/files/usr/bin/bash

clear
echo "[+] Reverting Termux..."

if [ -f "$PREFIX/etc/bash.bashrc.bak" ]; then
  cp $PREFIX/etc/bash.bashrc.bak $PREFIX/etc/bash.bashrc
  echo "[✓] Reverted successfully"
else
  echo "[!] Backup not found"
fi
