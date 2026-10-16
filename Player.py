import os
import sys

def play_playlist():
    file_path = "/storage/emulated/0/MirrorNotes/rehan.music"
    
    # Check for both with and without .txt extension
    if not os.path.exists(file_path):
        file_path += ".txt"
        if not os.path.exists(file_path):
            print("[-] 'rehan.music' file nahi mili MirrorNotes folder me!")
            return
            
    with open(file_path, "r", encoding="utf-8") as f:
        songs = [line.strip() for line in f if line.strip()]
        
    if not songs:
        print("[-] 'rehan.music' file khali hai!")
        return
        
    print(f"\n[+] Total {len(songs)} gaane mile hain!")
    
    for i, song in enumerate(songs, 1):
        print(f"\n================================")
        print(f"🎵 ({i}/{len(songs)}) PLAYING: {song}")
        print(f"================================")
        
        url_cmd = "yt-dlp -f bestaudio -g 'ytsearch1:" + song + "'"
        stream_url = os.popen(url_cmd).read().strip()
        
        if stream_url:
            os.system("mpv --no-video '" + stream_url + "'")
        else:
            print("[-] Link nahi mila!")
            
    print("\n[+] Playlist khatam! 🎉")

if __name__ == "__main__":
    os.system('clear')
    play_playlist()
  
