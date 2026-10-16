import os
import sys

def download_media(platform_file, format_type):
    file_path = f"/storage/emulated/0/MirrorNotes/{platform_file}"
    save_path = "/storage/emulated/0/Download/%(title)s.%(ext)s"
    
    # 🌟 Yahi wo jaadui command hai jo Android Gallery ko update karega 🌟
    scan_cmd = "--exec \"am broadcast -a android.intent.action.MEDIA_SCANNER_SCAN_FILE -d file://{}\""
    
    if not os.path.exists(file_path):
        print(f"[-] '{platform_file}' file nahi mili MirrorNotes me!")
        return
            
    with open(file_path, "r", encoding="utf-8") as f:
        items = [line.strip() for line in f if line.strip()]
        
    if not items:
        print(f"[-] '{platform_file}' file khali hai! Mirror app me isme link/naam dalo.")
        return
        
    print(f"\n[+] Total {len(items)} items mile hain '{platform_file}' me!")
    
    for i, item in enumerate(items, 1):
        print(f"\n================================")
        print(f"📥 ({i}/{len(items)}) DOWNLOADING ({format_type.upper()}): {item}")
        print(f"================================")
        
        query = f"'{item}'" if item.startswith("http") else f"'ytsearch1:{item}'"
        
        # Ab har download ke baad Gallery auto-scan hogi
        if format_type == "mp4":
            if platform_file == "youtube":
                cmd = f"yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' -o '{save_path}' {scan_cmd} {query}"
            else: # insta
                cmd = f"yt-dlp -o '{save_path}' {scan_cmd} '{item}'"
        elif format_type == "mp3":
            cmd = f"yt-dlp -x --audio-format mp3 -o '{save_path}' {scan_cmd} {query}"
            
        os.system(cmd)
        
    print(f"\n[+] Saare files Download folder me save ho gaye aur Gallery me update ho gaye! 🎉")

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Error: Command missing!")
        sys.exit(1)
        
    platform_file = sys.argv[1] 
    format_type = sys.argv[2]   
    
    os.system('clear')
    print(f"=== TERMUX {platform_file.upper()} {format_type.upper()} DOWNLOADER ===")
    download_media(platform_file, format_type)
    
