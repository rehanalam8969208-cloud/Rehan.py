#!/bin/bash

echo -e "\e[1;32m[+] Termux Storage Permission Maang Raha Hai...\e[0m"
termux-setup-storage
sleep 2

echo -e "\e[1;34m[+] Required Packages Install Ho Rahe Hain...\e[0m"
pkg update -y
pkg install python ffmpeg mpv x11-repo libxfixes -y
pip install yt-dlp

echo -e "\e[1;33m[+] MirrorNotes aur Download Folders Ban Rahe Hain...\e[0m"
mkdir -p /storage/emulated/0/MirrorNotes/YouTube
mkdir -p /storage/emulated/0/MirrorNotes/Instagram

echo -e "\e[1;35m[+] Player Script Set Kar Raha Hai...\e[0m"
cp player.py /storage/emulated/0/MirrorNotes/player.py

echo -e "\e[1;36m[+] Shortcuts (Commands) Set Ho Rahe Hain...\e[0m"
# Purane aliases hata do taaki double na ho
sed -i '/alias imp3/d' ~/.bashrc
sed -i '/alias imp4/d' ~/.bashrc
sed -i '/alias ymp3/d' ~/.bashrc
sed -i '/alias ymp4/d' ~/.bashrc
sed -i '/alias play/d' ~/.bashrc

# Naye Commands (Aliases) add karna
echo 'alias ymp4="yt-dlp -f '\''bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'\'' -o '\''/storage/emulated/0/MirrorNotes/YouTube/%(title)s.%(ext)s'\''"' >> ~/.bashrc
echo 'alias ymp3="yt-dlp -x --audio-format mp3 -o '\''/storage/emulated/0/MirrorNotes/YouTube/%(title)s.%(ext)s'\''"' >> ~/.bashrc
echo 'alias imp4="yt-dlp -o '\''/storage/emulated/0/MirrorNotes/Instagram/%(title)s.%(ext)s'\''"' >> ~/.bashrc
echo 'alias imp3="yt-dlp -x --audio-format mp3 -o '\''/storage/emulated/0/MirrorNotes/Instagram/%(title)s.%(ext)s'\''"' >> ~/.bashrc
echo 'alias play="python /storage/emulated/0/MirrorNotes/player.py"' >> ~/.bashrc

echo -e "\e[1;32m[+] SETUP COMPLETE! 🎉\e[0m"
echo -e "Ek baar Termux ko restart karo ya yeh type karo: source ~/.bashrc"
echo -e "Use Commands:"
echo -e "  ymp4 <link>  (YouTube Video)"
echo -e "  ymp3 <link>  (YouTube MP3)"
echo -e "  imp4 <link>  (Insta Video/Reel)"
echo -e "  imp3 <link>  (Insta MP3)"
echo -e "  play         (Play rehan.music playlist)"
