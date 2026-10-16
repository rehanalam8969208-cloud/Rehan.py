#!/bin/bash

PINK="\e[38;5;206m"
BLUE="\e[38;5;39m"
PURPLE="\e[38;5;135m"
WHITE="\e[1;37m"
RESET="\e[0m"

clear
echo -e "${PINK}   ___  ____  __ __   __    __  __ ${BLUE}  ___  _  _ "
echo -e "${PINK}  / _ \(  __)/ )( \ /__\  (  \/  )${BLUE} / __)( \/ )"
echo -e "${PINK} /   / ) _) ) __ (/(__)\  )    ( ${BLUE} \__ \ \  / "
echo -e "${PINK} (_)\_)(____)\_)(_)(__)(__)(_/\_)${BLUE} (___/ (__) "
echo -e "${PURPLE} ═══════════════════════════════════════════ ${RESET}"
echo -e "${WHITE}        ALL-IN-ONE MEDIA & CLOUD TOOLKIT ${RESET}"
echo -e "${PURPLE} ═══════════════════════════════════════════ ${RESET}\n"

echo -e "${BLUE}[⚡]${WHITE} Storage Permission Maang Raha Hai...${RESET}"
termux-setup-storage
sleep 2

# Yahan 'rclone' add kar diya hai
echo -e "${PINK}[⚙️]${WHITE} Zaroori Packages Install Ho Rahe Hain...${RESET}"
pkg update -y -q
pkg install python ffmpeg mpv x11-repo libxfixes nodejs rclone -y -q
pip install yt-dlp -q

echo -e "${BLUE}[📁]${WHITE} MirrorNotes Folder Ban Raha Hai...${RESET}"
mkdir -p /storage/emulated/0/MirrorNotes
touch /storage/emulated/0/MirrorNotes/youtube
touch /storage/emulated/0/MirrorNotes/insta
touch /storage/emulated/0/MirrorNotes/music

echo -e "${PINK}[🔗]${WHITE} Shortcuts (Commands) Set Ho Rahe Hain...${RESET}"
touch ~/.bashrc
sed -i '/alias imp3/d' ~/.bashrc
sed -i '/alias imp4/d' ~/.bashrc
sed -i '/alias ymp3/d' ~/.bashrc
sed -i '/alias ymp4/d' ~/.bashrc
sed -i '/alias play/d' ~/.bashrc
sed -i '/alias upload/d' ~/.bashrc

REPO_DIR=$(pwd)
echo "alias ymp4=\"python $REPO_DIR/downloader.py youtube mp4\"" >> ~/.bashrc
echo "alias ymp3=\"python $REPO_DIR/downloader.py youtube mp3\"" >> ~/.bashrc
echo "alias imp4=\"python $REPO_DIR/downloader.py insta mp4\"" >> ~/.bashrc
echo "alias imp3=\"python $REPO_DIR/downloader.py insta mp3\"" >> ~/.bashrc
echo "alias play=\"python $REPO_DIR/player.py\"" >> ~/.bashrc
echo "alias upload=\"python $REPO_DIR/upload.py\"" >> ~/.bashrc

echo -e "\n${BLUE}╔════════════════════════════════════════╗${RESET}"
echo -e "${BLUE}║ ${PINK}     SETUP COMPLETE! 🎉${BLUE}                 ║${RESET}"
echo -e "${BLUE}╚════════════════════════════════════════╝${RESET}"
echo -e "${WHITE}Shortcuts chalu karne ke liye type karo: ${PINK}source ~/.bashrc${RESET}\n"
