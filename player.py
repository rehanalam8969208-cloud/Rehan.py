import os

# Retro Music Colors
CYAN = '\033[96m'
YELLOW = '\033[93m'
GREEN = '\033[92m'
WHITE = '\033[97m'
RESET = '\033[0m'

def print_cassette(song_name, current, total):
    os.system('clear')
    print(f"{CYAN}   ___________________________________ {RESET}")
    print(f"{CYAN}  / {YELLOW}REHAN MUSIC PLAYER{CYAN}                \ {RESET}")
    print(f"{CYAN} / {WHITE}TRACK: {current}/{total}{CYAN}                        \ {RESET}")
    print(f"{CYAN}|  =================================  |{RESET}")
    print(f"{CYAN}|  | {WHITE}{song_name[:27].ljust(27)}{CYAN} |  |{RESET}")
    print(f"{CYAN}|  |                                 |  |{RESET}")
    print(f"{CYAN}|  |    {GREEN}(O){CYAN}                   {GREEN}(O){CYAN}    |  |{RESET}")
    print(f"{CYAN}|  =================================  |{RESET}")
    print(f"{CYAN} \___________________________________/ {RESET}")
    print(f"\n{YELLOW}[*] Streaming directly from servers... Enjoy!{RESET}\n")

def play_playlist():
    file_path = "/storage/emulated/0/MirrorNotes/music"
    
    if not os.path.exists(file_path):
        print(f"{YELLOW}[-] 'music' file nahi mili!{RESET}")
        return
            
    with open(file_path, "r", encoding="utf-8") as f:
        songs = [line.strip() for line in f if line.strip()]
        
    if not songs:
        print(f"{YELLOW}[-] 'music' file khali hai!{RESET}")
        return
        
    for i, song in enumerate(songs, 1):
        print_cassette(song, i, len(songs))
        
        url_cmd = "yt-dlp -f bestaudio -g 'ytsearch1:" + song + "'"
        stream_url = os.popen(url_cmd).read().strip()
        
        if stream_url:
            # Termux me background noise hatane ke liye msg-level info chupaya hai
            os.system(f"mpv --no-video --msg-level=all=warn '{stream_url}'")
        else:
            print(f"{YELLOW}[-] Link nahi mila!{RESET}")
            
    print(f"\n{GREEN}✨ Playlist khatam! ✨{RESET}")

if __name__ == "__main__":
    play_playlist()
    
