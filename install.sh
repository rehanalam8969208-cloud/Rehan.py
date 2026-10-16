#!/bin/bash

echo -e "\e[1;32m[+] Termux Storage Permission Maang Raha Hai...\e[0m"
termux-setup-storage
sleep 2

echo -e "\e[1;34m[+] Required Packages Install Ho Rahe Hain...\e[0m"
pkg update -y
pkg install python ffmpeg mpv x11-repo libxfixes -y
pip install yt-dlp

echo -e "\e[1;35m[+] MirrorNotes Folder aur Blank Text Files Bana Raha Hai...\e[0m"
mkdir -p /storage/emulated/0/MirrorNotes
# Yeh 3 line automatic tumhari file bana dengi
touch /storage/emulated/0/MirrorNotes/youtube
touch /storage/emulated/0/MirrorNotes/insta
touch /storage/emulated/0/MirrorNotes/music

echo -e "\e[1;36m[+] Shortcuts (Commands) Set Ho Rahe Hain...\e[0m"
touch ~/.bashrc
sed -i '/alias imp3/d' ~/.bashrc
sed -i '/alias imp4/d' ~/.bashrc
sed -i '/alias ymp3/d' ~/.bashrc
sed -i '/alias ymp4/d' ~/.bashrc
sed -i '/alias play/d' ~/.bashrc

# Ab script wahi se chalegi jahan clone hui hai, taaki app me Python files na dikhe
REPO_DIR=$(pwd)

echo "alias ymp4=\"python $REPO_DIR/downloader.py youtube mp4\"" >> ~/.bashrc
echo "alias ymp3=\"python $REPO_DIR/downloader.py youtube mp3\"" >> ~/.bashrc
echo "alias imp4=\"python $REPO_DIR/downloader.py insta mp4\"" >> ~/.bashrc
echo "alias imp3=\"python $REPO_DIR/downloader.py insta mp3\"" >> ~/.bashrc
echo "alias play=\"python $REPO_DIR/player.py\"" >> ~/.bashrc

echo -e "\e[1;32m[+] SETUP COMPLETE! 🎉\e[0m"
echo -e "Ek baar Termux ko restart karo ya yeh type karo: source ~/.bashrc"
