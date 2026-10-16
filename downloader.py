import os
import sys

# Colors
PINK = '\033[38;5;206m'
BLUE = '\033[38;5;39m'
WHITE = '\033[1;37m'
RESET = '\033[0m'

def download_media(platform_file, format_type):
    file_path = f"/storage/emulated/0/MirrorNotes/{platform_file}"
    save_path = "/storage/emulated/0/Download/%(title)s.%(ext)s"
    
    scan_cmd = "--exec \"am broadcast -a android.intent.action.MEDIA_SCANNER_SCAN_FILE -d file://{}\""
    
    if not os.path.exists(file_path):
        print(f"{PINK}[-] '{platform_file}' file nahi mili!{RESET}")
        return
            
    with open(file_path, "r", encoding="utf-8") as f:
        items = [line.strip() for line in f if line.strip()]
        
    if not items:
        print(f"{PINK}[-] '{platform_file}' file khali hai!{RESET}")
        return
        
    print(f"{BLUE}[+] Total {len(items)} items mile hain.{RESET}")
    
    for i, item in enumerate(items, 1):
        print(f"\n{BLUE}╭──────────────────────────────────────────────╮{RESET}")
        print(f"{BLUE}│ {PINK}📥 DOWNLOADING ({i}/{len(items)}): {WHITE}{format_type.upper()}{RESET}")
        print(f"{BLUE}│ {WHITE}🔗 {item[:35]}...{RESET}")
        print(f"{BLUE}╰──────────────────────────────────────────────╯{RESET}")
        
        query = f"'{item}'" if item.startswith("http") else f"'ytsearch1:{item}'"
        
        if format_type == "mp4":
            if platform_file == "youtube":
                cmd = f"yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' -o '{save_path}' {scan_cmd} {query}"
            else:
                cmd = f"yt-dlp -o '{save_path}' {scan_cmd} '{item}'"
        elif format_type == "mp3":
            cmd = f"yt-dlp -x --audio-format mp3 -o '{save_path}' {scan_cmd} {query}"
            
        os.system(cmd)
        
    print(f"\n{PINK}✨ DOWNLOAD COMPLETE! Check your Gallery/Music Player. ✨{RESET}")

if __name__ == "__main__":
    if len(sys.argv) < 3:
        sys.exit(1)
        
    platform_file = sys.argv[1] 
    format_type = sys.argv[2]   
    
    os.system('clear')
    print(f"{PINK}╔════════════════════════════════════════╗{RESET}")
    print(f"{PINK}║ {WHITE}  REHAN {platform_file.upper()} {format_type.upper()} DOWNLOADER {PINK} ║{RESET}")
    print(f"{PINK}╚════════════════════════════════════════╝{RESET}\n")
    download_media(platform_file, format_type)
    
