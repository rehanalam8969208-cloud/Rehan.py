#!/bin/bash

echo -e "\e[1;32m[+] Termux Storage Permission Maang Raha Hai...\e[0m"
termux-setup-storage
sleep 2

echo -e "\e[1;34m[+] Required Packages Install Ho Rahe Hain...\e[0m"
pkg update -y
pkg install python ffmpeg mpv x11-repo libxfixes -y
pip install yt-dlp

# Naye termux me .bashrc khud bana dega agar nahi hogi toh
touch ~/.bashrc

echo -e "\e[1;35m[+] Scripts Set Kar Raha Hai...\e[0m"
mkdir -p /storage/emulated/0/MirrorNotes

# Check karega ki files hain ya nahi
if [ -f "player.py" ] && [ -f "downloader.py" ]; then
    cp player.py /storage/emulated/0/MirrorNotes/player.py
    cp downloader.py /storage/emulated/0/MirrorNotes/downloader.py
else
    echo -e "\e[1;31m[-] ERROR: player.py ya downloader.py is folder me nahi hai!\e[0m"
    echo -e "Pehle dono python files isi folder me banao, fir script chalao."
    exit 1
fi

echo -e "\e[1;36m[+] Shortcuts (Commands) Set Ho Rahe Hain...\e[0m"
sed -i '/alias imp3/d' ~/.bashrc
sed -i '/alias imp4/d' ~/.bashrc
sed -i '/alias ymp3/d' ~/.bashrc
sed -i '/alias ymp4/d' ~/.bashrc
sed -i '/alias play/d' ~/.bashrc

# Naye Shortcuts
echo 'alias ymp4="python /storage/emulated/0/MirrorNotes/downloader.py youtube mp4"' >> ~/.bashrc
echo 'alias ymp3="python /storage/emulated/0/MirrorNotes/downloader.py youtube mp3"' >> ~/.bashrc
echo 'alias imp4="python /storage/emulated/0/MirrorNotes/downloader.py insta mp4"' >> ~/.bashrc
echo 'alias imp3="python /storage/emulated/0/MirrorNotes/downloader.py insta mp3"' >> ~/.bashrc
echo 'alias play="python /storage/emulated/0/MirrorNotes/player.py"' >> ~/.bashrc

echo -e "\e[1;32m[+] SETUP COMPLETE! 🎉\e[0m"
echo -e "Termux me yeh type karke shortcuts chalu karo: source ~/.bashrc"
